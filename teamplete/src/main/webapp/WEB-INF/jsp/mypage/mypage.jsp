<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	href="${ pageContext.request.contextPath }/resources/css/users.css">
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
            <%-- <div class="content-header row">
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
            </div> --%>
			<div id="user-profile">
			<div class="row match-height">
			
				
				<div class="col-12">
                            <div class="profile-header mb-2">
                                <div class="relative">
                                    <div class="cover-container">
                                        <img class="img-fluid rounded-0" src="${ pageContext.request.contextPath }/resources/images/${user.profilebg}" alt="User Profile Image" style="width:100%; max-height:300px;">
                                    </div>
                                    <div class="profile-img-container d-flex align-items-center justify-content-between">
                                        
										<div class="avatar mr-50">
															<div
																style="position: relative; text-align: center; color: white;">
																<img src="${ pageContext.request.contextPath }/resources/images/${user.profile}" class="rounded-circle img-border box-shadow-1" alt="Card image">
																<div class="custom-avatar-container">
																	<c:set var="membername" value="${ user.name }" />
																	<c:set var="firstletter"
																		value="${fn:substring(membername, 0, 1)}" /><strong style="font-size:2rem;">${firstletter}</strong>
																</div>
															</div>
															<span
																class="avatar-status-${member.status }" data-toggle="tooltip" data-placement="top" title="현재 상태 : ${member.status }"></span>
														</div>						
																
																
																
                                        <div class="float-right">
                                            <button type="button" class="btn btn-icon btn-icon rounded-circle btn-primary mr-1">
                                                <i class="feather icon-edit-2"></i>
                                            </button>
                                            <button type="button" class="btn btn-icon btn-icon rounded-circle btn-primary">
                                                <i class="feather icon-settings"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-end align-items-center profile-header-nav">
                                    <nav class="navbar navbar-expand-sm w-100 pr-0">
                                        <button class="navbar-toggler pr-0" type="button" data-toggle="collapse" data-target="navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                            <span class="navbar-toggler-icon"><i class="feather icon-align-justify"></i></span>
                                        </button>
                                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                            <ul class="navbar-nav justify-content-around w-75 ml-sm-auto">
                                                <li class="nav-item px-sm-0">
                                                    <a href="#" class="nav-link font-small-3">Timeline</a>
                                                </li>
                                                <li class="nav-item px-sm-0">
                                                    <a href="#" class="nav-link font-small-3">About</a>
                                                </li>
                                                <li class="nav-item px-sm-0">
                                                    <a href="#" class="nav-link font-small-3">Photos</a>
                                                </li>
                                                <li class="nav-item px-sm-0">
                                                    <a href="#" class="nav-link font-small-3">Friends</a>
                                                </li>
                                                <li class="nav-item px-sm-0">
                                                    <a href="#" class="nav-link font-small-3">Videos</a>
                                                </li>
                                                <li class="nav-item px-sm-0">
                                                    <a href="#" class="nav-link font-small-3">Events</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
				
			
				

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
			
			<div class="form-group">
															<input type="password" name="password" id="password" class="form-control">
														</div>
														<div class="modal-footer">
										<button type="button" id="checkPWBtn" class="btn btn-primary" data-dismiss="modal">확인</button>

														</div>
			
			<div class="col-xl-3 col-md-6 col-sm-6">
								<div class="card">
						<div class="card-header d-flex justify-content-between">
										<h4 class="text-primary mr-1" style="font-family:'Inter'; font-weight:700; font-size:26px;">${ user.name }님의 정보</h4>
										<i class="feather icon-more-horizontal cursor-pointer"></i>
									</div>

						<div class="card-content">
							<div class="card-body">
							아이디: ${ user.memberid }<br/>
							이메일: ${ user.email }
							
							</div>
							</div>
							<button type="button" data-toggle="modal" data-target="#checkPWForm">수정</button>
							</div>
			</div>
			
			<!-- Modal -->
									<div class="modal fade text-left" id="checkPWForm" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel33"
										aria-hidden="true">
										<div
											class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="myModalLabel33">비밀번호를 입력해주세요.
														</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
<%-- 												<form method="post" --%>
<%-- 													action="${pageContext.request.contextPath}/${ loginVO.memberid }/checkPW" --%>
<%-- 													name="checkPW"> --%>
													<div class="modal-body">
														<label>Password: </label>
<!-- 														<div class="form-group"> -->
<!-- 															<input type="password" name="password" value="tjddPwls" id="password" class="form-control"> -->
<!-- 														</div> -->
<!-- 														<div class="modal-footer"> -->
<!-- 										<button type="button" id="checkPWBtn" class="btn btn-primary" data-dismiss="modal">확인</button> -->

<!-- 														</div> -->
													</div>
<%-- 												</form> --%>
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


     


$(document).ready(function() {
    $('#checkPWBtn').on('click', function() {
    	var pw = $('#password').val();
    	var data = {
    	        "password" : pw
    	     };
    	console.log(data);
    	console.log('/${ loginVO.memberid }/checkPW');
       $.ajax({
          type : 'POST',
          url : '/${ loginVO.memberid }/checkPW',
		  data : data,
          success : function(result) {
             if ($.trim(result) == 1) {
            	console.log(result);
                alert("비밀번호가 맞습니다.")
             } else {
            	console.log(result);
            	alert("비밀번호가 틀렸습니다.");
             }
          },
          error : function(request, status, error) {
              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
              console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
              }
       });
    });
});


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