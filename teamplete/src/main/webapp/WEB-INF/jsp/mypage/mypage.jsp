<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My page</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/colors.css">
<jsp:include page="/WEB-INF/jsp/include/navbar.jsp" />
</head>
<body>
	    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h3 class="content-header-title float-left mb-0">마이페이지</h3>
                            <div class="breadcrumb-wrapper col-12">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                     <div class="form-group breadcrum-right">
                        <div class="dropdown">
                            <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-settings"></i></button>
                            <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="#">Chat</a><a class="dropdown-item" href="#">Email</a><a class="dropdown-item" href="#">Calendar</a></div>
                        </div> 
                    </div>
                </div>
            </div>
            <div class="content-body">
                <div id="user-profile">
                    <div class="row">
                        <div class="col-12">
                            <div class="profile-header mb-2">
                                <div class="relative">
                                     <div class="cover-container">
                                        <img class="img-fluid bg-cover rounded-0 w-100" src="resources/images/cover.jpg" alt="User Profile Image">
                                    </div>
                                    <div class="profile-img-container d-flex align-items-center justify-content-between">
                                    </div> —>
                                </div>
                                <div class="d-flex justify-content-end align-items-center profile-header-nav">
                                    <nav class="navbar navbar-expand-sm w-100 pr-0">
                                        <button class="navbar-toggler pr-0" type="button" data-toggle="collapse" data-target="navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                            <span class="navbar-toggler-icon"><i class="feather icon-align-justify"></i></span>
                                        </button>
                                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                            <ul class="navbar-nav justify-content-around w-75 ml-sm-auto">
                                                <li class="nav-item px-sm-0">
                                                    <a href="#" class="nav-link font-small-3">About</a>
                                                </li>
                                                <li class="nav-item px-sm-0">
                                                    <a href="#" class="nav-link font-small-3">Friends</a>
                                                </li>
                                                <li class="nav-item px-sm-0">
                                                    <a href="#" class="nav-link font-small-3">Events</a> 
<!--                                                     — 내 모든 일정 연결 — -->
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <section id="profile-info">
                        <div class="row">
                            <div class="col-lg-3 col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>About</h4>
                                        <i class="feather icon-more-horizontal cursor-pointer"></i>
                                    </div>
                                    <div class="card-body">
                                        <div class="mt-1">
                                            <h6 class="mb-0">ID</h6>
                                            <span style="color:#92B3B7"><p">${loginVO.memberid }</p></span>
                                        </div>                                        
                                        <div class="mt-1">
                                            <h6 class="mb-0">NAME</h6>
                                            <span style="color:#92B3B7"><p>${loginVO.name }</p></span>
                                        </div>
                                        <div class="mt-1">
                                            <h6 class="mb-0">EMAIL</h6>
                                            <span style="color:#92B3B7"><p>${ loginVO.email }</p></span>                                           
                                        </div>
                                        <div class="mt-1">
                                            <button type="button" class="btn btn-sm btn-icon btn-primary mr-25 p-25"><i class="feather icon-facebook"></i></button>
                                            <button type="button" class="btn btn-sm btn-icon btn-primary mr-25 p-25"><i class="feather icon-twitter"></i></button>
                                            <button type="button" class="btn btn-sm btn-icon btn-primary p-25"><i class="feather icon-instagram"></i></button>
                                        </div>
                                        
                                        <button type="button" data-toggle="modal" data-target="#passwordCheck" class="btn btn-primary w-100 mt-1" onclick="location.href='${pageContext.request.contextPath}/mypage/passwdCheck'"><i class="feather icon-plus mr-25"></i>회원정보 수정</button>
                                        

</body>
</html>