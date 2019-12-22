<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			
			<div class="app-content content">
				<div class="content-wrapper" id="contentWrapper">
				<div class="col-lg-12 md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title" style="font-weight:600;">검색 결과</h3>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        
                                        <ul class="list-group list-group-flush">
                                        <c:forEach items="${ searchTeamList }" var="team" varStatus="status">
				<li class="list-group-item">
				<div
														class="d-flex justify-content-start align-items-center mb-1">
				<div class="avatar mr-50">
															<img src="${ pageContext.request.contextPath }/resources/images/${ team.img }" alt="avtar img holder"
																height="65" width="65">
														</div>
														
					<div class="user-page-info">
														
					<h3 class="text-primary mt-1 mb-0" style="font-weight:600;">${ team.teamName }</h3>
					<hr/>
					<h5 class="mb-1 mt-0 mr-2" style="font-weight: 600;">팀장 : 
																<img data-toggle="tooltip" data-placement="top" title="이 팀의 팀장입니다!"
																		src="${ pageContext.request.contextPath }/resources/images/crown.png"
																		height="18" width="18" style="margin-bottom:4px;">	${ team.name }															
																<small style="color:#98a8b9;">마지막 수정 일시 : ${ updateTime[status.index] }</small></h5>
					<c:set var="cnt" value="0"/>
					<h6>팀원 : <c:forEach items="${ allTeamMembers[status.index] }" var="member">
								${ member.name }
								<c:if test="${ loginVO.memberid eq member.memberid }">
									<c:set var="cnt" value="${ cnt + 1 }"/>
								</c:if>
							</c:forEach></h6>
					<c:if test="${ cnt eq 0 }">
						<button>초대 요청</button>
					</c:if>
					</div></div></li>
				</c:forEach>
                                        
                                        
                                            
                                            
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
				
				
				</div>
			</div>
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
</script>
</body>
</html>