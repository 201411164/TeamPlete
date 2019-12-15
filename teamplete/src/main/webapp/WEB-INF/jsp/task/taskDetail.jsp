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
                    <div class="row breadcrumbs-top">
                        <div class="col-12 mb-1">
                            <h2 class=" text-primary text-bold-600 float-left mb-0 mr-2 ">${ taskDetail.title }</h2> 
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/team/${loginVO.memberid}">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/teamdetail/${taskDetail.teamId}">Team</a>
                                    </li>
                                    <li class="breadcrumb-item active" style="font-weight:600; font-family:'Noto Sans KR';">${ taskDetail.title }
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    
                    <c:if test="${ loginVO.memberid eq taskDetail.writerId }">
						<button id="createTaskBtn" class="btn round btn-success btn-sm mb-3"
							data-toggle="modal" data-target="#createTask"
							onclick="taskModify(${ taskDetail.taskId })"><i class="feather icon-edit mr-1"></i>태스크 수정</button>
						<button name="deleteTask" class="btn round btn-danger btn-sm mb-3 "
							onclick="taskDelete(${ taskDetail.taskId })" value="${ taskDetail.teamId }">
							<i class="feather icon-trash-2 mr-1"></i>글 삭제하기
						</button>					
						
						
					</c:if>
                </div>
            </div>
            
            		<!-- 태스크 수정 Modal -->
					
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
							<input type="hidden" name="teamId" value="${ taskDetail.teamId }">
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
				
			
			
			
			
			
			
			
			
			
			
			<div>
			
			
			
			
			
			
						<div class="row" >
			
			
			
		<!-- Begin: 제출 현황-->
			
			
			<div class="col-xl-4 col-md-6 col-sm-6">
								<div class="card">
									<div class="card-header d-flex justify-content-between">
<!-- 										제출자는 등록된 담당자만 따로 나눠서 보여주는게 아니라 board의 모든 목록을 보여주는걸로 -->
										<h4 class="text-primary">제출 현황</h4>
										<i class="feather icon-more-horizontal cursor-pointer"></i>
									</div>
									<div class="card-body">


							<section id="accordion">
							<div class="row">
								<div class="col-sm-12 mr-3  pl-0 ">
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
																	<c:when test="${fn:startsWith(board.profile, 'circle')}">

																					<div class="avatar mr-50">
																						<div
																							style="position: relative; text-align: center; color: white;">
																							<img
																								src="${ pageContext.request.contextPath }/resources/images/${ board.profile }"
																								alt="avtar img holder" height="35" width="35">
																							<div class="custom-avatar-container">
																								<c:set var="membername" value="${ board.writerName }" />
																								<c:set var="firstletter"
																									value="${fn:substring(membername, 0, 1)}" />${firstletter}
																							</div>
																						</div>
																					</div>
																				</c:when>

																				<c:when test="${empty board.profile}">

																					<div class="avatar mr-50">
																						<div
																							style="position: relative; text-align: center; color: white;">
																							<img
																								src="${ pageContext.request.contextPath }/resources/images/circle1.png"
																								alt="avtar img holder" height="35" width="35">
																							<div class="custom-avatar-container">
																								<c:set var="membername" value="${ board.writerName }" />
																								<c:set var="firstletter"
																									value="${fn:substring(membername, 0, 1)}" />${firstletter}
																							</div>
																						</div>
																					</div>



																				</c:when>

																				<c:otherwise>

																					<div class="avatar mr-50">
																						<div
																							style="position: relative; text-align: center; color: white;">
																							<img src="${ board.profile }"
																								alt="avtar img holder" height="35" width="35">

																						</div>
																					</div>

																				</c:otherwise>
																</c:choose>
																<div class="user-page-info">
																	<h5 class="mb-0" style="font-weight: 600; display: inline;">${board.writerName }</h5>
																	<p style="display: inline;">${ board.boardDate }</p>
																	<h6>${board.title }</h6>
																	


																</div>

															</div>
														</div>



													</div>



													<div id="accordion${count4}" role="tabpanel"
														data-parent="#accordionWrapa1"
														aria-labelledby="heading${count4}" class="collapse">
														<div class="card-content">
														
															<ul class="list-group list-group-flush">
														
															<li class="list-group-item d-flex">
															<div class="card-body">${ fn:replace(board.content, newLineChar, "<br/>") }
															
															</div>
															</li>
															
															<li class="list-group-item d-flex">
															<p class="float-left mb-0">
															<i class="feather icon-download mr-1"></i>
														</p> <span><strong>첨부파일 :</strong>
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
																	</span>
														
															</li>
															
															</ul>		
														</div>
														<c:if test="${ loginVO.memberid eq board.writerId }">
														<button name="modifyBoard" id="modifyBoard" onClick="modifyBoard(${ board.boardId })">수정</button>
														<button name="deleteBoard" id="deleteBoard" onClick="deleteBoard(${ board.boardId })">삭제</button>
														</c:if>
													</div>


												</c:forEach>
											</div>


										</div>
									</div>
								</div>
							</div>

							</section>
							
									</div>
								</div>
								
								
							
							
							
							
								
								<!-- Begin: 미제출자 정보 보여주기-->							
							
							
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
												
											<c:when test="${fn:startsWith(submitNmem.profile, 'circle')}">

												


													<div
														class="d-flex justify-content-start align-items-center mb-1">
																												
														<div class="avatar mr-50">
															<div
																style="position: relative; text-align: center; color: white;">
																<img
																	src="${ pageContext.request.contextPath }/resources/images/${ submitNmem.profile }"
																	alt="avtar img holder" height="35" width="35">
																<div class="custom-avatar-container">
																	<c:set var="membername" value="${ submitNmem.name }" />
																	<c:set var="firstletter"
																		value="${fn:substring(membername, 0, 1)}" />${firstletter}
																</div>
															</div>
														</div>
														<div class="user-page-info">
															<h5 class="mb-0" style="font-weight: 600;">${ submitNmem.name }</h5>
															<span class="font-small-3">파일 미제출</span>
														</div>
													</div>


												</c:when>
												<c:when test="${empty submitNmem.profile}">
												<div
														class="d-flex justify-content-start align-items-center mb-1">
														<div class="avatar mr-50">
															<div
																style="position: relative; text-align: center; color: white;">
																<img
																	src="${ pageContext.request.contextPath }/resources/images/circle1.png"
																	alt="avtar img holder" height="35" width="35">
																<div class="custom-avatar-container">
																	<c:set var="membername" value="${ submitNmem.name }" />
																	<c:set var="firstletter"
																		value="${fn:substring(membername, 0, 1)}" />${firstletter}
																</div>
															</div>
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
														<div class="avatar mr-50">
															<div
																style="position: relative; text-align: center; color: white;">
																<img
																	src="${ submitNmem.profile }"
																	alt="avtar img holder" height="35" width="35">
																
															</div>
														</div>
														<div class="user-page-info">
															<h5 class="mb-0" style="font-weight: 600;">${ submitNmem.name }</h5>
															<span class="font-small-3">파일 미제출</span>
														</div>
													</div>
															</c:otherwise>
														</c:choose>	
												
										</c:forEach>
										
									</div>
								</div>
								
								<!-- END: 미제출자 정보 보여주기-->
								
								
								<!-- BEGIN: 파일 제출하기 폼-->
								
								
								<form method="post" enctype="multipart/form-data"
		action="${ pageContext.request.contextPath}/${ taskDetail.taskId }/board/write"
		name="boardWriteForm">
		<input type="hidden" name="writerId" value="${ loginVO.memberid }">
		<input type="hidden" name="writerName" value="${ loginVO.name }">
			<div class="card">
				<div class="card-content">
					<div class="card-header">
						<h4 class="card-title">파일 제출하기</h4>
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
									
									<textarea id="content" rows="5" class="form-control form-control-plaintext" name="content" placeholder="제출한 파일에 관한 내용을 입력하세요"></textarea>		
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
			</form>
							<!-- END: 파일 제출하기 폼-->	
								
							</div>
							

							<!-- END: 제출 현황-->
							<!-- Begin: task 정보 보여주기-->

							<div class="col-xl-8 col-lg-8 col-md-6 col-sm-6">
								<div class="card" id="showdetail">
									<div class="card-content">




										<div class="card-header d-flex justify-content-between">
											<h4 class="text-primary">${ taskDetail.title }</h4>
											<h6>작성일 : ${ taskDetail.taskDate }</h6>
											<i class="feather icon-more-horizontal cursor-pointer"></i>
										</div>
										<div class="card-body">



											<div class="col-12">

												<blockquote class="blockquote">
													<p class="font-medium-3" style="line-height: 1.8rem;">${ fn:replace(taskDetail.content, newLineChar, "<br/>") }
													</p>
													<footer class="blockquote-footer mt-1">작성자 :
													${taskDetail.writerName } </footer>
												</blockquote>
											</div>

											<ul class="list-group list-group-flush">

												<li class="list-group-item d-flex">
													<p class="float-left mb-0">
														<i class="feather icon-calendar mr-1"></i>
													</p> <span><strong>제출기한: </strong>${ taskDetail.deadline }
														(${ deadline })</span>
												</li>

												<li class="list-group-item d-flex">
													<p class="float-left mb-0">
														<i class="feather icon-download mr-1"></i>
													</p> <span><strong>첨부파일 :</strong> <c:forEach var="file"
															items="${ taskFileList }">
															<li class="list-group-item">
																<h6 class="text-nowrap"
																	style="white-space: nowrap; display: inline;"
																	id="fileName"
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
																</c:choose> </br>
															</li>
														</c:forEach> </span>


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
																		items="${ chargeListAll }">
																		<c:set var="count" value="${count + 1}" scope="page" />
																		<c:choose>
																			<c:when test="${ empty charge.profile }">
																				<li data-toggle="tooltip"
																					data-popup="tooltip-custom" data-placement="bottom"
																					data-original-title="${ charge.name }"
																					class="avatar pull-up ml-0">
																					<div class="avatar" style="margin:0;">
																						<div
																							style="position: relative; text-align: center; color: white; margin:0;">
																							<img
																								src="${ pageContext.request.contextPath }/resources/images/circle1.png"
																								alt="avtar img holder" height="50" width="50">
																							<div class="custom-avatar-container">
																								<c:set var="membername" value="${ charge.name }" />
																								<c:set var="firstletter"
																									value="${fn:substring(membername, 0, 1)}" />${firstletter}
																							</div>
																						</div>
																					</div>
																				</li>
																			</c:when>
																			<c:when test="${fn:startsWith(charge.profile, 'circle')}">
																				<li data-toggle="tooltip"
																					data-popup="tooltip-custom" data-placement="bottom"
																					data-original-title="${ charge.name }"
																					class="avatar pull-up ml-0">
																					<div class="avatar" style="margin:0;">
																						<div
																							style="position: relative; text-align: center; color: white; ">
																							<img
																								src="${ pageContext.request.contextPath }/resources/images/${charge.profile}"
																								alt="avtar img holder" height="50" width="50">
																							<div class="custom-avatar-container">
																								<c:set var="membername" value="${ charge.name }" />
																								<c:set var="firstletter"
																									value="${fn:substring(membername, 0, 1)}" />${firstletter}
																							</div>
																						</div>
																					</div>
																				</li>
																			</c:when>
																			<c:otherwise>

																				<li data-toggle="tooltip"
																					data-popup="tooltip-custom" data-placement="bottom"
																					data-original-title="${ charge.name }"
																					class="avatar pull-up ml-0">
																					<div class="avatar" style="margin:0;">
																						<div
																							style="position: relative; text-align: center; color: white; margin:0;">
																							<img
																								src="${charge.profile}"
																								alt="avtar img holder" height="50" width="50">
																							<div class="custom-avatar-container">
																								<c:set var="membername" value="${ charge.name }" />
																								<c:set var="firstletter"
																									value="${fn:substring(membername, 0, 1)}" />${firstletter}
																							</div>
																						</div>
																					</div>
																					</li>
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
																		items="${ submitNmembers }">
																		<c:set var="count" value="${count + 1}" scope="page" />
																		<c:choose>
																			<c:when test="${ empty submitNmem.profile }">
																				<li data-toggle="tooltip"
																					data-popup="tooltip-custom" data-placement="bottom"
																					data-original-title="${ submitNmem.name }"
																					class="avatar pull-up ml-0">
																					<div class="avatar" style="margin:0;">
																						<div
																							style="position: relative; text-align: center; color: white; margin:0;">
																							<img
																								src="${ pageContext.request.contextPath }/resources/images/circle1.png"
																								alt="avtar img holder" height="50" width="50">
																							<div class="custom-avatar-container">
																								<c:set var="membername" value="${ submitNmem.name }" />
																								<c:set var="firstletter"
																									value="${fn:substring(membername, 0, 1)}" />${firstletter}
																							</div>
																						</div>
																					</div>
																				</li>
																			</c:when>
																			<c:when test="${fn:startsWith(submitNmem.profile, 'circle')}">
																				<li data-toggle="tooltip"
																					data-popup="tooltip-custom" data-placement="bottom"
																					data-original-title="${ submitNmem.name }"
																					class="avatar pull-up ml-0">
																					<div class="avatar" style="margin:0;">
																						<div
																							style="position: relative; text-align: center; color: white; ">
																							<img
																								src="${ pageContext.request.contextPath }/resources/images/${submitNmem.profile}"
																								alt="avtar img holder" height="50" width="50">
																							<div class="custom-avatar-container">
																								<c:set var="membername" value="${ submitNmem.name }" />
																								<c:set var="firstletter"
																									value="${fn:substring(membername, 0, 1)}" />${firstletter}
																							</div>
																						</div>
																					</div>
																				</li>
																			</c:when>
																			<c:otherwise>

																				<li data-toggle="tooltip"
																					data-popup="tooltip-custom" data-placement="bottom"
																					data-original-title="${ submitNmem.name }"
																					class="avatar pull-up ml-0">
																					<div class="avatar" style="margin:0;">
																						<div
																							style="position: relative; text-align: center; color: white; margin:0;">
																							<img
																								src="${submitNmem.profile}"
																								alt="avtar img holder" height="50" width="50">
																							<div class="custom-avatar-container">
																								<c:set var="membername" value="${submitNmem.name }" />
																								<c:set var="firstletter"
																									value="${fn:substring(membername, 0, 1)}" />${firstletter}
																							</div>
																						</div>
																					</div>
																					</li>
																			</c:otherwise>
																		</c:choose>
																	</c:forEach>
																	
																</ul>
														</div>
													</div>
												</li>
											</ul>



										</div>
									</div>
								</div>
							</div>				
							
							<!-- END: task 정보 보여주기-->
							
							
							
							
							
							
							
		<!-- Begin: 파일 제출하기 폼-->
	
		<div class="col-xl-3 col-md-6 col-sm-6">
			
		</div>
		<!-- END: 파일 제출하기 폼-->
		
		
		
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
		
				
		 Swal.fire({
			 title: '정말로 삭제하시겠어요?',
			  text: '삭제하면 모든 정보를 되돌릴 수가 없습니다.',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: '네, 삭제하겠습니다!'
		}).then((result) => {
			  if (result.value) {
				  Swal.fire({
						  title: '삭제 성공',
						  text: '성공적으로 삭제하였습니다.',
						  type: 'success',
						  confirmButtonText: '좋아요'
				  }).then((result) => {
					  $.ajax({
							url : '/task/delete/' + taskId,
							type : 'DELETE'
						});
//							$('#taskTable').load(document.URL +  ' #taskTable');
						location.href = "${ pageContext.request.contextPath}/teamdetail/" + teamId;
					  
				  });
				 
			  };
			})
		
	}
	
	function deleteBoard(boardId) {
		
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url : '/board/delete/' + boardId,
				type : 'DELETE'
			});
			
			location.reload();
		} else return;
		
		Swal.fire({
			 title: '정말로 삭제하시겠어요?',
			  text: '삭제하면 모든 정보를 되돌릴 수가 없습니다.',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: '네, 삭제하겠습니다!'
		}).then((result) => {
			  if (result.value) {
				  Swal.fire({
						  title: '삭제 성공',
						  text: '성공적으로 삭제하였습니다.',
						  type: 'success',
						  confirmButtonText: '좋아요'
				  }).then((result) => {
					  $.ajax({
							url : '/board/delete/' + boardId,
							type : 'DELETE'
						});
					  
				  });
				 
			  };
			})
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
		   Swal.fire({
				  title: 'Error!',
				  text: '제목은 필수적으로 입력해주세요!',
				  type: 'error',
				  confirmButtonText: '네, 알겠어요!'
				})
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