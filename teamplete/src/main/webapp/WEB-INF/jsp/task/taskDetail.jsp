<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					data-toggle="modal" data-target="#createTask" onclick="taskModify(${ taskDetail.taskId })">태스크 수정</button>
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
									<label>담당자: </label>
									<c:forEach var="charge" items="${ chargeListAll }">
										<c:out value="${ charge.name }"></c:out>
									</c:forEach>
									
									<select class="select2 form-control" id="selectMulti3" multiple="multiple">
									<c:forEach var="charge" items="${ chargeListAll }">
									 <option value="${charge.chargeMemberid }" selected="selected">${charge.chargeMemberid }</option>
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
			
			<button onClick="writeBoard(${ taskDetail.taskId })">글작성</button>
			
			<c:forEach var="board" items="${ boardList }">
			<h4>board title: ${ board.title }</h4>
			<h4>writer: ${ board.writerName }</h4>
			<h4>content: ${ fn:replace(board.content, newLineChar, "<br/>") }</h4>
			</c:forEach>
			
			
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
   	
   	
	var index = 0;

	$("button[name='taskFileBtnM']").click(function() {
	   $('#taskFileFormM').append('<br name="taskfileBr' + index +'"><input type="file" id="taskFiles[' + index + ']" name="taskFiles[' + index + ']" value="">');
	   $('#taskFileFormM').append('<button type="button" name="taskbtn'+index+'" class="btn black ml15" style="padding: 3px 5px 6px 5px; color: red;" onClick="deletetaskFile(' + index + ')">X</button>');
	   console.log('<br><input type="file" id="taskFiles[' + index + ']" name="taskFiles[' + index + ']" value="">')
	   index += 1;
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
 	   for(i = 0; i < index; i++) {
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
   </script>

</body>
</html>