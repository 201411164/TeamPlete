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
				
				<c:forEach items="${ searchTeamList }" var="team" varStatus="status">
					<p>팀 이름 : ${ team.teamName }</p>
					<p>팀장 ID: ${ team.ownerId }</p>
					<p>팀장 이름: ${ team.name }</p>
					<c:set var="cnt" value="0"/>
					<p>팀원 : <c:forEach items="${ allTeamMembers[status.index] }" var="member">
								${ member.name }
								<c:if test="${ loginVO.memberid eq member.memberid }">
									<c:set var="cnt" value="${ cnt + 1 }"/>
								</c:if>
							</c:forEach></p>
					<c:if test="${ cnt eq 0 }">
						<button>초대 요청</button>
					</c:if>
					<hr/>
				</c:forEach>
				
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