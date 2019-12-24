<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<title>Teamplete - User Profile</title>
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

<%-- <jsp:include page="/WEB-INF/jsp/include/navbar.jsp" /> --%>

</head>
<body>

<c:import url="/navbar/${ loginVO.memberid }" />


	    <div class="app-content content">
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">${user.name}'S Profile</h2>
                            
                        </div>
                </div>
                <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                        <div class="dropdown">
                            <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-settings"></i></button>
                            <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="#">Chat</a><button type="button" name="deleteMember" class="dropdown-item" value="${ loginVO.memberid }">회원탈퇴하기</button><a class="dropdown-item" href="#">Email</a><a class="dropdown-item" href="#">Calendar</a></div>
                        </div> 
                </div>
            </div>

			<div class="row match-height">

				<div class="col-xl-3 col-md-6 col-sm-6">
					
					<div class="card">
						<div class="card-header d-flex justify-content-between">
										<h4 class="text-primary mr-1" style="font-family:'Inter'; font-weight:700; font-size:26px;">미제출한 과제</h4>
										<i class="feather icon-more-horizontal cursor-pointer"></i>
									</div>

						<div class="card-content">
							<div class="card-body">
											
											
											
							<c:set var="nScount" value="0" scope="page" />	
											<h5 style="font-family:'Inter'; font-weight:400;">총  ${fn:length(notSubmitMyTaskAll)}개의 과제가 남아있어요.</h5>
											<c:forEach items="${ notSubmitMyTaskAll }" var="nsmt"
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




		</div>
            </div>
                    
          
          
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

var memberid="";

$("button[name='deleteMember']").click(function() {
	memberid = this.value;
		
		 Swal.fire({
			 title: '탈퇴하시겠습니까?',
			  text: '탈퇴하시면 모든 회원 정보가 삭제됩니다.',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: '네, 탈퇴하겠습니다!'
		}).then((result) => {
			  if (result.value) {
				  Swal.fire({
						  title: '탈퇴 성공',
						  text: '성공적으로 탈퇴되었습니다.',
						  type: 'success',
						  confirmButtonText: '좋아요'
				  }).then((result) => {
					  $.ajax({
							url : '/member/delete/' + memberid,
							type : 'DELETE'
						});
						
						location.href = "${ pageContext.request.contextPath}/";
					  
				  });
				 
			  };
			})

});

</script>
</body>
</html>