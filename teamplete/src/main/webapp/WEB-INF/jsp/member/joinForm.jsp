<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/components.css">

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
	



<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/dark-layout.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/semi-dark-layout.css">

<!-- BEGIN: Page CSS-->
	<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/vegas.min.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/palette-gradient.css">
<!-- END: Page CSS-->
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

</script>
<style>
.error {
   color: red;
}
</style>
</head>
<body class="horizontal-layout horizontal-menu 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page" data-open="hover" data-menu="horizontal-menu" data-col="1-column">
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <section class="row flexbox-container">
                    <div class="col-xl-8 col-10 col-sm-0 d-flex justify-content-center">
                        <div class="card bg-authentication rounded-0 mb-0" style="background-color:transparent !important;">
                            <div class="row m-0">
                                <div class="col-lg-6 d-lg-block d-none text-center align-self-center pl-0 pr-3 py-0">
                                    <a href="${ pageContext.request.contextPath }/main.jsp"><img src="${ pageContext.request.contextPath }/resources/images/register.png" alt="branding logo"></a>
                                </div>
                                <div class="col-lg-6 col-12 col-sm-6 p-0">
                                    <div class="rounded-0 mb-0 p-2" style="background-color:transparent; color:white !important">
                                    
                                        <div class="card-header pt-50 pb-1">
                                            
                                                <h2 class="mb-0"  style="color:white; font-weight:600;">계정 생성</h2>
                                            
                                        </div>
                                        <p class="px-2" style="font-weight:400; font-size:1.2rem;">회원가입에 필요한 정보를 입력해주세요.</p>
                                        <div class="card-content">
                                            <div class="card-body pt-0">
                                                <div>
		<form:form method="post" commandName="memberVO" class="login-form" name="joinForm">
			<div class="form-label-group">
				<label for="id" class="text-uppercase">ID</label><br />
				<div class="form-group">
				<form:input path="memberid" id="memberid" class="form-control"
					placeholder = "ID" size="35px" />
				<br>
				
				
				<form:errors path="memberid" class="error" />
				<div id="checkMsg" class="form-control-plaintext mb-0 pb-0"></div>	
				<button type="button"  id="checkbtn" name="checkbtn" class="btn btn-outline-light mt-0"
				>ID중복체크</button>
					
				</div>
							
				
				

			</div>
			<div class="form-label-group">
				<label for="name" class="text-uppercase">이름</label><br />


				<form:input path="name" class="form-control" placeholder = "성함을 입력해 주세요." size="35px" />
				<form:errors path="name" class="error" />
				<br>
				
				<form:hidden path="profile" value="" />
				<form:hidden path="kakao" value="N" />
			</div>


			<div class="form-label-group">
				<label for="비밀번호" class="text-uppercase">비밀번호(6자 이상 15자 이하)</label><br />

				<form:input path="password" type="password" class="form-control"
					id="password" placeholder = "비밀번호를 입력해 주세요." size="35px" />
				<br>
				<form:errors path="password" class="error" />
			</div>
			
			<div class="form-label-group">
				<label for="비밀번호 재확인" class="text-uppercase">비밀번호 재 입력</label><br />

				<form:input path="password" type="password" id="password2" class="form-control"
					placeholder = "비밀번호를 다시 입력해 주세요." size="35px" />
				<br>
				<form:errors path="password" class="error" />
			</div>


			<div class="form-label-group">
				<label for="email" class="text-uppercase">Email</label><br />

				<form:input path="email" class="form-control" placeholder = "E-mail" size="35px" />
			</div>
			
			<div class="form-group row">
                                                        <div class="col-12">
                                                            <fieldset class="checkbox">
                                                                <div class="vs-checkbox-con vs-checkbox-primary">
                                                                    <input type="checkbox" checked>
                                                                    <span class="vs-checkbox">
                                                                        <span class="vs-checkbox--check">
                                                                            <i class="vs-icon feather icon-check"></i>
                                                                        </span>
                                                                    </span>
                                                                    <span class=""> 개인 정보 취급 방침 및 이용 약관에 동의합니다.</span>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </div>

			<button type="button" class="btn btn-primary float-center btn-block" onClick="checkJoinForm()">회원가입</button>

		</form:form>
	</div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>
	
<!-- BEGIN: Vendor JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.sticky.js"></script>
	<!-- END: Page Vendor JS-->

	<script
		src="${ pageContext.request.contextPath }/resources/js/vegas.min.js"></script>
	<!-- BEGIN: Theme JS-->
	<script
		src="${ pageContext.request.contextPath }/resources/js/app-menu.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/app.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/components.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<!-- END: Page JS-->
	
	
	<script>
	
	   $(document).ready(function() {
		      $('#checkbtn').on('click', function() {
		         $.ajax({
		            type : 'POST',
		            url : '/checkSignUp',
		            data : {
		               "idCheck" : $('#memberid').val()
		            },
		            success : function(result) {
		            	if($('#memberid').val() == "") {
		            		$('#checkMsg').html('<p style="color:red !important;, font-size:1.2rem; font-weight:600;">아이디를 입력해주세요</p>');
		            	}else {
		               if ($.trim(result) == 0) {
		            	   console.log(result);
		                  $('#checkMsg').html('<p style="color:blue !important; font-size:1.2rem; font-weight:600;">사용가능한 아이디입니다</p>');
		            	  $("button[name='checkbtn']").val(result);
		            	  console.log("사용가능: "+$("button[name='checkbtn']").val())
		               } else {
		            	   console.log(result);
		                  $('#checkMsg').html('<p style="color:red !important; font-size:1.2rem; font-weight:600;">이미 중복된 아이디가 있습니다</p>');
		            	  $("button[name='checkbtn']").val(result);
		            	  console.log("사용불가능: "+$("button[name='checkbtn']").val())
		               }
		            	}
		            }
		         });

		      });
		      
		   });
	   const form = document.joinForm;
	   const password=document.getElementById('password');
	   const password2=document.getElementById('password2');
	   
	   
	   
	  
		function checkJoinForm() {

			
		
			if ($("button[name='checkbtn']").val() != "0") {
				console.log($("button[name='checkbtn']").val());
				alert("아이디 중복체크를 해주세요. ");
				return false;
			}

			if (password.value != password2.value) {
				alert("비밀번호와 비밀번호 확인에 입력된 값이 다릅니다.");
				return false;
			} else {
				if (password.value.length < 6) {
					alert("비밀번호는 6자 이상이어야 합니다.");
					return false;
				}
				if (password.value.length > 15) {
					alert("비밀번호는 15자 이하이어야 합니다.");
					return false;
				}
			}
			form.submit();

		}

		

		if ("${ param.msg }")
			alert("${ param.msg }");

		$(function() {
			$('body')
					.vegas(
							{
								slides : [
										{
											src : '${ pageContext.request.contextPath }/resources/images/bg1.jpg'
										},
										{
											src : '${ pageContext.request.contextPath }/resources/images/bg2.jpg'
										},
										{
											src : '${ pageContext.request.contextPath }/resources/images/bg3.jpg'
										},
										{
											src : '${ pageContext.request.contextPath }/resources/images/bg4.jpg'
										},
										{
											src : '${ pageContext.request.contextPath }/resources/images/bg5.jpg'
										},
										{
											src : '${ pageContext.request.contextPath }/resources/images/bg6.jpg'
										},
										{
											src : '${ pageContext.request.contextPath }/resources/images/bg7.jpg'
										},
										{
											src : '${ pageContext.request.contextPath }/resources/images/bg8.jpg'
										},
										{
											src : '${ pageContext.request.contextPath }/resources/images/bg9.jpg'
										},
										{
											src : '${ pageContext.request.contextPath }/resources/images/bg10.jpg'
										} ],
								delay : 5500,
								timer : false,
								overlay : '${ pageContext.request.contextPath }/resources/images/06.png',
								transition : 'fade'

							})
		});
	</script>
</body>
</html>