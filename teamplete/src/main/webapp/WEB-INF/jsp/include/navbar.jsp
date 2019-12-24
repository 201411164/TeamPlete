<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta property="og:title" content="Teamplete - 팀 작업을 더 편리하게!" />
<meta property="og:type" content="article" />
<meta property="og:url" content="http://www.teamplete.net/" />
<meta property="og:description"
	content="Teamplete와 함께 스트레스 없는 팀 프로젝트를 진행하세요. 팀원들의 작업물을 한 눈에 확인하고, 일정을 관리하세요." />
<meta property="og:image"
	content="${ pageContext.request.contextPath }/resources/images/ogimage.png" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,600">
    <!-- BEGIN: Vendor CSS-->

    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/components.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/nanoscroller.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,600">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="https://rsms.me/inter/inter.css">

    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/semi-dark-layout.css">
	<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/quill.snow.css">
    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/sweetalert2.min.css">
	<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/dropzone.css">
   


<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/palette-gradient.css">
<script data-ad-client="ca-pub-2653440415528337" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script
		src="${ pageContext.request.contextPath }/resources/js/quill.min.js"></script>	
</head>
<body>


<body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

    <!-- BEGIN: Header-->
    <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-light navbar-shadow">
        <div class="navbar-wrapper">
            <div class="navbar-container content">
                <div class="navbar-collapse" id="navbar-mobile">
                    <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                        <ul class="nav navbar-nav">
                            <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                        </ul>
                        <ul class="nav navbar-nav bookmark-icons">
                            <!-- li.nav-item.mobile-menu.d-xl-none.mr-auto-->
                            <!--   a.nav-link.nav-menu-main.menu-toggle.hidden-xs(href='#')-->
                            <!--     i.ficon.feather.icon-menu-->
                            <li class="nav-item d-none d-lg-block"><a class="nav-link" href="app-todo.html" data-toggle="tooltip" data-placement="top" title="팀 작업"><i class="ficon feather icon-check-square"></i></a></li>
                            <li class="nav-item d-none d-lg-block"><a class="nav-link" href="app-chat.html" data-toggle="tooltip" data-placement="top" title="최근 기록"><i class="ficon feather icon-message-square"></i></a></li>
                            <li class="nav-item d-none d-lg-block"><a class="nav-link" href="app-calender.html" data-toggle="tooltip" data-placement="top" title="일정 관리"><i class="ficon feather icon-calendar"></i></a></li>
                        </ul>
                        <ul class="nav navbar-nav">
                            <li class="nav-item d-none d-lg-block"><a class="nav-link bookmark-star"><i class="ficon feather icon-star warning"></i></a>
                                <div class="bookmark-input search-input">
                                    <div class="bookmark-input-icon"><i class="feather icon-search primary"></i></div>
                                    <input class="form-control input" type="text" placeholder="검색할 단어를 입력하세요..." tabindex="0" data-search="template-list">
                                    <ul class="search-list"></ul>
                                </div>
                                <!-- select.bookmark-select-->
                                <!--   option Chat-->
                                <!--   option email-->
                                <!--   option todo-->
                                <!--   option Calendar-->
                            </li>
                        </ul>
                    </div>
                    <ul class="nav navbar-nav float-right">
                        <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon feather icon-maximize"></i></a></li>
                        <li class="nav-item nav-search"><a class="nav-link nav-link-search"><i class="ficon feather icon-search"></i></a>
                            <div class="search-input">
                                <div class="search-input-icon"><i class="feather icon-search primary"></i></div>
                                <input class="input" type="text" placeholder="검색할 단어를 입력하세요..." tabindex="-1" data-search="template-list">
                                <div class="search-input-close"><i class="feather icon-x"></i></div>
                                <ul class="search-list"></ul>
                            </div>
                        </li>	
                        <li class="dropdown dropdown-notification nav-item"><a class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i class="ficon feather icon-bell"></i><span class="badge badge-pill badge-primary badge-up">${ requestCnt }</span></a>
                            <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                                <li class="dropdown-menu-header">
                                    <div class="dropdown-header m-0 p-2">
                                        <h3 class="white">${ requestCnt } New</h3><span class="notification-title">Notifications</span>
                                    </div>
                                </li>
                                <li class="scrollable-container media-list">
                                
                                <c:forEach items="${ allRequestList }" var="request" varStatus="status">
                                
                                <a class="d-flex justify-content-between" onClick="acceptFunc('${ request.reqMemberid }', ${ request.teamId },'${ request.name }')">
                                        <div class="media d-flex align-items-start">
                                            <div class="media-left"><i class="feather icon-plus-square font-medium-5 text-primary"></i></div>
                                            <div class="media-body" style="font-family:'Inter';">
                                                <h4 class="text-primary" style="font-weight:600; ">초대 요청</h4>
                                                <small class="notification-text" style="line-height: 1.2rem;"><strong>${ request.name }(${ request.reqMemberid })</strong>님이 <strong>${ request.teamName }</strong>에 초대를 요청했습니다.</small>
                                            </div>
                                                <time class="media-meta text-info" style="font-family:'Inter';">${ requestTime[status.index] }</time>
                                                
                                        </div>
                                    </a>
                                </c:forEach>
                                
                            
                                    </li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">${ loginVO.name }</span><span class="user-status">online</span></div>
                                <c:choose>
                                <c:when test="${fn:startsWith(loginVO.profile, 'circle')}">

									<div class="avatar">
										<div
											style="position: relative; text-align: center; color: white;">
											<img
												src="${ pageContext.request.contextPath }/resources/images/${loginVO.profile}"
												alt="avtar img holder" height="40" width="40">
											<div
												class="custom-avatar-container">
												<c:set var="membername" value="${ loginVO.name }" />
												<c:set var="firstletter"
													value="${fn:substring(membername, 0, 1)}" />${firstletter}
											</div>
										</div>
									</div>

								</c:when>
                            	<c:otherwise>
                            	<span><img class="round" src="${ loginVO.profile }" alt="avatar" height="40" width="40"></span>
                            	</c:otherwise>
                            	</c:choose>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="page-user-profile.html"><i class="feather icon-user"></i> Edit Profile</a><a class="dropdown-item" href="app-email.html"><i class="feather icon-mail"></i> My Inbox</a><a class="dropdown-item" href="app-todo.html"><i class="feather icon-check-square"></i> Task</a><a class="dropdown-item" href="app-chat.html"><i class="feather icon-message-square"></i> Chats</a>
                                <form method="post" 
												action="${ pageContext.request.contextPath }/logout"
												name="logoutform"
												><input type="hidden" name="memberid"
														value="${ loginVO.memberid }">
                                
                                <div class="dropdown-divider"></div><a class="dropdown-item" onClick="logoutsubmit()" ><i class="feather icon-power"></i> Logout</a>
                            
                            </form>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <!-- END: Header-->


    <!-- BEGIN: Main Menu-->
    <div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
        <div class="navbar-header">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item mr-auto"><a class="navbar-brand" href="${ pageContext.request.contextPath }/team/${loginVO.memberid}">
                        <div class="brand-logo"></div>
                        <h2 class="brand-text mb-0">Teamplete</h2>
                    </a></li>
                <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i></a></li>
            </ul>
        </div>
        <div class="shadow-bottom"></div>
        <div class="main-menu-content">
            <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
                
                <li class=" navigation-header"><span>Teamplete</span>
                </li>
                <li class="nav-item"><a href="${ pageContext.request.contextPath}/mypage/${loginVO.memberid}"><i class="feather icon-user"></i>마이페이지</a>
                </li>
                <li class=" nav-item"><a href="app-chat.html"><i class="feather icon-message-square"></i><span class="menu-title" data-i18n="Chat">팀 작업</span></a>
                </li>
                <li class=" nav-item"><a href="app-todo.html"><i class="feather icon-check-square"></i><span class="menu-title" data-i18n="Todo">나의 할 일</span></a>
                </li>
                <li class=" nav-item"><a href="app-calender.html"><i class="feather icon-calendar"></i><span class="menu-title" data-i18n="Calender">일정관리</span></a>
                </li>
                    
               
            </ul>
        </div>
    </div>
    <!-- END: Main Menu-->
    
    
	<!-- BEGIN: Vendor JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.sticky.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/sweetalert2.all.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.nanoscroller.js"></script>	
	<script
		src="${ pageContext.request.contextPath }/resources/js/dropzone.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/app-menu.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/app.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/components.js"></script>
		
		
		
	<!-- END: Theme JS-->
    <script>
    
    function logoutsubmit(){
	    var logoutform = document.logoutform;
	    logoutform.submit();
	}
    
    function acceptFunc(memberId, teamId, name) {
    	
    	
    	
    	
    	Swal.fire({
			 title: '팀원 추가',
			  text: name + '('+memberId+')'+'님을 추가하시겠습니까?',
			  type: 'question',
			  showCloseButton:true,
			  showCancelButton: true,
			  cancelButtonText:'아니요, 필요 없어요.',
			  cancelButtonColor:'#d33',
			  focusConfirm:false,
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: '네, 추가할래요!'
		}).then((result) => {
			  if (result.value) {
				  
				  var member=[];
		    	    member.push(memberId);
				  
				  Swal.fire({
						  title: '추가 성공',
						  text: '일꾼이 늘었군요, 축하해요!',
						  type: 'success',
						  confirmButtonColor: '#3085d6',
						  focusConfirm:false,
						  confirmButtonText: '좋아요'
						  
				  }).then((result) => {
					  $.ajax({
				          type : 'POST',
				          url : '/teamdetail/' + teamId,
				          data : JSON.stringify(member),
				          contentType : "application/json"
		    	    });
		    	    
				    $.ajax({
						url : '/request/delete/' + teamId + "/" + memberId,
						type : 'DELETE'
				    });
				    
				    location.reload();
					  
				  });
				 
			  }
			  
			  else if (
					    /* Read more about handling dismissals below */
					    result.dismiss === Swal.DismissReason.cancel
					  ){
				  
				  Swal.fire({
    				  title: '요청 삭제',
					  text: '초대 요청을 삭제하였습니다!',
					  type: 'success',
					  confirmButtonColor: '#3085d6',
					  focusConfirm:false,
					  confirmButtonText: '좋아요'
    		}).then((result) => {
    			$.ajax({
					url : '/request/delete/' + teamId + "/" + memberId,
					type : 'DELETE'
				});
	    		location.reload();
				  
			  });
				  
				  
				  
		    		
				  
				  
				  
			  }
			  
			  
			})
    	
    	
    	
    	
    	
    }
    
    
     
    
    </script>

</body>
</html>