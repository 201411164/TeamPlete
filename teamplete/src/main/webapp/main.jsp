<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">

<title>Teamplete - 팀 작업을 더 편리하게!!</title>
<meta property="og:title" content="Teamplete - 팀 작업을 더 편리하게!" />
<meta property="og:type" content="article" />
<meta property="og:url" content="http://www.teamplete.net/" />
<meta property="og:description" 
  content="Teamplete와 함께 스트레스 없는 팀 프로젝트를 진행하세요. 팀원들의 작업물을 한 눈에 확인하고, 일정을 관리하세요." />
<meta property="og:image" content="${ pageContext.request.contextPath }/resources/images/ogimage.png" />
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

<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/select2.min.css">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,600">

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

<link
	href="http://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700,800,900|Yellowtail%3A400|Montserrat%3A700"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/settings.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/layers.css">
	<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/vegas.min.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/navigation.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/pe-icon-7-stroke.css">
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/font-awesome.css">	


<link href="http://fonts.googleapis.com/css?family=Noto+Sans:700%2C400%7CNanum+Gothic:800%7COpen+Sans:400" rel="stylesheet" property="stylesheet" type="text/css" media="all">

<style>
input::placeholder {
  color: white !important;  
}
.form-control{
 border: 1px solid rgba(255,255,255,0.7) !important;
}

</style>
	

<!-- END: Page CSS-->
<style type="text/css">.hesperiden.tparrows{cursor:pointer;background:rgba(0,0,0,0.5);width:40px;height:40px;position:absolute;display:block;z-index:100;  border-radius:50%}.hesperiden.tparrows:hover{background:rgba(0,0,0,1)}.hesperiden.tparrows:before{font-family:"revicons";font-size:20px;color:rgb(255,255,255);display:block;line-height:40px;text-align:center}.hesperiden.tparrows.tp-leftarrow:before{content:"\e82c";  margin-left:-3px}.hesperiden.tparrows.tp-rightarrow:before{content:"\e82d";  margin-right:-3px}.hephaistos .tp-bullet{width:12px;height:12px;position:absolute;background:rgba(153,153,153,1);border:3px solid rgba(255,255,255,0.9);border-radius:50%;cursor:pointer;box-sizing:content-box;  box-shadow:0px 0px 2px 1px rgba(130,130,130,0.3)}.hephaistos .tp-bullet:hover,.hephaistos .tp-bullet.selected{background:rgba(255,255,255,1);  border-color:rgba(0,0,0,1)}</style>
				
</head>
<body
	class="horizontal-layout horizontal-menu 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page"
	data-open="hover" data-menu="horizontal-menu" data-col="1-column">
	
	

	<div class="app-content content">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper">
			<div class="content-header row"></div>
			<div class="content-body">
				<section class="row flexbox-container">
				<div class="col-xl-8 col-11 d-flex justify-content-center">
					<div class="mb-0" >
						<div class="row m-0">
							<div
								class="col-lg-6 d-lg-block d-none text-center align-self-center px-1 py-0">
								<img
									src="${ pageContext.request.contextPath }/resources/images/login.png"
									alt="branding logo">
							</div>
							<div class="col-lg-6 col-12 p-0">
								<div class="ml-2 mb-0 px-0">
									
									 <a href="${ pageContext.request.contextPath }/main.jsp"><img class="mb-2" src="${ pageContext.request.contextPath }/resources/images/teampletewhite.png"></a>
									<div class="card-content" style="font-weight:700 ! important; color: white! important;">
										<div class="pt-1">
											<form method="post" 
												action="${ pageContext.request.contextPath }/login"
												name="inputForm" onsubmit="return checkForm()"
												class="login-form mt-1">
												<fieldset
													class="form-label-group form-group position-relative has-icon-left">
													<input type="text" class="form-control" name="memberid"
														id="user-name" placeholder="Username" required style="background-color:transparent; color:white;">
													<div class="form-control-position">
														<i class="feather icon-user"></i>
													</div>
												</fieldset>

												<fieldset
													class="form-label-group position-relative has-icon-left">
													<input type="password" class="form-control" name="password"
														id="user-password" placeholder="Password"  required style="background-color:transparent; color:white;">
													<div class="form-control-position">
														<i class="feather icon-lock"></i>
													</div>
												</fieldset>											
												
												<button type="submit" class="btn btn-outline-light btn-block mt-1" style="font-weight:700 ! important;">로그인</button>
												<div class=" mb-1 mt-1" style="text-align:center !important"><h5 class="mb-0 mt-0 " style="font-weight:600 !important; color:white;">또는</h5>
												</div>

												<a class="btn btn-block mt-1"
													style="background-color: #ffe812; color: #3c1e1e; font-weight: 700; font-size:1rem;"
													href="https://kauth.kakao.com/oauth/authorize?client_id=e355c450ecfaeb579db7e67d74790574&redirect_uri=http://localhost:8088/kakaologin&response_type=code"
													style="font-weight:700 ! important;"><img class="mr-2 mb-0 mt-0" src="${ pageContext.request.contextPath }/resources/images/kakaotalk.svg" width="30" height="30">카카오 계정으로
													로그인 </a>
												<div class="mt-1" style="text-align:center !important">
												<h5 class="mb-0 mt-0" style="font-weight:400 !important; color:white;">아직 계정이 없으신가요?  <a class="ml-1" href="${ pageContext.request.contextPath }/member/join"
													style="font-weight:700 ! important; color:white; font-size:1.2rem;">회원가입</a></h5>
												</div>	
											</form>
										</div>
									</div>


									
								</div>
							</div>
						</div>
					</div>
				</div>
				</section>
				
				<section id="slider" class="slider-element revslider-wrap full-screen clearfix">
		
								

				
				
				
								<div id="rev_slider_13_1" class="rev_slider fullscreenbanner" style="display:none;" data-version="5.4.8.1">
<ul>	<!-- SLIDE  -->
    <li data-index="rs-62" data-transition="fade,cube-horizontal" data-slotamount="default,default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default,default" data-easeout="default,default" data-masterspeed="300,default"  data-thumb="${ pageContext.request.contextPath }/resources/images/transparent.png"  data-rotate="0,0"  data-saveperformance="off"  data-mediafilter="gingham" data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
		<!-- MAIN IMAGE -->
        <img src="${ pageContext.request.contextPath }/resources/images/transparent.png" data-bgcolor='#1b2a2f' style='background:#1b2a2f' alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="9" class="rev-slidebg" data-no-retina>
		<!-- LAYERS -->

		<!-- LAYER NR. 1 -->
		<div class="tp-caption   tp-resizeme rs-parallaxlevel-3" 
			 id="slide-62-layer-1" 
			 data-x="['left','left','left','left']" data-hoffset="['0','0','0','0']" 
			 data-y="['top','top','top','top']" data-voffset="['197','197','197','197']" 
						data-fontsize="['68','68','54','54']"
			data-width="none"
			data-height="none"
			data-whitespace="nowrap"
 
            data-type="text" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"split":"chars","splitdelay":0.05000000000000000277555756156289135105907917022705078125,"speed":2000,"split_direction":"forward","frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 5; white-space: nowrap; font-size: 68px; line-height: 22px; font-weight: 700; color: #ffffff; letter-spacing: -5px;font-family:Noto Sans;">한 눈에 보는 진행사항 </div>

		<!-- LAYER NR. 2 -->
		<div class="tp-caption   tp-resizeme rs-parallaxlevel-3" 
			 id="slide-62-layer-2" 
			 data-x="['left','left','left','left']" data-hoffset="['0','0','0','0']" 
			 data-y="['top','top','top','top']" data-voffset="['307','307','307','307']" 
						data-width="['573','573','462','462']"
			data-height="['122','122','none','none']"
			data-whitespace="normal"
 
            data-type="text" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":2500,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"frame":"999","to":"y:50px;opacity:0;","ease":"Power2.easeIn"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 6; min-width: 573px; max-width: 573px; max-width: 122px; max-width: 122px; white-space: normal; font-size: 24px; line-height: 40px; font-weight: 400; color: #ffffff; letter-spacing: -1px;font-family:Noto Sans;">Teamplete는 팀 작업을
쉽고 편하게 관리하게
도와주는 혁신적인 솔루션입니다. 팀원들의 과제 제출 여부를 한 눈에 확인하고 산출물을 관리하세요. </div>

		<!-- LAYER NR. 3 -->
		<div class="tp-caption tp-shape tp-shapewrapper  tp-resizeme rs-parallaxlevel-3" 
			 id="slide-62-layer-4" 
			 data-x="['left','left','left','left']" data-hoffset="['1','1','1','0']" 
			 data-y="['top','top','top','top']" data-voffset="['270','270','270','270']" 
						data-width="40"
			data-height="4"
			data-whitespace="nowrap"
 
            data-type="shape" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":300,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 7;background-color:rgb(255,255,255);"> </div>

		<!-- LAYER NR. 4 -->
		<a href="${ pageContext.request.contextPath }/member/join">
		<div class="tp-caption rev-btn rev-withicon  rs-parallaxlevel-3" 
			 id="slide-62-layer-10" 
			 data-x="['left','left','left','left']" data-hoffset="['5','5','5','5']" 
			 data-y="['top','top','top','top']" data-voffset="['482','482','482','482']" 
						data-width="none"
			data-height="none"
			data-whitespace="nowrap"
 
            data-type="button" 
			data-responsive_offset="on" 
			data-responsive="off"
            data-frames='[{"delay":10,"speed":1300,"frame":"0","from":"x:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"0","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(0,0,0,1);bg:rgba(255,255,255,1);bc:rgba(0,0,0,1);bw:0 0 0 0;"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[12,12,12,12]"
            data-paddingright="[35,35,35,35]"
            data-paddingbottom="[12,12,12,12]"
            data-paddingleft="[35,35,35,35]"

            style="z-index: 8; white-space: nowrap; font-size: 17px; line-height: 17px; font-weight: 800; color: #ffffff; letter-spacing: ;font-family:Nanum Gothic;background-color:rgba(255,255,255,0);border-color:rgb(255,255,255);border-style:solid;border-width:2px 2px 2px 2px;border-radius:30px 30px 30px 30px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">시작하기<i class="fa-icon-chevron-right"></i> </div>
		</a>
		<!-- LAYER NR. 5 -->
		<div class="tp-caption   tp-resizeme rs-parallaxlevel-3" 
			 id="slide-62-layer-11" 
			 data-x="['left','left','left','left']" data-hoffset="['3','3','3','3']" 
			 data-y="['top','top','top','top']" data-voffset="['88','88','88','88']" 
						data-width="none"
			data-height="none"
			data-whitespace="nowrap"
 
            data-type="image" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":300,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 9;"><img src="${ pageContext.request.contextPath }/resources/images/b3350-whitelogo.png" alt="" data-ww="['129px','129px','129px','129px']" data-hh="['34px','34px','34px','34px']" data-no-retina> </div>

		<!-- LAYER NR. 6 -->
		<div class="tp-caption   tp-resizeme rs-parallaxlevel-6" 
			 id="slide-62-layer-12" 
			 data-x="['right','right','right','right']" data-hoffset="['0','-107','-215','-585']" 
			 data-y="['top','top','top','top']" data-voffset="['-72','-64','-48','-33']" 
						data-width="none"
			data-height="none"
			data-whitespace="nowrap"
 
            data-type="image" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 10;"><img src="${ pageContext.request.contextPath }/resources/images/object_iphone_3.png" alt="" data-ww="['750px','750px','750px','750px']" data-hh="['750px','750px','750px','750px']" data-no-retina> </div>
	</li>
	<!-- SLIDE  -->
    <li data-index="rs-64" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="300"  data-thumb="${ pageContext.request.contextPath }/resources/images/transparent.png"  data-rotate="0"  data-saveperformance="off"  data-mediafilter="gingham" data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
		<!-- MAIN IMAGE -->
        <img src="${ pageContext.request.contextPath }/resources/images/transparent.png" data-bgcolor='#45aed4' style='background:#45aed4' alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="9" class="rev-slidebg" data-no-retina>
		<!-- LAYERS -->

		<!-- LAYER NR. 7 -->
		<div class="tp-caption   tp-resizeme rs-parallaxlevel-3" 
			 id="slide-64-layer-1" 
			 data-x="['left','left','left','left']" data-hoffset="['0','0','0','10']" 
			 data-y="['top','top','top','top']" data-voffset="['197','197','197','197']" 
						data-fontsize="['68','68','54','48']"
			data-width="none"
			data-height="none"
			data-whitespace="nowrap"
 
            data-type="text" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"split":"chars","splitdelay":0.05000000000000000277555756156289135105907917022705078125,"speed":2000,"split_direction":"forward","frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 5; white-space: nowrap; font-size: 68px; line-height: 22px; font-weight: 700; color: #ffffff; letter-spacing: -5px;font-family:Noto Sans;">버스 탑승은 이제 그만! </div>

		<!-- LAYER NR. 8 -->
		<div class="tp-caption   tp-resizeme rs-parallaxlevel-3" 
			 id="slide-64-layer-2" 
			 data-x="['left','left','left','left']" data-hoffset="['0','0','0','10']" 
			 data-y="['top','top','top','top']" data-voffset="['306','307','307','302']" 
						data-fontsize="['24','24','24','23']"
			data-width="['609','573','462','462']"
			data-height="['123','122','none','none']"
			data-whitespace="normal"
 
            data-type="text" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":2500,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"frame":"999","to":"y:50px;opacity:0;","ease":"Power2.easeIn"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 6; min-width: 609px; max-width: 609px; max-width: 123px; max-width: 123px; white-space: normal; font-size: 24px; line-height: 40px; font-weight: 400; color: #ffffff; letter-spacing: -1px;font-family:Noto Sans;">Teamplete를 통해 과제 제출 기한이 얼마나 남았는지, 누가 과제를 제출하지 않았는지 한 눈에 파악하세요. 또한 제출된 과제들을 편하게 모아서 볼 수 있습니다. </div>

		<!-- LAYER NR. 9 -->
		<div class="tp-caption tp-shape tp-shapewrapper  tp-resizeme rs-parallaxlevel-3" 
			 id="slide-64-layer-4" 
			 data-x="['left','left','left','left']" data-hoffset="['1','1','1','10']" 
			 data-y="['top','top','top','top']" data-voffset="['270','270','270','268']" 
						data-width="40"
			data-height="4"
			data-whitespace="nowrap"
 
            data-type="shape" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":300,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 7;background-color:rgb(255,255,255);"> </div>

		<!-- LAYER NR. 10 -->
		<a href="${ pageContext.request.contextPath }/member/join">
		<div class="tp-caption rev-btn rev-withicon  rs-parallaxlevel-3" 
			 id="slide-64-layer-10" 
			 data-x="['left','left','left','left']" data-hoffset="['5','5','5','10']" 
			 data-y="['top','top','top','top']" data-voffset="['482','482','482','484']" 
						data-width="none"
			data-height="none"
			data-whitespace="nowrap"
 
            data-type="button" 
			data-responsive_offset="on" 
			data-responsive="off"
            data-frames='[{"delay":10,"speed":1300,"frame":"0","from":"x:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"0","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(0,0,0,1);bg:rgba(255,255,255,1);bc:rgba(0,0,0,1);bw:0 0 0 0;"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[12,12,12,12]"
            data-paddingright="[35,35,35,35]"
            data-paddingbottom="[12,12,12,12]"
            data-paddingleft="[35,35,35,35]"

            style="z-index: 8; white-space: nowrap; font-size: 17px; line-height: 17px; font-weight: 800; color: #ffffff; letter-spacing: ;font-family:Nanum Gothic;background-color:rgba(255,255,255,0);border-color:rgb(255,255,255);border-style:solid;border-width:2px 2px 2px 2px;border-radius:30px 30px 30px 30px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">시작하기<i class="fa-icon-chevron-right"></i> </div>
		</a>
		<!-- LAYER NR. 11 -->
		<div class="tp-caption   tp-resizeme rs-parallaxlevel-3" 
			 id="slide-64-layer-11" 
			 data-x="['left','left','left','left']" data-hoffset="['3','3','3','10']" 
			 data-y="['top','top','top','top']" data-voffset="['88','88','88','93']" 
						data-width="none"
			data-height="none"
			data-whitespace="nowrap"
 
            data-type="image" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":300,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 9;"><img src="${ pageContext.request.contextPath }/resources/images/b3350-whitelogo.png" alt="" data-ww="['129px','129px','129px','129px']" data-hh="['34px','34px','34px','34px']" data-no-retina> </div>

		<!-- LAYER NR. 12 -->
		<div class="tp-caption   tp-resizeme" 
			 id="slide-64-layer-14" 
			 data-x="['right','right','right','right']" data-hoffset="['287','151','85','-255']" 
			 data-y="['top','top','top','top']" data-voffset="['175','168','188','183']" 
						data-width="175"
			data-height="124"
			data-whitespace="nowrap"
 
            data-type="text" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 10; min-width: 175px; max-width: 175px; max-width: 124px; max-width: 124px; white-space: nowrap; font-size: 250px; line-height: 22px; font-weight: 400; color: #ffffff; letter-spacing: 0px;font-family:Open Sans;"><i class="fa-icon-bus"></i> </div>
	</li>
	<!-- SLIDE  -->
    <li data-index="rs-65" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="300"  data-thumb="${ pageContext.request.contextPath }/resources/images/transparent.png"  data-rotate="0"  data-saveperformance="off"  data-mediafilter="gingham" data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
		<!-- MAIN IMAGE -->
        <img src="${ pageContext.request.contextPath }/resources/images/transparent.png" data-bgcolor='#ff943b' style='background:#ff943b' alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="9" class="rev-slidebg" data-no-retina>
		<!-- LAYERS -->

		<!-- LAYER NR. 13 -->
		<div class="tp-caption   tp-resizeme rs-parallaxlevel-3" 
			 id="slide-65-layer-1" 
			 data-x="['left','left','left','left']" data-hoffset="['0','0','30','10']" 
			 data-y="['top','top','top','top']" data-voffset="['197','197','197','194']" 
						data-fontsize="['68','60','42','40']"
			data-width="none"
			data-height="none"
			data-whitespace="nowrap"
 
            data-type="text" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"split":"chars","splitdelay":0.05000000000000000277555756156289135105907917022705078125,"speed":2000,"split_direction":"forward","frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 5; white-space: nowrap; font-size: 68px; line-height: 22px; font-weight: 700; color: #ffffff; letter-spacing: -5px;font-family:Noto Sans;">아직도 카톡으로 공지하세요? </div>

		<!-- LAYER NR. 14 -->
		<div class="tp-caption   tp-resizeme rs-parallaxlevel-3" 
			 id="slide-65-layer-2" 
			 data-x="['left','left','left','left']" data-hoffset="['0','0','30','9']" 
			 data-y="['top','top','top','top']" data-voffset="['305','307','307','309']" 
						data-fontsize="['24','24','24','23']"
			data-letterspacing="['-1','-1','-1','1']"
			data-width="['527','573','462','445']"
			data-height="['none','122','none','242']"
			data-whitespace="normal"
 
            data-type="text" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":2500,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"frame":"999","to":"y:50px;opacity:0;","ease":"Power2.easeIn"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 6; min-width: 527px; max-width: 527px; white-space: normal; font-size: 24px; line-height: 40px; font-weight: 400; color: #ffffff; letter-spacing: -1px;font-family:Noto Sans;">  긴 전달사항이나 지시를 아직도 메신저를 사용해서 보내시나요? 가독성은 떨어지고 확인해야할 문서는 많고, 채팅방 대화에 묻히고... 이제, Teamplete와  깔끔하고     세련되게 팀에게 메시지를 전달하세요!    </div>

		<!-- LAYER NR. 15 -->
		<div class="tp-caption tp-shape tp-shapewrapper  tp-resizeme rs-parallaxlevel-3" 
			 id="slide-65-layer-4" 
			 data-x="['left','left','left','left']" data-hoffset="['1','1','30','10']" 
			 data-y="['top','top','top','top']" data-voffset="['270','270','270','270']" 
						data-width="40"
			data-height="4"
			data-whitespace="nowrap"
 
            data-type="shape" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":300,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 7;background-color:rgb(255,255,255);"> </div>

		<!-- LAYER NR. 16 -->
		<a href="${ pageContext.request.contextPath }/member/join">
		<div class="tp-caption rev-btn rev-withicon  rs-parallaxlevel-3" 
			 id="slide-65-layer-10" 
			 data-x="['left','left','left','left']" data-hoffset="['5','5','30','11']" 
			 data-y="['top','top','top','top']" data-voffset="['482','482','536','538']" 
						data-width="none"
			data-height="none"
			data-whitespace="nowrap"
 
            data-type="button" 
			data-responsive_offset="on" 
			data-responsive="off"
            data-frames='[{"delay":10,"speed":1300,"frame":"0","from":"x:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"0","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(0,0,0,1);bg:rgba(255,255,255,1);bc:rgba(0,0,0,1);bw:0 0 0 0;"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[12,12,12,12]"
            data-paddingright="[35,35,35,35]"
            data-paddingbottom="[12,12,12,12]"
            data-paddingleft="[35,35,35,35]"

            style="z-index: 8; white-space: nowrap; font-size: 17px; line-height: 17px; font-weight: 800; color: #ffffff; letter-spacing: ;font-family:Nanum Gothic;background-color:rgba(255,255,255,0);border-color:rgb(255,255,255);border-style:solid;border-width:2px 2px 2px 2px;border-radius:30px 30px 30px 30px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">시작하기<i class="fa-icon-chevron-right"></i> </div>
		</a>
		<!-- LAYER NR. 17 -->
		<div class="tp-caption   tp-resizeme rs-parallaxlevel-3" 
			 id="slide-65-layer-11" 
			 data-x="['left','left','left','left']" data-hoffset="['3','3','30','10']" 
			 data-y="['top','top','top','top']" data-voffset="['88','88','88','97']" 
						data-width="none"
			data-height="none"
			data-whitespace="nowrap"
 
            data-type="image" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":300,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 9;"><img src="${ pageContext.request.contextPath }/resources/images/b3350-whitelogo.png" alt="" data-ww="['129px','129px','129px','129px']" data-hh="['34px','34px','34px','34px']" data-no-retina> </div>

		<!-- LAYER NR. 18 -->
		<div class="tp-caption   tp-resizeme rs-parallaxlevel-6" 
			 id="slide-65-layer-12" 
			 data-x="['right','right','right','right']" data-hoffset="['-127','-195','-234','-585']" 
			 data-y="['top','top','top','top']" data-voffset="['-53','-33','7','-33']" 
						data-width="none"
			data-height="none"
			data-whitespace="nowrap"
 
            data-type="image" 
			data-responsive_offset="on" 

            data-frames='[{"delay":10,"speed":1000,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"frame":"999","to":"y:50px;opacity:0;","ease":"Power3.easeInOut"}]'
            data-textAlign="['inherit','inherit','inherit','inherit']"
            data-paddingtop="[0,0,0,0]"
            data-paddingright="[0,0,0,0]"
            data-paddingbottom="[0,0,0,0]"
            data-paddingleft="[0,0,0,0]"

            style="z-index: 10;"><img src="${ pageContext.request.contextPath }/resources/images/object_iphone_3.png" alt="" data-ww="['750px','750px','750px','750px']" data-hh="['750px','750px','750px','750px']" data-no-retina> </div>
	</li>
</ul>
<div class="tp-bannertimer" style="height: 5px; background: rgba(0,0,0,0.15);"></div>	</div>
</div><!-- END REVOLUTION SLIDER -->

		</section>
				
				
				
				
				
				
				
		<jsp:include page="/WEB-INF/jsp/include/mainfooter.jsp" />
				
			</div>
			
			
		</div>
		
		

	<!-- END: Content-->


	<!-- BEGIN: Vendor JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.sticky.js"></script>


	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.themepunch.tools.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.themepunch.revolution.min.js"></script>

	<script
		src="${ pageContext.request.contextPath }/resources/js/revolution.extension.actions.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/revolution.extension.carousel.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/revolution.extension.kenburn.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/revolution.extension.layeranimation.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/revolution.extension.migration.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/revolution.extension.navigation.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/revolution.extension.parallax.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/revolution.extension.slideanims.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/revolution.extension.video.min.js"></script>

	
			



		
		
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/app-menu.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/app.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/components.js"></script>
		<script
		src="${ pageContext.request.contextPath }/resources/js/vegas.min.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<!-- END: Page JS-->


	

	<script>
	
 	<c:if test = '${ not empty loginVO }'>
    	location.href = "${ pageContext.request.contextPath}/team/${ loginVO.memberid }"
	</c:if>

		
   if ("${ param.msg }")
      alert("${ param.msg }");
   
     $(function(){
	   $('body').vegas({
		   slides:[
			   {src: '${ pageContext.request.contextPath }/resources/images/bg1.jpg'},
			   {src: '${ pageContext.request.contextPath }/resources/images/bg2.jpg'},
			   {src: '${ pageContext.request.contextPath }/resources/images/bg3.jpg'},
			   {src: '${ pageContext.request.contextPath }/resources/images/bg4.jpg'},
			   {src: '${ pageContext.request.contextPath }/resources/images/bg5.jpg'},
			   {src: '${ pageContext.request.contextPath }/resources/images/bg6.jpg'},
			   {src: '${ pageContext.request.contextPath }/resources/images/bg7.jpg'},
			   {src: '${ pageContext.request.contextPath }/resources/images/bg8.jpg'},
			   {src: '${ pageContext.request.contextPath }/resources/images/bg9.jpg'},
			   {src: '${ pageContext.request.contextPath }/resources/images/bg10.jpg'}
		   ],
		   delay:5500,
		   timer:false,
		   overlay: '${ pageContext.request.contextPath }/resources/images/06.png',
		   transition: 'fade'
		  
		   
		   
	   })
   });
     
     
    
    
   
   function setREVStartSize(e){                                    
			try{ e.c=jQuery(e.c);var i=jQuery(window).width(),t=9999,r=0,n=0,l=0,f=0,s=0,h=0;
				if(e.responsiveLevels&&(jQuery.each(e.responsiveLevels,function(e,f){f>i&&(t=r=f,l=e),i>f&&f>r&&(r=f,n=e)}),t>r&&(l=n)),f=e.gridheight[l]||e.gridheight[0]||e.gridheight,s=e.gridwidth[l]||e.gridwidth[0]||e.gridwidth,h=i/s,h=h>1?1:h,f=Math.round(h*f),"fullscreen"==e.sliderLayout){var u=(e.c.width(),jQuery(window).height());if(void 0!=e.fullScreenOffsetContainer){var c=e.fullScreenOffsetContainer.split(",");if (c) jQuery.each(c,function(e,i){u=jQuery(i).length>0?u-jQuery(i).outerHeight(!0):u}),e.fullScreenOffset.split("%").length>1&&void 0!=e.fullScreenOffset&&e.fullScreenOffset.length>0?u-=jQuery(window).height()*parseInt(e.fullScreenOffset,0)/100:void 0!=e.fullScreenOffset&&e.fullScreenOffset.length>0&&(u-=parseInt(e.fullScreenOffset,0))}f=u}else void 0!=e.minHeight&&f<e.minHeight&&(f=e.minHeight);e.c.closest(".rev_slider_wrapper").css({height:f})                    
			}catch(d){console.log("Failure at Presize of Slider:"+d)}                        
		};
   
   
   		
	    var revapi13,tpj;
(function() {
if (!/loaded|interactive|complete/.test(document.readyState)) document.addEventListener("DOMContentLoaded",onLoad); else onLoad();

function onLoad() {
    if (tpj===undefined) { tpj = jQuery; if("off" == "on") tpj.noConflict();}
			if(tpj("#rev_slider_13_1").revolution == undefined){
				revslider_showDoubleJqueryError("#rev_slider_13_1");
			}else{
				revapi13 = tpj("#rev_slider_13_1").show().revolution({
					sliderType:"standard",
jsFileLocation:"//localhost/revslider/public/assets/js/",
					sliderLayout:"fullscreen",
					dottedOverlay:"none",
					delay:9000,
					navigation: {
						keyboardNavigation:"off",
						keyboard_direction: "horizontal",
						mouseScrollNavigation:"off",
                         mouseScrollReverse:"default",
						onHoverStop:"on",
						touch:{
							touchenabled:"on",
							touchOnDesktop:"off",
							swipe_threshold: 75,
							swipe_min_touches: 50,
							swipe_direction: "horizontal",
							drag_block_vertical: false
						}
						,
						arrows: {
							style:"hesperiden",
							enable:true,
							hide_onmobile:true,
							hide_under:600,
							hide_onleave:true,
							hide_delay:200,
							hide_delay_mobile:1200,
							tmp:'',
							left: {
								h_align:"left",
								v_align:"center",
								h_offset:30,
                                v_offset:0
							},
							right: {
								h_align:"right",
								v_align:"center",
								h_offset:30,
                                v_offset:0
							}
						}
						,
						bullets: {
							enable:true,
							hide_onmobile:true,
							hide_under:600,
							style:"hephaistos",
							hide_onleave:true,
							hide_delay:200,
							hide_delay_mobile:1200,
							direction:"horizontal",
							h_align:"center",
							v_align:"bottom",
							h_offset:0,
							v_offset:30,
                            space:5,
							tmp:''
						}
					},
					responsiveLevels:[1240,1024,778,480],
					visibilityLevels:[1240,1024,778,480],
					gridwidth:[1240,1024,778,480],
					gridheight:[600,768,960,720],
					lazyType:"none",
					parallax: {
						type:"mouse",
						origo:"slidercenter",
						speed:2000,
                      speedbg:0,
                      speedls:0,
						levels:[2,3,4,5,6,7,12,16,10,50,47,48,49,50,51,55],
					},
					shadow:0,
					spinner:"off",
					stopLoop:"off",
					stopAfterLoops:-1,
					stopAtSlide:-1,
					shuffle:"off",
					autoHeight:"off",
					fullScreenAutoWidth:"off",
					fullScreenAlignForce:"off",
					fullScreenOffsetContainer: "",
					fullScreenOffset: "",
					hideThumbsOnMobile:"off",
					hideSliderAtLimit:0,
					hideCaptionAtLimit:0,
					hideAllCaptionAtLilmit:0,
					debugMode:false,
					fallbacks: {
						simplifyAll:"off",
						nextSlideOnWindowFocus:"off",
						disableFocusListener:false,
					}
				});
}; /* END OF revapi call */
 }; /* END OF ON LOAD FUNCTION */
}()); /* END OF WRAPPING FUNCTION */
		
   
</script>
</body>
</html>