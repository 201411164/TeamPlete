<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script>
</script>

<style>
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
						<div class="content-header-left col-md-9 col-12 mb-1">
							<h2 class=" text-primary text-bold-600 float-left mb-0 mr-2 ">${ team.teamName }</h2>

							<c:if test="${ loginVO.memberid eq team.ownerId }">
								<button type="button" name="modify" id="modifyBtn"
									class="btn round btn-success mb-3 mr-1"
									onclick="modifyFunc(${ team.teamId })" data-toggle="modal"
									data-target="#updateTeam">
									<i class="feather icon-edit mr-1"></i>팀 정보 수정
								</button>
								<button type="button" name="delete"
									class="btn round btn-danger mb-3" value="${ team.teamId }">
									<i class="feather icon-trash-2 mr-1"></i>팀 삭제
								</button>

							</c:if>
							<c:if test="${ loginVO.memberid ne team.ownerId }">
								<button type="button" name="outTeam"
									class="btn round btn-danger mb-3" value="${ team.teamId }">
									<i class=""></i>팀 나가기
								</button>
							</c:if>
						</div>
					</div>




					<div>


						<section id="draggable-cards">
						<div class="row" id="card-drag-area">


							<div class="col-xl-3 col-md-6 col-sm-6">
								<div class="card">
									<div class="card-header d-flex justify-content-between">
										<h4 class="text-primary">팀 구성원</h4>
										<i class="feather icon-more-horizontal cursor-pointer"></i>
									</div>
									<div class="card-body">
										<c:set var="count1" value="0" scope="page" />
										<c:forEach items="${ members }" var="member">
											<c:set var="count" value="${count + 1}" scope="page" />

											<c:choose>
												<c:when test="${ not empty member.profile }">






													<div
														class="d-flex justify-content-start align-items-center mb-1">
														<div class="avatar mr-50">
															<img src="${ member.profile }" alt="avtar img holder"
																height="35" width="35">
														</div>
														<div class="user-page-info">
															<h5 class="mb-0" style="font-weight: 600;">${member.name }</h5>
															<span class="font-small-3">파일 제출 완료</span>
														</div>
													</div>


												</c:when>
												<c:otherwise>
													<div
														class="d-flex justify-content-start align-items-center mb-1">
														<div class="avatar ${colorlist[count%5]} mr-50">
															<div class="avatar-content"
																<c:set var = "membername" value = "${ member.name }"/>
																<c:set var = "firstletter" value = "${fn:substring(membername, 0, 1)}"/>>${firstletter}
															</div>
														</div>
														<div class="user-page-info">
															<h5 class="mb-0" style="font-weight: 600;">${member.name }</h5>
															<span class="font-small-3">파일 제출 완료</span>
														</div>
													</div>
												</c:otherwise>
											</c:choose>

										</c:forEach>


										<div class="card-header d-flex justify-content-between">
											<h4 class="text-primary">팀원 추가하기</h4>
										</div>
										<div class="card-body">
											<form method="post"
												action="${pageContext.request.contextPath}/teamdetail/${ team.teamId }"
												name="createTeamForm">
												<input type="hidden" name="teamId" id="teamId"
													value="${ team.teamId }"> <select
													class="select2 form-control" id="selectMulti"
													multiple="multiple">
													<c:forEach items="${ notTeamMembers }" var="allmember">
														<option>${ allmember.memberid }</option>
													</c:forEach>
												</select> <input type="hidden" name="memberId" id="memberId"
													value="$('#selectMulti').select2('data')">

												<button type="button" onClick="submitMember()"
													class="btn btn-primary round btn-block mt-1">
													<i class="feather icon-plus mr-25"></i>초대하기
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>





							


							<c:forEach var="task" items="${ taskList }" varStatus="status">


								<div class="col-lg-6 col-12">
									<div class="card" id="showdetail">
										<div class="card-content">




											<div class="card-header d-flex justify-content-between">
												<h4 class="text-primary">${task.title }</h4>
												<h6>작성일 : ${ task.taskDate }</h6>
												<i class="feather icon-more-horizontal cursor-pointer"></i>
											</div>
											<div class="card-body">



												<div class="col-12">

													<blockquote class="blockquote">
														<p class="font-medium-3" style="line-height: 1.8rem;">${ fn:replace(task.content, newLineChar, "<br/>") }</p>
														<footer class="blockquote-footer mt-1">작성자 :
														${task.writerName } </footer>
													</blockquote>
												</div>

												<ul class="list-group list-group-flush">

													<li class="list-group-item d-flex">
														<p class="float-left mb-0">
															<i class="feather icon-calendar mr-1"></i>
														</p> <span><strong>제출기한: </strong>${ task.deadline } (${ taskDeadline[status.index] })</span>
													</li>

													<li class="list-group-item d-flex">
														<p class="float-left mb-0">
															<i class="feather icon-download mr-1"></i>
														</p> <span><strong>첨부파일 :</strong> <c:forEach
																var="taskFile" items="${ taskFileList[status.index] }">

																<h6 class="text-nowrap"
																	style="white-space: nowrap; display: inline;"
																	id="fileName"
																	onClick="taskFileDown('filePath=${ taskFile.filePath }&fileNameKey=${ taskFile.fileNameKey }&fileName=${ taskFile.fileName }')">${ taskFile.fileName }</h6>
																<c:choose>
																	<c:when test="${ taskFile.fileSize >= 1024 }">
																		<h6 id="strong" style="display: inline;">
																			(
																			<fmt:formatNumber
																				value="${ taskFile.fileSize / 1024 }" pattern=".00" />
																			MB)
																		</h6>
																	</c:when>
																	<c:otherwise>
																		<h6 id="strong" style="display: inline;">(${ taskFile.fileSize }KB)</h6>
																	</c:otherwise>
																</c:choose>
																</br>

															</c:forEach></span>


													</li>
													<li class="list-group-item d-flex">
														<div
															class="d-flex justify-content-start align-items-center mb-1">
															<div class="user-page-info">
																<p class="float-left mb-0">
																	<i class="feather icon-user-check mr-1"></i>
																</p>
																<span><strong>담당자 :</strong></span>
																<ul class="list-unstyled users-list d-flex">



																	<c:forEach var="charge"
																		items="${ chargeMembers[status.index] }">
																		<c:set var="count" value="${count + 1}" scope="page" />
																		<c:choose>
																			<c:when test="${ empty charge.profile }">
																				<li data-toggle="tooltip"
																					data-popup="tooltip-custom" data-placement="bottom"
																					data-original-title="${ charge.name }"
																					class="avatar pull-up ml-0">
																					<div class="avatar avatar-sm ${colorlist[count%5]}">
																						<div class="avatar-content"
																							<c:set var = "chargename" value = "${ charge.name }"/>
																							<c:set var = "firstletter" value = "${fn:substring(chargename, 0, 1)}"/>>${firstletter}
																						</div>
																					</div>
																				</li>
																			</c:when>
																			<c:otherwise>

																				<li data-toggle="tooltip"
																					data-popup="tooltip-custom" data-placement="bottom"
																					data-original-title="${ charge.name }"
																					class="avatar pull-up ml-0"><img
																					class="media-object rounded-circle"
																					src="${ charge.profile }" alt="Avatar" height="30"
																					width="30"></li>
																			</c:otherwise>
																		</c:choose>
																	</c:forEach>
																</ul>
															</div>
														</div>
													</li>


													<li class="list-group-item d-flex">
														<div
															class="d-flex justify-content-start align-items-center mb-1">
															<div class="user-page-info">
																<p class="float-left mb-0">
																	<i class="feather icon-user-minus mr-1"></i>
																</p>
																<span><strong>미제출자 :</strong></span>

																<ul class="list-unstyled users-list d-flex">
																	<c:forEach var="submitNmem"
																		items="${ submitN[status.index] }">
																		<c:set var="count" value="${count + 1}" scope="page" />
																		<c:choose>
																			<c:when test="${ empty submitNmem.profile }">
																				<li data-toggle="tooltip"
																					data-popup="tooltip-custom" data-placement="bottom"
																					data-original-title="${ submitNmem.name }"
																					class="avatar pull-up ml-0">
																					<div class="avatar avatar-sm ${colorlist[count%5]}">
																						<div class="avatar-content"
																							<c:set var = "submitNname" value = "${ submitNmem.name }"/>
																							<c:set var = "firstletter" value = "${fn:substring(submitNname, 0, 1)}"/>>${firstletter}
																						</div>
																					</div>
																				</li>
																			</c:when>
																			<c:otherwise>

																				<li data-toggle="tooltip"
																					data-popup="tooltip-custom" data-placement="bottom"
																					data-original-title="${ submitNmem.name }"
																					class="avatar pull-up ml-0"><img
																					class="media-object rounded-circle"
																					src="${ submitNmem.profile }" alt="Avatar"
																					height="30" width="30"></li>
																			</c:otherwise>
																		</c:choose>
																	</c:forEach>
																</ul>
															</div>
														</div>
													</li>
												</ul>











												<button type="button"
													class="btn btn-primary btn-block  mb-1"
													onClick="taskDetail(${ task.taskId })">
													<i class="feather icon-plus mr-25"></i>파일 제출하기
												</button>
												<div>
													<c:if test="${ loginVO.memberid eq task.writerId }">
														<%--                      <button name="modifyTask" value="${ task.taskId }">수정</button> --%>
													</c:if>
												</div>
											</div>
										</div>
									</div>
								</div>


							</c:forEach>









						</div>



						<!-- 태스크 등록 Modal -->
						<button id="createTaskBtn" class="btn btn-success"
							data-toggle="modal" data-target="#createTask">태스크 등록</button>

						<div class="modal fade text-left" id="createTask" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
							<div
								class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel33">태스크를 추가해주세요.</h4>
										
										<p><strong style="color: red;">*</strong> 는 필수항목입니다.</p>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form method="post" enctype="multipart/form-data"
										action="${pageContext.request.contextPath}/teamdetail/${ team.teamId }/task"
										name="createTaskForm">
										<input type="hidden" name="writerId" id="writerId"
											value="${ loginVO.memberid }"> <input type="hidden"
											name="writerName" id="writerName" value="${ loginVO.name }">
										<input type="hidden" name="teamId" id="teamId"
											value="${ team.teamId }">
										<div class="modal-body">
											<label><strong style="color: red;">* </strong>Title:</label>
											<div class="form-group">
												<input type="text" class="form-control" name="title"
													id="title"></input>
											</div>
											<label><strong style="color: red;">* </strong>Content:</label>
											<div class="form-group">
												<textarea class="form-control" name="content" id="content"
													rows="5"></textarea>
											</div>
											<label>파일 첨부하기: </label>
											<div class="form-group">
												<div style="color: black;" id="taskFileForm">
													<button type="button"
														class="btn btn-outline-primary round btn-block"
														name="taskFileBtn" id="taskFileBtn">파일 추가</button>
												</div>
											</div>
											<label>deadline:</label>
											<div class="form-group">
												<input type="date" name="deadline" id="deadline"
													placeholder="Deadline" class="form-control">
											</div>
											<label>담당자: </label>
											<!-- 									<div class="form-group"> -->
											<!-- 										<input type="text" class="form-control" name="chargeMemberid" id="chargeMemberid"></input> -->
											<!-- 									</div> -->
											<select class="select2 form-control" id="selectMulti2"
												multiple="multiple">
												<c:forEach items="${ members }" var="member">
													<option>${member.memberid }</option>
												</c:forEach>
											</select> <input type="hidden" name="chargeMemberid"
												id="chargeMemberid"
												value="$('#selectMulti2').select2('data')">
											<div class="modal-footer">
												<button type="button" id="taskSubmit"
													class="btn btn-primary" onClick="submitTask()"
													data-dismiss="modal">Create</button>

											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					</section>
				</div>
			</div>
			</div>
			</section>
			</div>

			<!-- Modal3 (수정) -->
			<div class="modal fade text-left" id="updateTeam" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
				<div
					class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel33">팀의 정보를 수정해주세요.</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form method="post" name="modifyTeam">

							<div class="modal-body">
								<div class="form-group">
									<label>Team Name: </label>
									<div>
										<input type="text" name="teamName" id="teamNameM"
											class="form-control" value="${ team.teamName }" />
									</div>
									<label>deadline: (선택입니다) </label>
									<div class="form-group">
										<input type="date" name="deadline" id="deadlineM"
											class="form-control" value="${ team.deadline }" />
									</div>
									<div class="modal-footer">
										<button type="button" id="modifyButton" onClick="submit2()"
											class="btn btn-primary" data-dismiss="modal">Modify</button>
									</div>
								</div>
						</form>
					</div>
				</div>
			</div>
			</div>

			<!-- 태스크 조회, 태스크 추가 -->






			<footer> </footer>

		</c:otherwise>
	</c:choose>



	<!-- BEGIN: Vendor JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.sticky.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/dragula.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/drag-drop.js"></script>
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
	
	var index = 0;

	$("button[name='taskFileBtn']").click(function() {
	   $('#taskFileForm').append('<br name="taskfileBr' + index +'"><input type="file" id="taskFiles[' + index + ']" name="taskFiles[' + index + ']" value="">');
	   $('#taskFileForm').append('<button type="button" name="taskbtn'+index+'" class="btn black ml15" style="padding: 3px 5px 6px 5px; color: red;" onClick="deletetaskFile(' + index + ')">X</button>');
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
	
	function modifyFunc(modifyTeamId) {
		   id = modifyTeamId;
		   
	}

	
	   function submit2(){
		    var form2 = document.modifyTeam;
		    form2.action = "${pageContext.request.contextPath}/team/update/" + id;
		    form2.submit();
		}
	   
	   
	   
	   

   function submitMember(){
	    var form = document.createTeamForm;
	   
	    var array = $('#selectMulti').select2('data');
	    var memberList2=[];
	    var index= $('#selectMulti').select2('data').length;
	    for(i=0;i<index;i++){
			   memberList2.push(array[i].id);
	    }   
	    var result = confirm(memberList2 + "님을 팀에 추가하시겠습니까?");
	    if(result) {
	
	       $.ajax({
	          type : 'POST',
	          url : '/teamdetail/${ team.teamId }',
	          data : JSON.stringify(memberList2),
	          contentType : "application/json",
	          success : function(data) {
	        	  console.log(data);

// 	         	  $('#membersView').load(document.URL +  ' #membersView');
	        	  location.reload();
	          },
	          error : function(error) {
	        	  console.log(error);
	          }
	       });
	    }else {
	    	return;
	    }
	}
   
		
   
   function submitTask(){
	   
	   var form = document.createTaskForm;
	   
	   if (!form.title.value) {
	      alert('제목은 필수항목입니다.');
	      form.title.focus();
	      return false;
	   }else if (!form.content.value) {
		  alert('내용은 필수항목입니다.');
		  form.title.focus();
		  return false;
	   }
	   
	   var cnt = 0;
	   var fileList = new Array();
	   for(i = 0; i < index; i++) {
	      if(document.getElementById('taskFiles[' + i + ']')) {
	      if ($("input[name='taskFiles[" + i + "]']").val() != ""){
	         document.getElementById('taskFiles[' + i + ']').setAttribute('name', 'taskFiles[' + cnt + ']');
	         fileList.push($("input[name='taskFiles[" + i + "]']").val());
	         cnt ++;
	      }else {
	         $("br[name='taskfileBr" + i + "']").remove();
	         $("input[name='taskFiles[" + i + "]']").remove();
	         $("button[name='taskbtn" + i + "']").remove();
	      }
	      }
	   }
	   
	    var chargeArray = $('#selectMulti2').select2('data');
	    var chargeIndex= $('#selectMulti2').select2('data').length;
	    for(i=0;i<chargeIndex;i++){
			   $('#chargeMemberid').append('<input type="hidden" name="chargeMems['+i+']" value="'+chargeArray[i].id+'" />');
	    }  
	   
	    var createTaskForm = document.createTaskForm;
	    
	  	createTaskForm.submit();
   }
   
   	var taskId = '';
	$(document).ready(function() {
		
		
		 
		
		
		
		$("button[name='deleteTask']").click(function() {
			
			taskId = this.value;
			console.log(taskId);
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					url : '/task/delete/' + taskId,
					type : 'DELETE'
				});
// 				$('#taskTable').load(document.URL +  ' #taskTable');
				location.reload();
			} else return;

		});
		
	});
	
	var id = "";
	
	$("button[name='delete']").click(function() {
		id = this.value;
		console.log(id);
		if(confirm("팀을 삭제하시겠습니까?")){
			$.ajax({
				url : '/team/delete/' + id,
				type : 'DELETE'
			});
			
			location.href = "${ pageContext.request.contextPath}/team/${ loginVO.memberid }";
		} else return;

	});
	
	$("button[name='outTeam']").click(function() {
		var teamId = this.value;
		if(confirm("팀을 나가시겠습니까?")){
			$.ajax({
				url : '/team/outTeam/' + teamId + '/' + '${ loginVO.memberid }',
				type : 'DELETE'
			});
			
			
			location.href = "${ pageContext.request.contextPath}/team/${ loginVO.memberid }";
		} else return;

	});
	
	
	function taskFileDown(file){
	    location.href = "${ pageContext.request.contextPath}/fileDownload?" + file;
	}
	
	
	function taskDetail(id) {
		location.href = "/taskdetail/" + id;
	}
	

   
</script>
</body>
</html>