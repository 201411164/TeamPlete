<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/drag-and-drop.css">
	
<!-- END: Page CSS-->

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

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
	
	<section>
	<div class="app-content content">
	 <div class="content-wrapper" id="contentWrapper">
	 
		<c:if test="${ not empty loginVO }">
		<div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0 ">최신 업데이트</h2>                            
                        </div>
                </div>
            </div>
<%-- 						<a href="${ pageContext.request.contextPath }/calendar">캘린더</a> --%>
			<div>
				
				
				<section id="draggable-cards">
                    <div class="row" id="card-drag-area">
                    <c:forEach var="team" items="${ teamList }" varStatus="status">
                        <div class="col-xl-3 col-md-6 col-sm-6">
                        	
                            <div class="card" id="showdetail">
                                                            
                                <div class="card-content">
                                    <div class="card-body">
                                    
                                    	<img class="teamImg" style="width: 100%; height: auto;"
								src="${ pageContext.request.contextPath }/resources/images/${ team.img }"
								alt="avatar">
                                        <div class="card-text">                                        
                                            <h2 class="text-bold-700" style="margin-top:7%;" onclick="teamDetail(${ team.teamId })" ><c:out value="${ team.teamName }" /></h2>
                                            <h6 class="text-bold-600"><c:out value="팀원: " /><strong style="color:#0275d8 !important"><c:out value="${ team.members }" /></strong></h6>									
											<h4 class="primary text-bold-400" style="margin-top:5%"><c:out value="과제 제출 기한: " /><strong class="text-bold-600 text-nowrap" style="color:red !important;"><c:out
										value="${ deadline[status.index] }" /></strong></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>    
                    </div>
                </section>
			</div>

			<!-- 			<section id="form-and-scrolling-components"> -->
			<div class="row match-height">
				<div class="col-xl-3 col-md-6 col-sm-6">
						<div class="card">							
									<h1 class="btn btn-outline-success"
										data-toggle="modal" data-target="#inlineForm" style="font-size:100px">+</h1>
										
									<!-- Modal -->
									<div class="modal fade text-left" id="inlineForm" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel33"
										aria-hidden="true">
										<div
											class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="myModalLabel33">새로운 팀 명을 입력해주세요.
														</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<form method="post"
													action="${pageContext.request.contextPath}/team/${loginVO.memberid}"
													name="createTeamForm">
													<input type="hidden" name="ownerId"
														value="${ loginVO.memberid }">
													<div class="modal-body">
														<label>Team Name: </label>
														<div class="form-group">
															<input type="text" name="teamName" id="teamName"
																placeholder="Team Name" class="form-control">
														</div>
														<label>deadline: (선택입니다) </label>
														<div class="form-group">
															<input type="date" name="deadline" id="deadline"
																placeholder="Deadline" class="form-control">
														</div>
														<div class="modal-footer">
										<button type="button" onClick="submit()"
																class="btn btn-primary" data-dismiss="modal">Create</button>

								

														</div>
													</div>
												</form>
											</div>
										</div>
									</div>

									
									
								</div>
					
					</div>
			</div>
<!-- 			</section> -->
		</c:if>
	</div>
	</div>
	</section>
	

	<footer> </footer>
	</c:otherwise>
	</c:choose>

	<!-- BEGIN: Vendor JS-->

	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->

    <script src="${ pageContext.request.contextPath }/resources/js/dragula.min.js"></script>
	<!-- END: Page Vendor JS-->



	<!-- BEGIN: Page JS-->
	<script src="${ pageContext.request.contextPath }/resources/js/drag-drop.js"></script>
	<!-- END: Page JS-->



	<script>


   function submit(){
	    var form = document.createTeamForm;
	    
	    form.submit();
	}
   
   function teamDetail(teamId) {
	    location.href = "${ pageContext.request.contextPath}/teamdetail/" + teamId;
	}
   
</script>

</body>
</html>