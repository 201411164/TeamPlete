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
<title>Teamplete - 팀 작업을 더 편리하게!</title>
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

<style>
.hovereffect {
  width: 100%;
  height: 100%;
  float: left;
  overflow: hidden;
  position: relative;
  text-align: center;
  cursor: default;
}

.hovereffect .overlay {
 
  width: 100%;
  height: 100%;
  position: absolute;
  overflow: hidden;
  top: 0;
  left: 0;
}
.hovereffect .overlay:hover {
 
  background-color:rgba(0,0,0,0.55);
}




.hovereffect img {
  display: block;
  position: relative;
  -webkit-transition: all 0.4s ease-in;
  transition: all 0.4s ease-in;
}

.hovereffect:hover img {
  filter: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg"><filter id="filter"><feColorMatrix type="matrix" color-interpolation-filters="sRGB" values="0.2126 0.7152 0.0722 0 0 0.2126 0.7152 0.0722 0 0 0.2126 0.7152 0.0722 0 0 0 0 0 1 0" /><feGaussianBlur stdDeviation="3" /></filter></svg>#filter');
  filter: grayscale(3) blur(20px);
  -webkit-filter: grayscale(1) blur(3px);
  -webkit-transform: scale(1.3);
  -ms-transform: scale(1.3);
  transform: scale(1.3);
}

.hovereffect h2 {
  text-transform: uppercase;
  text-align: center;
  position: relative;
  font-size: 1rem;
  padding: 10px;
  background: rgba(0, 0, 0, 0.95);
}

.hovereffect a.info {
  display: inline-block;
  text-decoration: none;
  padding: 7px 14px;
  font-size: 2rem;
  border: 3px solid #fff;
  margin-top:25%;
  background-color: transparent;
}
.hovereffect a.info::first-letter {
  color:#fce205;
  font-size:2.3rem;
}

.hovereffect a.info:hover {
  box-shadow: 0 0 5px #fff;
}

.hovereffect a.info, .hovereffect h2 {
  -webkit-transform: scale(0.7);
  -ms-transform: scale(0.7);
  transform: scale(0.7);
  -webkit-transition: all 0.4s ease-in;
  transition: all 0.4s ease-in;
  opacity: 0;
  filter: alpha(opacity=0);
  color: #fff;
  text-transform: uppercase;
}

.hovereffect:hover a.info, .hovereffect:hover h2 {
  opacity: 1;
  filter: alpha(opacity=100);
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  transform: scale(1);
}
.has-search .form-control {
    padding-left: 2.375rem;
}

.has-search .form-control-feedback {
    position: absolute;
    z-index: 2;
    display: block;
    width: 2.375rem;
    height: 2.375rem;
    line-height: 2.375rem;
    text-align: center;
    pointer-events: none;
    color: #aaa;
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
<%-- 	<jsp:include page="/WEB-INF/jsp/include/navbar.jsp" /> --%>
		<c:import url="/navbar/${ loginVO.memberid }" />
	</header>
	
	<section>
	<div class="app-content content">
	 <div class="content-wrapper" id="contentWrapper">
	 
		<c:if test="${ not empty loginVO }">
		<div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                        <div class="col-12">
<!--                             <h2 class="content-header-title float-left mb-0 ">최신 업데이트</h2>     -->
                        </div>
                </div>
                <div class="content-header-right col-md-9 col-12 mb-2">
                <form method="get" action="${pageContext.request.contextPath}/team/search" name="searchTeamForm">
								<div class="form-group has-search">
									<span class="fa fa-search form-control-feedback"></span> <input
										type="text" name="keyword" id="keyword" class="form-control" placeholder="팀 이름을 입력">
								</div>

                </form>
                </div>
                 
            </div>
<%-- 						<a href="${ pageContext.request.contextPath }/calendar">캘린더</a> --%>
			<div>
				
				 <div class="row match-height">
                    <c:forEach var="team" items="${ teamList }" varStatus="status">
                       <div class="col-xl-3 col-md-6 col-sm-6">
                        	
                            <div class="card" id="showdetail">
                                                            
                                <div class="card-content" >
                                    <div class="card-body">



													<div class="hovereffect">
														<img class="teamImg" id="cardImage"
															style="width: 100%; height: auto;"
															data-src="${ pageContext.request.contextPath }/resources/images/${ team.img }"
															alt="avatar">

														<div class="overlay">
															<a class="info" onclick="teamDetail(${ team.teamId })" style="color:#ffffff; font-weight:600;">팀 확인하기</a>
														</div>
													</div>


													<div class="card-text">                                        
                                            <a onclick="teamDetail(${ team.teamId })"><h2 class="text-bold-700" style="margin-top:7%;"  ><c:out value="${ team.teamName }" /></h2></a>
                                            <h6 class="text-bold-600"><c:out value="팀원: " />
                                            <c:forEach items="${ teamMemberList[status.index] }" var="teamMembers">
                                            	<strong style="color:#0275d8 !important">${ teamMembers.name }</strong>
                                            </c:forEach>
                                            </h6>
											<p>마지막 수정 일시: ${ updateTime[status.index] }</p>
											<h4 class="primary text-bold-400" style="margin-top:5%"><c:out value="과제 제출 기한: " /><strong class="text-bold-600 text-nowrap" style="color:red !important;"><c:out
										value="${ deadline[status.index] }" /></strong></h4>
                                        </div>
                                    </div>
                               
                            </div>
                        </div>
                       </div> 
                    </c:forEach>


								



								<!-- BEGIN: 팀 추가-->
					
					
					
					
					
					
					
					
					
					
					 
					
					
										
										
										
										
								
                                    	
                                   
                                    </div>
                                    
                                    
                                    <c:choose>
								<c:when test="${teamNumber >= 1 and user.type eq 'U'}">
									
										
										<div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="card overlay-img-card text-white">
                                <img src="${ pageContext.request.contextPath }/resources/images/teamlong.jpg" class="card-img" alt="card-img-6">
                                <div class="card-img-overlay overlay-black">
                                    <h5 class="font-large-1 text-success text-center mt-1"><i class="feather icon-slash mr-1"></i>팀 생성 한도 초과</h5>
                                    <p class="text-white text-center">현재 사용중인 플랜 : 베이직</p>
                                    <div class="card-content">
                                        <div class="d-flex justify-content-around mt-2">
                                            <div class="icon">
                                                <i class="feather icon-shopping-cart font-large-5"></i>
                                            </div>
                                            <div class="temprature mt-3">
                                                <a href="${ pageContext.request.contextPath}/shop" style="color:white;"><p class="font-large-1">Gold 구독</p></a>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between mt-2">
                                                <div class="precipitation">
                                                    <span class="font-medium-3">생성 가능한 팀 개수</span>
                                                </div>
                                                <div class="degree">
                                                    <span class="font-medium-3"><del>1개</del>->5개</span>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between my-3">
                                                <div class="humidity">
                                                    <span class="font-medium-3">최대 팀원 수 </span>
                                                </div>
                                                <div class="degree">
                                                    <span class="font-medium-3"><del>5명</del>->20명</span>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between my-3">
                                                <div class="wind">
                                                    <span class="font-medium-3">최대 게시글 수</span>
                                                </div>
                                                <div class="degree">
                                                    <span class="font-medium-3"><del>15개</del>->무제한</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>		
										
										
								</c:when>
								<c:when test="${teamNumber ge 5 and user.type eq 'G'}">
												<div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="card overlay-img-card text-white">
                                <img src="${ pageContext.request.contextPath }/resources/images/teamlong.jpg" class="card-img" alt="card-img-6">
                                <div class="card-img-overlay overlay-black">
                                    <h5 class="font-large-1 text-success text-center mt-1"><i class="feather icon-slash mr-1"></i>팀 생성 한도 초과</h5>
                                    <p class="text-white text-center">현재 사용중인 플랜 : 골드</p>
                                    <div class="card-content">
                                        <div class="d-flex justify-content-around mt-2">
                                            <div class="icon">
                                                <i class="feather icon-shopping-cart font-large-5"></i>
                                            </div>
                                            <div class="temprature mt-3">
                                                <a href="${ pageContext.request.contextPath}/shop" style="color:white;"><p class="font-large-1">프리미엄 구독</p></a>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between mt-2">
                                                <div class="precipitation">
                                                    <span class="font-medium-3">생성 가능한 팀 개수</span>
                                                </div>
                                                <div class="degree">
                                                    <span class="font-medium-3"><del>5개</del>->무제한</span>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between my-3">
                                                <div class="humidity">
                                                    <span class="font-medium-3">최대 팀원 수 </span>
                                                </div>
                                                <div class="degree">
                                                    <span class="font-medium-3"><del>20명</del>->무제한</span>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between my-3">
                                                <div class="wind">
                                                    <span class="font-medium-3">최대 게시글 수</span>
                                                </div>
                                                <div class="degree">
                                                    <span class="font-medium-3"><del>무제한</del>->무제한</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>		
								</c:when>
								<c:otherwise>
								
								
								
								<div class="col-xl-3 col-md-6 col-sm-6">
						<div class="card">
						
						<div class="card-content">
						
								
								<div class="card-content">
						
                                    <div class="card-body justify-content-center">
								<h1 class="btn btn-outline-success btn-block"
										data-toggle="modal" data-target="#inlineForm" style="font-size:270px">+</h1>
										</div>
                                    </div>
                                    </div>
                                    </div>
                                    </div>
								</c:otherwise>
								
								</c:choose>   
                                    
                                    
                                    
                                    </div>
                                					
									
										
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
													action="${pageContext.request.contextPath}/team"
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
                    <!-- END: 팀 추가-->
                    
                    
                    
                        </div> 
                    </div>
                

			<!-- 			<section id="form-and-scrolling-components"> -->
			
<!-- 			</section> -->
		</c:if>
	</div>
	</div>
	</section>
	

	<footer>
	 </footer>
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
	

	
	
	
	// IntersectionObserver의 options를 설정합니다.
	const options = {
	  root: null,
	  // 타겟 이미지 접근 전 이미지를 불러오기 위해 rootMargin을 설정했습니다.
	  rootMargin: '0px 0px 30px 0px',
	  threshold: 0
	}
	
	// IntersectionObserver 를 등록한다.
	const io = new IntersectionObserver((entries, observer) => {
	  entries.forEach(entry => {
	    // 관찰 대상이 viewport 안에 들어온 경우 image 로드
	    if (entry.isIntersecting) {
	      // data-src 정보를 타켓의 src 속성에 설정
	      entry.target.src = entry.target.dataset.src;
	      // 이미지를 불러왔다면 타켓 엘리먼트에 대한 관찰을 멈춘다.
	      observer.unobserve(entry.target);
	    }
	  })
	}, options)
	
	const images = document.querySelectorAll('.teamImg');
	images.forEach((el) => {
	  io.observe(el);
	})
	
	
	
	
	
	
	
	
	
// 	$("button[name='searchTeam']").click(function() {
// 		   var form = document.searchTeamForm;
// 		   form.action = "${pageContext.request.contextPath}/team/search";
// 		   form.submit();
// 	});


   function submit(){
	   
	   Swal.fire({
			  title: '축하합니다',
			  text: '팀이 성공적으로 생성되었습니다',
			  type: 'success',
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: '네, 알겠어요!'
		}).then((result) => {
			  if (result.value) {
				  var form = document.createTeamForm;
				  form.submit();
			  }
			})
			
	    
	}
   
   function teamDetail(teamId) {
	    location.href = "${ pageContext.request.contextPath}/teamdetail/" + teamId;
	}
   
   
   

   
</script>

</body>
</html>