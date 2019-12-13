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
                    <div class="col-xl-8 col-10 d-flex justify-content-center">
                        <div class="card bg-authentication rounded-0 mb-0">
                            <div class="row m-0">
                                <div class="col-lg-6 d-lg-block d-none text-center align-self-center pl-0 pr-3 py-0">
                                    <img src="${ pageContext.request.contextPath }/resources/images/register.jpg" alt="branding logo">
                                </div>
                                <div class="col-lg-6 col-12 p-0">
                                    <div class="card rounded-0 mb-0 p-2">
                                    
                                        <div class="card-header pt-50 pb-1">
                                            <div class="card-title">
                                                <h3 class="text-bold-600 mb-0">계정 생성</h3>
                                            </div>
                                        </div>
                                        <p class="px-2" style="font-weight:400">회원가입에 필요한 정보를 입력해주세요.</p>
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
				<div id="checkMsg" class="form-control-plaintext"></div>	
				<button type="button" id="checkbtn" name="checkbtn" class="btn btn-success btn-inline"
					style="margin-top: 2%;">ID중복체크</button>		
				</div>
							
				
				

			</div>
			<div class="form-label-group">
				<label for="name" class="text-uppercase">Username</label><br />


				<form:input path="name" class="form-control" placeholder = "Username" size="35px" />
				<form:errors path="name" class="error" />
				<br>
				
				<form:hidden path="profile" value="" />
				<form:hidden path="kakao" value="N" />
			</div>


			<div class="form-label-group">
				<label for="password" class="text-uppercase">Password</label><br />

				<form:input path="password" type="password" class="form-control"
					placeholder = "Password" size="35px" />
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
                                                                    <span class=""> I accept the terms & conditions.</span>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </div>

			<button type="button" class="btn btn-primary float-center btn-inline" onClick="checkJoinForm()">회원가입</button>

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
		            		$('#checkMsg').html('<p style="color:red !important;, font-weight:700;">아이디를 입력해주세요</p>');
		            	}else {
		               if ($.trim(result) == 0) {
		            	   console.log(result);
		                  $('#checkMsg').html('<p style="color:blue !important;, font-weight:700;">사용가능한 아이디입니다</p>');
		            	  $("button[name='checkbtn']").val(result);
		            	  console.log("사용가능: "+$("button[name='checkbtn']").val())
		               } else {
		            	   console.log(result);
		                  $('#checkMsg').html('<p style="color:red !important;, font-weight:700;">이미 중복된 아이디가 있습니다</p>');
		            	  $("button[name='checkbtn']").val(result);
		            	  console.log("사용불가능: "+$("button[name='checkbtn']").val())
		               }
		            	}
		            }
		         });

		      });
		      
		   });
	   
	  	function checkJoinForm() {
			if($("button[name='checkbtn']").val() == "0") {
				var form = document.joinForm;
				form.submit();
			}else {
				console.log($("button[name='checkbtn']").val());
				alert("아이디 중복체크를 해주세요. ");
				return false;
			}
		}
	   
	  
	
	</script>
</body>
</html>