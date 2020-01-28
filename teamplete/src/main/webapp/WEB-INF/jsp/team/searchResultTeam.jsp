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
<title>Teamplete - 팀 검색 화면</title>
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

			<header>
<%-- 			<jsp:include page="/WEB-INF/jsp/include/navbar.jsp" /> --%>
				<c:import url="/navbar/${ loginVO.memberid }" />
			</header>
			
			<div class="app-content content">
				<div class="content-wrapper" id="contentWrapper">
				<div class="row match-height">
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
																height="100" width="100">
														</div>
														
					<div class="user-page-info">
														
					<h3 class="text-primary" style="font-weight:600;">${ team.teamName }</h3>
					<h5 style="color:#263747; font-weight:600;"> 
																<strong>팀장 :</strong>  ${ team.name }															
																</h5>
					<h5 style="color:#152636;"><strong><i class="feather icon-users mr-1"></i> : </strong> 
					<c:set var="cnt" value="0"/>
					<c:forEach items="${ allTeamMembers[status.index] }" var="member">
								${ member.name },
								<c:if test="${ loginVO.memberid eq member.memberid }">
									<c:set var="cnt" value="1"/>
								</c:if>
							</c:forEach></h5>												
																<h6 class="text-muted">마지막 수정 일시 : <small style="font-size:14px;"> ${ updateTime[status.index] }</small> </h6>
											
							
					<c:if test="${ cnt eq 0 }">
						<c:set var="cnt2" value="0"/>
						<c:forEach items="${ requestList }" var="request">
						<c:if test="${ request.teamId eq team.teamId }">
						<c:set var="cnt2" value="1"/>
						</c:if>
						</c:forEach>
						<c:choose>
						<c:when test="${ cnt2 eq 0 }">
						<input type="hidden" name="ownerId" id="ownerId${ team.teamId }" value="${ team.ownerId }">
						<input type="hidden" name="teamId" id="teamId${ team.teamId }" value="${ team.teamId }">
						<input type="hidden" name="reqMemberid" id="reqMemberid${ team.teamId }" value="${ loginVO.memberid }">
						<input type="hidden" name="teamName" id="teamName${ team.teamId }" value="${ team.teamName }">
						<button type="button" class="btn btn-sm btn-primary round" name="requestBtn" value="${ team.teamId }">초대 요청</button>
						</c:when>
						<c:otherwise>
						<h4>초대 요청 완료.</h4>
						</c:otherwise>
						</c:choose>

						
					</c:if>
					<c:if test="${ cnt eq 1 }">
						<button type="button" onclick="teamDetail(${ team.teamId})">팀 상세</button>
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


$("button[name='requestBtn']").click(function() {
	
// 	var form = document.requestForm;
	
	var id = this.value;

	Swal.fire({
		 title: '초대 요청을 보내시겠습니까?',
		  text: '팀장이 요청을 수락해야 합니다.',
		  type: 'success',
		  showCancelButton: true,
		  cancelButtonColor:'#d33',
		  cancelButtonText:'아니요, 안 할래요.',
		  confirmButtonColor: '#3085d6',
		  confirmButtonText: '네, 요청합니다!',
		  focusConfirm:false,
			
	}).then((result) => {
		  if (result.value) {
			  Swal.fire({
					  title: '요청 성공',
					  text: '초대 요청을 보냈습니다.',
					  type: 'success',
					  confirmButtonText: '좋아요'
			  }).then((result) => {
				  var data = {ownerId : $('#ownerId'+id).val(),
		    		   	   	  teamId : $('#teamId'+id).val(),
		    		   	      reqMemberid : $('#reqMemberid'+id).val(),
		    		   	      teamName : $('#teamName'+id).val()
		    		   	   };
		       $.ajax({
		          type : 'POST',
		          url : '/team/request',
		          data : JSON.stringify(data),
		          contentType : "application/json",
		          success : function(data) {
		        	  console.log(data);
		        	  location.reload();
		          },
		          error : function(error) {
		        	  console.log(error);
		          }
		       });
				  
			  });
			 
		  };
		})
});





function teamDetail(teamId) {
    location.href = "${ pageContext.request.contextPath}/teamdetail/" + teamId;
}

</script>
</body>
</html>