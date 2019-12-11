<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
	List<String> colorlist = new ArrayList<>();
	colorlist.add("bg-primary");
	colorlist.add("bg-info");
	colorlist.add("bg-warning");
	colorlist.add("bg-success");
	colorlist.add("bg-danger");
	request.setAttribute("colorlist", colorlist);
%>


<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/components.css">

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,600">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/select2.min.css">



<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/dark-layout.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/semi-dark-layout.css">

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/palette-gradient.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/authentication.css">
<!-- END: Page CSS-->

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>


  table {
    border: 1px solid black;
  }
  
    th, td {
    border: 1px solid black;
  }
  
#fileName:hover {
   text-decoration: underline;
}

</style>
</head>
<body>

	<c:choose>
	<c:when test="${ empty loginVO }">
	<% 
	response.sendRedirect("/");
	%>
	</c:when>
	<c:otherwise>

   <header> <jsp:include page="/WEB-INF/jsp/include/navbar.jsp" />
   </header>
   <div class="app-content content">
	 <div class="content-wrapper" id="contentWrapper">


	<div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                		<button onClick="backTeamDetail(${ taskDetail.teamId })">팀 페이지로 돌아가기</button>
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0 ">태스크 title: ${ taskDetail.title }</h2>                            
                        </div>  
                </div>
            </div>
            
            		<!-- 태스크 수정 Modal -->
					<c:if test="${ loginVO.memberid eq taskDetail.writerId }">
						<button id="createTaskBtn" class="btn btn-success"
							data-toggle="modal" data-target="#createTask"
							onclick="taskModify(${ taskDetail.taskId })">태스크 수정</button>
						<button name="deleteTask" class="btn btn-danger btn-block "
							onclick="taskDelete(${ taskDetail.taskId })" value="${ taskDetail.teamId }">
							<i class="feather icon-trash-2 mr-1"></i>글 삭제하기
						</button>
					</c:if>
					<div class="modal fade text-left" id="createTask" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
					<div
						class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
						role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel33">태스크를 추가해주세요.</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form method="post" name="modifyTask" enctype="multipart/form-data">
							<input type="hidden" name="writerId" id="writerId"
									value="${ loginVO.memberid }">
								<div class="modal-body">
									<label>Title: </label>
									<div class="form-group">
										<input type="text" class="form-control" name="title" id="title" value="${ taskDetail.title }"></input>
									</div>
									<label>Content: </label>
									<div class="form-group">
										<textarea class="form-control" name="content" id="content"
											rows="5">${ taskDetail.content }</textarea>
									</div>
									<div id="taskFileListForm">
									<label>파일 목록: </label>
									<c:forEach items="${ taskFileList }" var="taskFile">
										<span name="${ taskFile.fileNo }">${ taskFile.fileName }</span>
										<button type='button' name="${ taskFile.fileNo }" class='btn black ml15'
										style='padding: 3px 5px 6px 5px; color: red;'
										onClick="setDeleteFile(${ taskFile.fileNo })">삭제</button><br>
									</c:forEach>
									</div>
									<div style="color: black;" id="taskFileFormM">
										<button type="button"
											class="btn btn-outline-primary round btn-block"
											name="taskFileBtnM" id="taskFileBtnM">파일 추가</button>
									</div>
									<label>deadline: (선택입니다) </label>
														<div class="form-group">
															<input type="date" name="deadline" id="deadline"
																placeholder="Deadline" class="form-control" value="${ taskDetail.deadline }">
														</div>
											
									<label>등록된 담당자: </label>
									<div id="taskChargeListForm">		
									<c:forEach var="charge" items="${ chargeListAll }">
										<span name="${ charge.chargeId }">${ charge.name }</span>
										<button type='button' name="${ charge.chargeId }" class='btn black ml15'
										style='padding: 3px 5px 6px 5px; color: red;'
										onClick="setDeleteCharge(${ charge.chargeId })">X</button>
									</c:forEach>
									</div>
									</br>
									<label>담당자 추가: </label>
									<select class="select2 form-control" id="selectMulti3" multiple="multiple">
									<c:forEach var="notCharge" items="${ notChargeMembers }">
<%-- 									 <option value="${charge.chargeMemberid }" selected="selected">${charge.chargeMemberid }</option> --%>
										<option>${ notCharge.memberid }</option>
									 </c:forEach>
									</select> <input type="hidden" name="chargeMemberid" id="chargeMemberid"
													value="$('#selectMulti3').select2('data')">
													
									<div class="modal-footer">
										<button type="button" id="taskSubmit" class="btn btn-primary"
											onClick="submitModifyTask()" data-dismiss="modal">Modify</button>

									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		
			
			
			
			
			
			
			
			
			
			<div class="col-xl-4 col-md-6 col-sm-6">
								<div class="card">
									<div class="card-header d-flex justify-content-between">
<!-- 										제출자는 등록된 담당자만 따로 나눠서 보여주는게 아니라 board의 모든 목록을 보여주는걸로 -->
										<h4 class="text-primary">제출자</h4>
										<i class="feather icon-more-horizontal cursor-pointer"></i>
									</div>
									<div class="card-body">


							<section id="accordion">
							<div class="row">
								<div class="col-sm-12">
									<div id="accordionWrapa1" role="tablist"
										aria-multiselectable="true">
										<div class="card collapse-icon accordion-icon-rotate">


											<div class="accordion-default collapse-bordered">

												<c:set var="count4" value="0" scope="page" />
												<c:forEach items="${ boardList }" var="board"
													varStatus="status">
													<c:set var="count4" value="${count4 + 1}" scope="page" />


													<div class="card collapse-header">
														<div id="heading${count4}"
															class="card-header collapse-header"
															data-toggle="collapse" role="button"
															data-target="#accordion${count4}" aria-expanded="false"
															aria-controls="accordion${count4}">

															<div
																class="d-flex justify-content-start align-items-center mb-1">

																<c:choose>
																	<c:when test="${ not empty board.profile }">

																		<div class="avatar mr-50">
																			<img src="${ board.profile }" alt="avtar img holder"
																				height="35" width="35">
																		</div>
																	</c:when>
																	<c:otherwise>

																		<div class="avatar ${colorlist[count%5]} mr-50">
																			<div class="avatar-content"
																				<c:set var = "membername" value = "${ board.writerName }"/>
																				<c:set var = "firstletter" value = "${fn:substring(membername, 0, 1)}"/>>${firstletter}
																			</div>
																		</div>

																	</c:otherwise>
																</c:choose>
																<div class="user-page-info">
																	<h5 class="mb-0" style="font-weight: 600;">${board.writerName }</h5>

																	<c:forEach var="boardFile"
																		items="${ boardFileList[status.index] }">


																		<h6 class="text-nowrap"
																			style="white-space: nowrap; display: inline;"
																			id="fileName"
																			onClick="fileDown('filePath=${ boardFile.filePath }&fileNameKey=${ boardFile.fileNameKey }&fileName=${ boardFile.fileName }')">${ boardFile.fileName }</h6>
																		<c:choose>
																			<c:when test="${ boardFile.fileSize >= 1024 }">
																				<h6 id="strong" style="display: inline;">
																					(
																					<fmt:formatNumber
																						value="${ boardFile.fileSize / 1024 }"
																						pattern=".00" />
																					MB)
																				</h6>
																			</c:when>
																			<c:otherwise>
																				<h6 id="strong" style="display: inline;">(${ boardFile.fileSize }KB)</h6>
																			</c:otherwise>
																		</c:choose>



																	</c:forEach>


																</div>

															</div>
														</div>



													</div>



													<div id="accordion${count4}" role="tabpanel"
														data-parent="#accordionWrapa1"
														aria-labelledby="heading${count4}" class="collapse">
														<div class="card-content">
															<div class="card-body">${ fn:replace(board.content, newLineChar, "<br/>") }
															</div>
														</div>
													</div>


												</c:forEach>
											</div>


										</div>
									</div>
								</div>
							</div>

							</section>
							<button type="button" class="btn btn-primary w-100 mt-1">
											<i class="feather icon-plus mr-25"></i>Load More
										</button>
									</div>
								</div>
							</div>
							

							
							
							
							
			<div class="col-xl-4 col-md-6 col-sm-6">
								<div class="card">
									<div class="card-header d-flex justify-content-between">
										<h4 class="text-primary">미제출자</h4>
										<i class="feather icon-more-horizontal cursor-pointer"></i>
									</div>
									<div class="card-body">
										<c:set var="count1" value="0" scope="page" />
										<c:forEach items="${ submitNmembers }" var="submitNmem">
											<c:set var="count" value="${count + 1}" scope="page" />

											<c:choose>
												<c:when test="${ not empty submitNmem.profile }">






													<div
														class="d-flex justify-content-start align-items-center mb-1">
														<div class="avatar mr-50">
															<img src="${ submitNmem.profile }" alt="avtar img holder"
																height="35" width="35">
														</div>
														<div class="user-page-info">
															<h5 class="mb-0" style="font-weight: 600;">${ submitNmem.name }</h5>
															<span class="font-small-3">파일 미제출</span>
														</div>
													</div>


												</c:when>
												<c:otherwise>
													<div
														class="d-flex justify-content-start align-items-center mb-1">
														<div class="avatar ${colorlist[count%5]} mr-50">
															<div class="avatar-content"
																<c:set var = "membername" value = "${ submitNmem.name }"/>
																<c:set var = "firstletter" value = "${fn:substring(membername, 0, 1)}"/>>${firstletter}
															</div>
														</div>
														<div class="user-page-info">
															<h5 class="mb-0" style="font-weight: 600;">${ submitNmem.name }</h5>
															<span class="font-small-3">파일 제출 완료</span>
														</div>
													</div>
												</c:otherwise>
											</c:choose>

										</c:forEach>

										<button type="button" class="btn btn-primary w-100 mt-1">
											<i class="feather icon-plus mr-25"></i>Load More
										</button>
									</div>
								</div>
							</div>			
							
							
							
							
							

	<form method="post" enctype="multipart/form-data"
		action="${ pageContext.request.contextPath}/${ taskDetail.taskId }/board/write"
		name="boardWriteForm">
		<input type="hidden" name="writerId" value="${ loginVO.memberid }">
		<input type="hidden" name="writerName" value="${ loginVO.name }">
		<div class="col-xl-3 col-md-6 col-sm-6">
			<div class="card">
				<div class="card-content">
					<div class="card-header">
						<h4 class="card-title">글 추가하기</h4>
					</div>
					<div class="card-body">
						<div id="writeForm">
							<div class="form-body">
								<div class="form-group">
									<label for="title" class="sr-only">제목을 입력하세요</label> <input
										type="text" class="form-control form-control-plaintext" placeholder="제목을 입력하세요" name="title"
										required>
								</div>

								<div class="form-group">
									<label for="content" class="sr-only">내용</label>														
									
									<textarea id="content" rows="5" class="form-control form-control-plaintext" name="content" placeholder="내용을 입력하세요"></textarea>		
									<div style="color: black;" id="fileForm">
										<button type="button"
											class="btn btn-outline-primary round btn-block"
											name="fileBtn" id="fileBtn">파일 추가</button>
									</div>
								</div>


							</div>
						</div>
						<button type="button" onClick="checkForm()"
							id="submitbutton" class="btn btn-outline-success round btn-block">등록</button>
					</div>
				</div>
			</div>
		</div>
	</form>	
			
			
			


			<div class="col-xl-3 col-md-6 col-sm-6">
				<div class="card">
					<div class="card-content">						
						<div class="card-body">
						<div class="card-header">
							<h4 class="card-title">작성자 : <strong>${ taskDetail.writerName }</strong></h4>
						</div>
						<ul class="list-group list-group-flush">
						<li class="list-group-item">
                                           <h4 class="primary"
														>내용: ${ fn:replace(taskDetail.content, newLineChar, "<br/>") }</h4>
											<h4>마감날짜: ${ taskDetail.deadline }</h4>
                                        </li>
                                        
                        <c:forEach var="file" items="${ taskFileList }">
                        <li class="list-group-item">
										<h6 class="text-nowrap"
											style="white-space: nowrap; display: inline;" id="fileName"
											onClick="fileDown('filePath=${ file.filePath }&fileNameKey=${ file.fileNameKey }&fileName=${ file.fileName }')">${ file.fileName }</h6>
										<c:choose>
											<c:when test="${ file.fileSize >= 1024 }">
												<h6 id="strong" style="display: inline;">
													(
													<fmt:formatNumber value="${ file.fileSize / 1024 }"
 														pattern=".00" />
													MB)
												</h6>
											</c:when>
											<c:otherwise>
												<h6 id="strong" style="display: inline;">(${ file.fileSize }KB)</h6>
											</c:otherwise>
										</c:choose>
										</br>
										 </li>
									</c:forEach>                
                                        
						</ul>
						</div>
					</div>
					<div>				



<!-- 					<footer> </footer> -->
				</div>
			</div>
			</div>			
			
			</div>
			</div>
			
	</c:otherwise>
	</c:choose>



	<!-- BEGIN: Vendor JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.sticky.js"></script>
	    <script src="${ pageContext.request.contextPath }/resources/js/dragula.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/drag-drop.js"></script>    	
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/app-menu.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/app.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/components.js"></script>
	<!-- END: Theme JS-->

	<script
		src="${ pageContext.request.contextPath }/resources/js/select2.full.min.js"></script>
			<script
		src="${ pageContext.request.contextPath }/resources/js/form-select2.js"></script>
	<!-- BEGIN: Page JS-->
	<!-- END: Page JS-->
   
   
   
   <script>

   
   	function writeBoard(taskId) {
		taskId = taskId;
		location.href = "${ pageContext.request.contextPath}/" + taskId + "/board/write";
		   
	}
   	
   	function backTeamDetail(teamId) {
   		console.log(teamId);
   		location.href = "${ pageContext.request.contextPath}/teamdetail/" + teamId;
   	}
   	
   	
	var index2 = 0;

	$("button[name='taskFileBtnM']").click(function() {
	   $('#taskFileFormM').append('<br name="taskfileBr' + index2 +'"><input type="file" id="taskFiles[' + index2 + ']" name="taskFiles[' + index2 + ']" value="">');
	   $('#taskFileFormM').append('<button type="button" name="taskbtn'+index2+'" class="btn black ml15" style="padding: 3px 5px 6px 5px; color: red;" onClick="deletetaskFile(' + index2 + ')">X</button>');
	   console.log('<br><input type="file" id="taskFiles[' + index2 + ']" name="taskFiles[' + index2 + ']" value="">')
	   index2 += 1;
	});


	function deletetaskFile(idx) {
	   $("br[name='taskfileBr" + idx + "']").remove();
	   $("input[name='taskFiles[" + idx + "]']").remove();
	   $("button[name='taskbtn" + idx + "']").remove();
	   console.log(idx);
	}
	
	var id = '';
	
	function taskModify(taskId) {
		   id = taskId;
		   
	}
   	
   	
    function submitModifyTask(){
 	   
 	   var cnt = 0;
//  	   var fileList = new Array();
 	   for(i = 0; i < index2; i++) {
 	      if(document.getElementById('taskFiles[' + i + ']')) {
 	      if ($("input[name='taskFiles[" + i + "]']").val() != ""){
 	         document.getElementById('taskFiles[' + i + ']').setAttribute('name', 'taskFiles[' + cnt + ']');
 	         console.log(cnt + "번째 : " + $("input[name='taskFiles[" + i + "]']").val());
//  	         fileList.push($("input[name='taskFiles[" + i + "]']").val());
 	         cnt ++;
 	      }else {
 	         $("br[name='taskfileBr" + i + "']").remove();
 	         $("input[name='taskFiles[" + i + "]']").remove();
 	         $("button[name='taskbtn" + i + "']").remove();
 	      }
 	      }
 	   }
 	   
 	    var chargeArray = $('#selectMulti3').select2('data');
 	    var chargeIndex= $('#selectMulti3').select2('data').length;
 	    for(i=0;i<chargeIndex;i++){
 			   $('#chargeMemberid').append('<input type="hidden" name="chargeMems['+i+']" value="'+chargeArray[i].id+'" />');
 	    }  
 	   
 	    var modifyTask = document.modifyTask;
 	    modifyTask.action = "${pageContext.request.contextPath}/task/update/" + id;
 	    modifyTask.submit();

    }
    
    
	
	var teamId = '';
	function taskDelete(taskId) {
		
		teamId = $("button[name='deleteTask']").val();
		
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url : '/task/delete/' + taskId,
				type : 'DELETE'
			});
//				$('#taskTable').load(document.URL +  ' #taskTable');
			location.href = "${ pageContext.request.contextPath}/teamdetail/" + teamId;
		} else return;
		
	}
	
	
	
	
	
	
	
	var index = 0;

	$("button[name='fileBtn']").click(function() {
	   $('#fileForm').append('<br name="fileBr' + index +'"><input type="file" id="files[' + index + ']" name="files[' + index + ']" value="">');
	   $('#fileForm').append('<button type="button" name="btn'+index+'" class="btn black ml15" style="padding: 3px 5px 6px 5px; color: red;" onClick="deleteFile(' + index + ')">X</button>');
	   console.log('<br><input type="file" id="files[' + index + ']" name="files[' + index + ']" value="">')
	   index += 1;
	});



	function deleteFile(idx) {
	   $("br[name='fileBr" + idx + "']").remove();
	   $("input[name='files[" + idx + "]']").remove();
	   $("button[name='btn" + idx + "']").remove();
	   console.log(idx);
	}


	function checkForm() {	   
		
	   var form = document.boardWriteForm;
	   
	   if (!form.title.value) {
	      alert('제목은 필수항목입니다.');
	      form.title.focus();
	      return false;
	   }
	      
	   var cnt = 0;
	   for(i = 0; i < index; i++) {
	      if(document.getElementById('files[' + i + ']')) {
	      if ($("input[name='files[" + i + "]']").val() != ""){
	         document.getElementById('files[' + i + ']').setAttribute('name', 'files[' + cnt + ']');
	         cnt ++;
	      }else {
	         $("br[name='fileBr" + i + "']").remove();
	         $("input[name='files[" + i + "]']").remove();
	         $("button[name='btn" + i + "']").remove();
	      }
	      }
	   }
	   
	   form.submit();
	}
	
	
	function fileDown(file){
	    location.href = "${ pageContext.request.contextPath}/fileDownload?" + file;
	}
	
	
	
	var indexDTF = 0;
	function setDeleteFile(fileNo) {
		
		$('#taskFileListForm').append('<input type="hidden" id="deleteFiles[' + indexDTF + ']" name="deleteFiles[' + indexDTF + ']" value="' + fileNo + '"/>');
		   
		
		$("span[name='" + fileNo + "']").remove();
		$("button[name='" + fileNo + "']").remove();

		indexDTF += 1;
	}
	
	
	var indexDTC = 0;
	function setDeleteCharge(chargeId) {
		
		$('#taskChargeListForm').append('<input type="hidden" id="deleteCharge[' + indexDTC + ']" name="deleteCharge[' + indexDTC + ']" value="' + chargeId + '"/>');
		
		$("span[name='" + chargeId + "']").remove();
		$("button[name='" + chargeId + "']").remove();
		
		indexDTC += 1;
	}

   </script>
  

</body>
</html>