<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
	href="https://rsms.me/inter/inter.css">
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
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/dashboard-analytics.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/card-analytics.css">	
<!-- END: Page CSS-->


<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
#fileName:hover {
	text-decoration: underline;
}
.body{
	font-family:'Inter';
}
#nsmttitle:hover{
	text-decoration:underline;
}
.ql-disabled{
border-style: none !important;
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

			<header>
<%-- 			<jsp:include page="/WEB-INF/jsp/include/navbar.jsp" /> --%>
				<c:import url="/navbar/${ loginVO.memberid }" />
			</header>

			<div class="app-content content">
				<div class="content-wrapper" id="contentWrapper">

					<div class="content-header row">

						<div class="content-header-left col-md-9 col-12 mb-2">
							<div class="row breadcrumbs-top">
								<div class="col-12 mb-1">
									<div class="col-xl-4 col-md-6 col-sm-6">
									<h2 class="text-bold-600 mt-1 mr-2 mb-1 " style="white-space:nowrap;">${ team.teamName }</h2>
									<fmt:formatNumber var="totalrate"
										value="${totalFileSize*100/102400}" maxFractionDigits="0" />

									<h5>팀 전체 용량의 <strong> ${totalrate}%</strong>을 사용중입니다.</h5>
									
									<div class="progress progress-bar-primary progress-lg" data-toggle="tooltip" data-placement="top" title="팀 하나당 최대 100MB의 파일을 저장할 수 있습니다.">
										<div class="progress-bar" role="progressbar" 
											aria-valuenow="${totalrate }" aria-valuemin="${totalrate }"
											aria-valuemax="100" style="width: ${totalrate }%">${totalrate }%</div>
									</div>
									</div>
									
								</div>
							</div>
							</div>

							<div
								class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
								<div class="form-group breadcrum-right">
								<div class="dropdown mt-1 ">
									<button
										class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle"
										type="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class="feather icon-settings"></i>
									</button>
									<div class="dropdown-menu dropdown-menu-right">
										<c:if test="${ loginVO.memberid eq team.ownerId }">
										<button type="button" name="modify" id="modifyBtn"
											class="dropdown-item"
											onclick="modifyFunc(${ team.teamId })" data-toggle="modal"
											data-target="#updateTeam">
											<i class="feather icon-edit mr-1"></i>팀 정보 수정
										</button>
										<button type="button" name="delete"
											class="dropdown-item" value="${ team.teamId }">
											<i class="feather icon-trash-2 mr-1"></i>팀 삭제
										</button>

									</c:if>
									<c:if test="${ loginVO.memberid ne team.ownerId }">
										<button type="button" name="outTeam"
											class="dropdown-item" value="${ team.teamId }">
											<i class=""></i>팀 나가기
										</button>
									</c:if>
									</div>
								</div>
							</div>
								
								
								
							</div>
							
							

							
						
					</div>
					
					
					
					
					
					
					
					




					<div>


						<div class="row" >


							<div class="col-xl-3 col-md-6 col-sm-6">
								<div class="card ">
									<div class="card-header d-flex justify-content-between">
										<h4 class="text-primary mr-1" style="font-family:'Inter'; font-weight:700; font-size:26px;">팀 구성원 -<small class="text-dark"> 총 <strong >${fn:length(members)}</strong> 명</small></h4>
										<i class="feather icon-more-horizontal cursor-pointer"></i>
									</div>
									<div class=" card-body nano" style="min-height:400px;">
									<div class="nano-content " >
										<c:forEach items="${ members }" var="member">

											<c:choose>
												 <c:when test="${fn:startsWith(member.profile, 'circle')}">

													<div
														class="d-flex justify-content-start align-items-center mb-1">
														<div class="avatar mr-50">
															<div
																style="position: relative; text-align: center; color: white;">
																<img
																	src="${ pageContext.request.contextPath }/resources/images/${member.profile}"
																	alt="avtar img holder" height="35" width="35">
																<div class="custom-avatar-container">
																	<c:set var="membername" value="${ member.name }" />
																	<c:set var="firstletter"
																		value="${fn:substring(membername, 0, 1)}" />${firstletter}
																</div>
															</div><span
																class="avatar-status-${member.status }" data-toggle="tooltip" data-placement="top" title="현재 상태 : ${member.status }"></span>
														</div>
														

														<div class="user-page-info">
														<c:choose>
															<c:when test="${ member.memberid eq team.ownerId }">
																<h5 class="mb-0 text-primary" style="font-weight: 600;">${member.name }
																<img data-toggle="tooltip" data-placement="top" title="이 팀의 팀장입니다!"
																		src="${ pageContext.request.contextPath }/resources/images/crown.png"
																		height="18" width="18" style="margin-bottom:4px;">																
																</h5>
																
															</c:when>
															<c:otherwise>
																<h5 class="mb-0" style="font-weight: 600;">${member.name }
																</h5>
															</c:otherwise>
														</c:choose>	
															<span class="font-small-3">마지막 접속 : ${member.last_date} </span>
														</div>
													</div>


												</c:when>
												<c:when test="${empty member.profile}">
												<div
														class="d-flex justify-content-start align-items-center mb-1">
														<div class="avatar mr-50">
															<div
																style="position: relative; text-align: center; color: white;">
																<img
																	src="${ pageContext.request.contextPath }/resources/images/circle1.png"
																	alt="avtar img holder" height="35" width="35">
																<div class="custom-avatar-container">
																	<c:set var="membername" value="${ member.name }" />
																	<c:set var="firstletter"
																		value="${fn:substring(membername, 0, 1)}" />${firstletter}
																</div>
															</div>
															<span
																class="avatar-status-${member.status }" data-toggle="tooltip" data-placement="top" title="현재 상태 : ${member.status }"></span>
														</div>
														

														<div class="user-page-info">
															<c:choose>
															<c:when test="${ member.memberid eq team.ownerId }">
																<h5 class="mb-0 text-primary" style="font-weight: 600;">${member.name }
																<img data-toggle="tooltip" data-placement="top" title="이 팀의 팀장입니다!"
																		src="${ pageContext.request.contextPath }/resources/images/crown.png"
																		height="18" width="18" style="margin-bottom:4px;">																
																</h5>
																
															</c:when>
															<c:otherwise>
																<h5 class="mb-0" style="font-weight: 600;">${member.name }
																</h5>
															</c:otherwise>
														</c:choose>	
															
															<span class="font-small-3">마지막 접속 : ${member.last_date}</span>
														</div>
													</div>
												
												</c:when>
												<c:otherwise>
													<div
														class="d-flex justify-content-start align-items-center mb-1">
														<div class="avatar mr-50">
															<img src="${ member.profile }" alt="avtar img holder"
																height="35" width="35">
																<span
																class="avatar-status-${member.status }" data-toggle="tooltip" data-placement="top" title="현재 상태 : ${member.status }"></span>
														</div>
														
														<div class="user-page-info">
															<c:choose>
															<c:when test="${ member.memberid eq team.ownerId }">
																<h5 class="mb-0 text-primary" style="font-weight: 600;">${member.name }
																<img data-toggle="tooltip" data-placement="top" title="이 팀의 팀장입니다!"
																		src="${ pageContext.request.contextPath }/resources/images/crown.png"
																		height="18" width="18" style="margin-bottom:4px;">																
																</h5>
																
															</c:when>
															<c:otherwise>
																<h5 class="mb-0" style="font-weight: 600;">${member.name }
																</h5>
															</c:otherwise>
														</c:choose>	
															
															<span class="font-small-3">마지막 접속 : ${member.last_date}</span>
														</div>
													</div>
												</c:otherwise>
											</c:choose>

										</c:forEach>
										


										
									</div>
									
									</div>
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




								<div class="col-xl-3 col-md-6 col-sm-6">
									<div class="card bg-analytics text-white" id="dashboard-analytics" style="max-height:100%;">
										<div class="card-content">
										<div class="card-body text-center" style="color:#98a8b9">
												<img
													src="${ pageContext.request.contextPath }/resources/images/decore-left.png"
													class="img-left" alt="
            card-img-left"> <img
													src="${ pageContext.request.contextPath }/resources/images/decore-right.png"
													class="img-right" alt="
            card-img-right">
												<div class="avatar avatar-xl bg-primary shadow mt-0">
													<div class="avatar-content">
														<i class="feather icon-award white font-large-1"></i>
													</div>
												</div>
												
											<h4 class="mt-2" style="font-family:'Inter';"><strong>${loginVO.name}</strong>님, 환영합니다.</h4>	
											
												
												
											
											<c:set var="nScount" value="0" scope="page" />	
											
											<c:forEach items="${ notSubmitMyTask }" var="nsmt"
												varStatus="status">
												
												<c:if test="${ nsmt.chargeMemberid eq loginVO.memberid }">
												<c:set var="nScount" value="${nScount + 1}" scope="page" />
													<a onClick="taskDetail(${ nsmt.taskId })"><h5 class="mt-1 text-primary" id="nsmttitle">${ nsmt.title }</h5></a>
													<p>제출기한: ${ nsmt.deadline } (${ notSubmitMyTaskDeadline[status.index] })</p>
													
												</c:if>
											</c:forEach>
											<div class="text-center">
													
													<c:choose>
											<c:when test="${nScount eq 0 }">>
											<h4 class="mt-2" style="font-family:'Inter'; font-weight:600;">모든 과제를 다 제출했어요.</h4>
											</c:when>
											<c:otherwise>
											<h4 class="mt-2" style="font-family:'Inter';">총 <strong>${nScount}</strong>개의 과제가 남아있어요</h4>
											</c:otherwise>
											</c:choose>	
													
													
													
													
													
												</div>
											</div>
										</div>
									</div>
								</div>



							<c:set var="tcount" value="0" scope="page" />	
							<c:forEach var="task" items="${ taskList }" varStatus="status">
							<c:set var="tcount" value="${tcount+1 }" scope="page" />	
								<div class="col-lg-6 col-12">
									<div class="card" id="showdetail">
										<div class="card-content">




											
												
												<div class="card-header d-flex justify-content-between">
										<h4 class="text-primary" style="font-family:'Inter'; font-weight:700; font-size:26px;">${task.title }</h4>
										<i class="feather icon-more-horizontal cursor-pointer"></i>
									</div>

											<div class="card-body">

														<%-- <p class="font-medium-3" style="line-height: 1.8rem;">${ fn:replace(task.content, newLineChar, "<br/>") }</p> --%>
												
												<div id="editor-readonly${tcount}">
												<p></p>
												</div>
												<script>
												var options = {
														  debug: 'info',
														  modules: {
														    toolbar: false
														  },
														  readOnly: true,
														  theme: 'snow'
														};
												var quill${tcount} = new Quill('#editor-readonly${tcount}', options);
												
												quill${tcount}.setContents(${task.taskContent});
												</script>

												<div class="col-12">


													<c:forEach items="${ members }" var="member">
													<c:if test="${member.memberid eq task.writerId}">

													<div class="media">
														<div class="media-body text-right">
															<c:choose>
															<c:when test="${ member.memberid eq team.ownerId }">
																<h4 class="mt-1 media-heading" style="font-weight: 600;">${member.name }
																<img data-toggle="tooltip" data-placement="top" title="이 팀의 팀장입니다!"
																		src="${ pageContext.request.contextPath }/resources/images/crown.png"
																		height="18" width="18" style="margin-bottom:4px;">																
																</h4>
																${ task.taskDate }
															</c:when>
															<c:otherwise>																
																<h4 class="media-heading">${member.name }</h4>
																${ task.taskDate }
															</c:otherwise>
														</c:choose>	
															
														</div>
														<div class="media-right avatar">
															<div
																style="position: relative; text-align: center; color: white;">
																<img
																	src="${ pageContext.request.contextPath }/resources/images/${member.profile}"
																	alt="avtar img holder" height="64" width="64">
																<div class="custom-avatar-container" style="font-size:1.2rem;">
																	<c:set var="membername" value="${ member.name }" />
																	<c:set var="firstletter"
																		value="${fn:substring(membername, 0, 3)}" />${firstletter}
																</div>
															</div>
														</div>
													</div>
													</c:if>																	
														</c:forEach>
														</div>
												</div>

												<ul class="list-group list-group-flush">

													<li class="list-group-item d-flex">
														<p class="float-left mb-0">
															<i class="feather icon-calendar mr-1"></i>
														</p> <span><strong style="color:#0188CC;">제출기한: </strong>${ task.deadline } (${ taskDeadline[status.index] })</span>
													</li>

													<li class="list-group-item d-flex">
														<p class="float-left mb-0">
															<i class="feather icon-download mr-1"></i>
														</p> <span><strong style="color:#0188CC;">첨부파일 :</strong> <c:forEach
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
																<span><strong style="color:#0188CC;">담당자 :</strong></span>
																<ul class="list-unstyled users-list d-flex">



																	<c:forEach var="charge"
																		items="${ chargeMembers[status.index] }">
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
																<span><strong style="color:#0188CC;">미제출자 :</strong></span>

																<ul class="list-unstyled users-list d-flex">
																																	
																	
																	<c:forEach var="submitNmem"
																		items="${ submitN[status.index] }">
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


							</c:forEach>









						</div>
						
						
						
						<div class="row" >




						<div class="col-xl-3 col-md-6 col-sm-6">
						<div class="card">
						
						<div class="card-content">
                                    <div class="card-body">
                                    
                                    	
                                        <h1 class="btn btn-outline-primary btn-block" id="createTaskBtn"
										data-toggle="modal" data-target="#createTask" style="font-size:230px">+</h1>
                                    </div>
                               
                       </div>
                       </div>
						</div>
						</div>	
						<!-- 태스크 등록 Modal -->
						

						<div class="modal fade text-left" id="createTask" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
							<div
								class="modal-dialog modal-lg modal-dialog-scrollable"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel33">새로운 카드를 추가해주세요.</h4>
										
										<p><strong style="color: red;">*</strong> 는 필수항목입니다.</p>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>

									

									<form method="post" enctype="multipart/form-data"
										action="${pageContext.request.contextPath}/teamdetail/${ team.teamId }/task"
										name="createTaskForm" id="createTaskForm" style="overflow-y:auto;">
										<input type="hidden" name="writerId" id="writerId"
											value="${ loginVO.memberid }"> <input type="hidden"
											name="writerName" id="writerName" value="${ loginVO.name }">
										<input type="hidden" name="teamId" id="teamId"
											value="${ team.teamId }">
										<div class="modal-body" ">
											<label><strong style="color: red;">* </strong>제목:</label>
											<div class="form-group">
												<input type="text" class="form-control" name="title"
													id="title"></input>
											</div>
											<label><strong style="color: red;">* </strong>내용:</label>
											<div class="form-group" >
															<div id="editor-container" >
															<p></p>
															<br/>
															<p></p>
															<br/>
															<p></p>
															</div>
															<input name="taskContent" id="taskContent" type="hidden">
														</div>
											<label>파일 첨부하기: </label>
											<div class="form-group" >
												<div style="color: black;" id="taskFileForm">
													<button type="button"
														class="btn btn-outline-primary round btn-block"
														name="taskFileBtn" id="taskFileBtn">파일 추가</button>
												</div>
											</div>
											

											<label>마감일:</label>
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
													data-dismiss="modal">카드 생성하기</button>

											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						
						
						
						
						
						
						
						
						
					</div>
				</div>
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
	
	





			<footer> </footer>

		</c:otherwise>
	</c:choose>



	<!-- BEGIN: Vendor JS-->
	
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
	    if(memberList2 != "") {
		    
		    Swal.fire({
				  title: '팀원 추가',
				  text: memberList2 + '님을 팀에 추가하시겠습니까?',
				  type: 'success',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  confirmButtonText: '네, 추가하겠습니다!'
			}).then((result) => {
				  if (result.value) {
					  Swal.fire({
							  title: '팀원 추가 성공',
							  text: '일꾼이 늘었군요! 축하드려요',
							  type: 'success',
							  confirmButtonText: '좋아요'
					  }).then((result) => {
						  $.ajax({
					          type : 'POST',
					          url : '/teamdetail/${ team.teamId }',
					          data : JSON.stringify(memberList2),
					          contentType : "application/json",
					          success : function(data) {
					        	  console.log(data);

//				 	         	  $('#membersView').load(document.URL +  ' #membersView');
					        	  location.reload();
					          },
					          error : function(error) {
					        	  console.log(error);
					          }
					       });
						  
					  });
					  
					  
					 
				  };
				})
		    
		    
		    

	};
   }
   var toolbarOptions = [
       ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
       ['blockquote', 'code-block'],

       [{ 'header': 1 }, { 'header': 2 }],               // custom button values
       [{ 'list': 'ordered'}, { 'list': 'bullet' }],
       [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
       [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
       [{ 'direction': 'rtl' }],                         // text direction

       [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
       [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
       [ 'link', 'image', 'video', 'formula' ],          // add's image support
       [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
       [{ 'font': [] }],
       [{ 'align': [] }],

       ['clean']                                         // remove formatting button
   ];
   
   
   var quill = new Quill('#editor-container', {
	   modules: {
			toolbar: toolbarOptions
		},
	   theme: 'snow'
	 });
  
   $('input[name=taskContent]').change( function(e) {
	    e.preventDefault();
	    setTimeout( function () {
	    	$('#createTask').modal('handleUpdate')
	    } , 100 );
	});
  

   

   
   function submitTask(){
	   
	   var form = document.createTaskForm;
	   var about = document.querySelector('input[name=taskContent]');
	   about.value = JSON.stringify(quill.getContents());
	   var delta = quill.getContents();
	  
	   if (!form.title.value) {
	      Swal.fire({
			  title: 'Error!',
			  text: '제목은 필수적으로 입력해주세요!',
			  type: 'error',
			  confirmButtonText: '네, 알겠어요!'
			})
	      form.title.focus();
	      return false;
	   }else if (!about.value) {
			  Swal.fire({
				  title: 'Error!',
				  text: '내용은 필수적으로 입력해주세요!',
				  type: 'error',
				  confirmButtonText: '네, 알겠어요!'
				})
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
//			 				$('#taskTable').load(document.URL +  ' #taskTable');
							location.reload();
						  
					  });
					 
				  };
				})
			
			
			

		});
		
		
		
	});
	
	var id = "";
	
	$("button[name='delete']").click(function() {
		id = this.value;
		console.log(id);
			
			
			
			 Swal.fire({
				 title: '팀을 정말로 삭제하시겠어요?',
				  text: '팀을 삭제하면 모든 정보를 되돌릴 수가 없습니다.',
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  confirmButtonText: '네, 삭제하겠습니다!'
			}).then((result) => {
				  if (result.value) {
					  Swal.fire({
							  title: '팀 삭제 성공',
							  text: '팀을 성공적으로 삭제하였습니다.',
							  type: 'success',
							  confirmButtonText: '좋아요'
					  }).then((result) => {
						  $.ajax({
								url : '/team/delete/' + id,
								type : 'DELETE'
							});
							
							location.href = "${ pageContext.request.contextPath}/team/${ loginVO.memberid }";
						  
					  });
					 
				  };
				})

	});
	
	$("button[name='outTeam']").click(function() {
		var teamId = this.value;
		
		
		Swal.fire({
			 title: '팀 탈퇴',
			  text: '정말로 팀에서 나가시겠어요?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: '네, 나갈래요!'
		}).then((result) => {
			  if (result.value) {
				  Swal.fire({
						  title: '팀 탈퇴 성공',
						  text: '팀을 성공적으로 탈퇴하였습니다.',
						  type: 'success',
						  confirmButtonText: '알겠어요'
				  }).then((result) => {
					  $.ajax({
							url : '/team/outTeam/' + teamId + '/' + '${ loginVO.memberid }',
							type : 'DELETE'
						});
						
						
						location.href = "${ pageContext.request.contextPath}/team/${ loginVO.memberid }";
					  
				  });
				 
			  };
			})
		
		

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