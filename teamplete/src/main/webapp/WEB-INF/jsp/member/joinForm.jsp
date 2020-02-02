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
	href="${ pageContext.request.contextPath }/resources/css/bootstrap-extended.css">	
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/components.css">

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
	



<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/dark-layout.css">
	<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/semi-dark-layout.css">

<!-- BEGIN: Page CSS-->
	<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/vegas.min.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/palette-gradient.css">
	
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/sweetalert2.min.css">

<!-- END: Page CSS-->
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://unpkg.com/feather-icons"></script>
<style>
.error {
   color: red;
}
#logoimg:hover{
opacity:0.8;
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
                                    <a href="${ pageContext.request.contextPath }/"><img src="${ pageContext.request.contextPath }/resources/images/register.png" id="logoimg" alt="branding logo"></a>
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


				<form:input path="name" class="form-control" id="username" placeholder = "성함을 입력해 주세요." size="35px"  />
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

				<input  type="password" id="password2" class="form-control"
					placeholder = "비밀번호를 다시 입력해 주세요." size="35px"/>
				<br>
				
			</div>


			<div class="form-label-group">
				<label for="email" class="text-uppercase">Email</label><br />

				<form:input path="email" class="form-control" placeholder = "E-mail" size="35px" />
			</div>
			
			<div class="form-group row">
                                                        <div class="col-12">
                                                            <div class="vs-checkbox-con vs-checkbox-success" data-toggle="modal" data-target="#policy">
                                                        <input type="checkbox" id="policycheckbox" value="false">
                                                        <span class="vs-checkbox">
                                                            <span class="vs-checkbox--check">
                                                                <i class="vs-icon feather icon-check"></i>
                                                            </span>
                                                        </span>
                                                                    <span > 개인 정보 처리 방침 및 이용 약관에 동의합니다.</span>
                                                                </div>
                                                            
                                                            
                                                            
                                                           <div class="modal fade" id="policy" tabindex="-1" role="dialog" aria-labelledby="개인 정보 처리 방침 및 이용 약관" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-scrollable" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title text-primary" id="policyTitle">개인 정보 처리 방침 및 이용 약관</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body" style="color:black; font-family:'Inter';">
																				('www.teamplete.net'이하 'Teamplete')은(는) 개인정보보호법에 따라
																				이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할
																				수 있도록 다음과 같은 처리방침을 두고 있습니다. ('Teamplete') 은(는) 회사는
																				개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

																				○ 본 방침은부터 2020년 1월 14일부터 시행됩니다. 1. 개인정보의 처리 목적
																				('www.teamplete.net'이하 'Teamplete')은(는) 개인정보를 다음의
																				목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용
																				목적이 변경될 시에는 사전동의를 구할 예정입니다. 가. 홈페이지 회원가입 및 관리 회원
																				가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리 등을 목적으로
																				개인정보를 처리합니다. 나. 재화 또는 서비스 제공 콘텐츠 제공, 맞춤 서비스 제공 등을
																				목적으로 개인정보를 처리합니다. 2. 개인정보 파일 현황
																				('www.teamplete.net'이하 'Teamplete')가 개인정보 보호법 제32조에
																				따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다. ※
																				기타('www.teamplete.net'이하 'Teamplete')의 개인정보파일 등록사항
																				공개는 행정안전부 개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원
																				→ 개인정보열람등 요구 → 개인정보파일 목록검색 메뉴를 활용해주시기 바랍니다. 3. 개인정보의
																				처리 및 보유 기간 ① ('Teamplete')은(는) 법령에 따른 개인정보 보유·이용기간
																				또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를
																				처리,보유합니다. ② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다. 1.
																				<홈페이지 회원가입 및 관리> <홈페이지 회원가입 및 관리>와 관련한
																				개인정보는 수집.이용에 관한 동의일로부터<준영구>까지 위 이용목적을 위하여
																				보유.이용됩니다. -보유근거 : 회원 관리 -관련법령 : -예외사유 : 4. 정보주체와
																				법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수
																				있습니다. ① 정보주체는 Teamplete에 대해 언제든지 개인정보 열람,정정,삭제,처리정지
																				요구 등의 권리를 행사할 수 있습니다. ② 제1항에 따른 권리 행사는Teamplete에 대해
																				개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여
																				하실 수 있으며 Teamplete은(는) 이에 대해 지체 없이 조치하겠습니다. ③ 제1항에
																				따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수
																				있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야
																				합니다. ④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조
																				제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다. ⑤ 개인정보의 정정 및 삭제 요구는
																				다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수
																				없습니다. ⑥ Teamplete은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구,
																				처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다. 5.
																				처리하는 개인정보의 항목 작성 ① ('www.teamplete.net'이하
																				'Teamplete')은(는) 다음의 개인정보 항목을 처리하고 있습니다. 1<홈페이지 회원가입
																					및 관리> - 필수항목 : 비밀번호, 로그인ID, 이름 - 선택항목 : 이메일




																				6. 개인정보의 파기('Teamplete')은(는) 원칙적으로 개인정보 처리목적이 달성된
																				경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.

																				-파기절차 이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의
																				서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이
																				때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.

																				-파기기한 이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터
																				5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가
																				불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그
																				개인정보를 파기합니다. 7. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항 ①
																				Teamplete 은 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는
																				‘쿠기(cookie)’를 사용합니다. ② 쿠키는 웹사이트를 운영하는데 이용되는
																				서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC
																				컴퓨터내의 하드디스크에 저장되기도 합니다. 가. 쿠키의 사용 목적 : 이용자가 방문한 각
																				서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여
																				이용자에게 최적화된 정보 제공을 위해 사용됩니다. 나. 쿠키의 설치•운영 및 거부 :
																				웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수
																				있습니다. 다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.


																				8. 개인정보 보호책임자 작성 ① Teamplete(‘www.teamplete.net’이하
																				‘Teamplete) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와
																				관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고
																				있습니다. ▶ 개인정보 보호책임자 성명 :고동욱 직책 :개인정보 보호책임자 직급 :개인정보 보호책임자 연락처
																				:010-2051-2131, wkrleksm1@naver.com, ※ 개인정보 보호 담당부서로
																				연결됩니다. ▶ 개인정보 보호 담당부서 부서명 : 담당자 : 연락처 :, , ② 정보주체께서는
																				Teamplete(‘www.teamplete.net’이하 ‘Teamplete) 의 서비스(또는
																				사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한
																				사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다.
																				Teamplete(‘www.teamplete.net’이하 ‘Teamplete) 은(는)
																				정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다. 9. 개인정보 처리방침 변경

																				①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및
																				정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다. 10.
																				개인정보의 안전성 확보 조치 ('Teamplete')은(는) 개인정보보호법 제29조에 따라
																				다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다. 1.
																				정기적인 자체 감사 실시 개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체
																				감사를 실시하고 있습니다. 2. 개인정보 취급 직원의 최소화 및 교육 개인정보를 취급하는
																				직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.

																				3. 내부관리계획의 수립 및 시행 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고
																				시행하고 있습니다. 4. 해킹 등에 대비한 기술적 대책 <Teamplete>('Teamplete')은
																				해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을
																				설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고
																				기술적/물리적으로 감시 및 차단하고 있습니다. 5. 개인정보의 암호화 이용자의 개인정보는
																				비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일
																				및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고
																				있습니다. 6. 접속기록의 보관 및 위변조 방지 개인정보처리시스템에 접속한 기록을 최소 6개월
																				이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고
																				있습니다. 7. 개인정보에 대한 접근 제한 개인정보를 처리하는 데이터베이스시스템에 대한
																				접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고
																				있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다. 8. 문서보안을
																				위한 잠금장치 사용 개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에
																				보관하고 있습니다. 9. 비인가자에 대한 출입 통제 개인정보를 보관하고 있는 물리적 보관
																				장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다. 
																			</div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-primary" onClick="policyCheck()" data-dismiss="modal">처리 방침에 동의합니다</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
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
	<script src="${ pageContext.request.contextPath }/resources/js/sweetalert2.all.min.js"></script>
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

		        			var regex = /^[A-Za-z0-9]+$/
		        			var isValidId=regex.test(document.getElementById("memberid").value);
		        			if (!isValidId){
		        				Swal.fire({
		        					  title: 'Error!',
		        					  text: '아이디에는 알파벳 및 숫자만 입력 가능해요!',
		        					  type: 'error',
		        					  confirmButtonText: '네, 알겠어요!'
		        					})
		        				return false;
		        			}	
		            		
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
	   var form = document.joinForm;
	   var password=document.getElementById('password');
	   var password2=document.getElementById('password2');
	   
	   function policyCheck() {
		    document.getElementById("policycheckbox").checked = true;
		}
	  
		function checkJoinForm() {
			
			var regex = /^[A-Za-z0-9]+$/
			var isValidId=regex.test(document.getElementById("memberid").value);
			if (!isValidId){
				Swal.fire({
					  title: 'Error!',
					  text: '아이디에는 알파벳 및 숫자만 입력 가능해요!',
					  type: 'error',
					  confirmButtonText: '네, 알겠어요!'
					})
				return false;
			}

		
			if ($("button[name='checkbtn']").val() != "0") {
				console.log($("button[name='checkbtn']").val());
				Swal.fire({
					  title: 'Error!',
					  text: '아이디 중복체크를 해주세요!',
					  type: 'error',
					  confirmButtonText: '네, 알겠어요!'
					})
				return false;
			}
			
			if(document.getElementById("policycheckbox").checked = false){
				Swal.fire({
					  title: 'Error!',
					  text: '개인정보 처리방침 및 이용약관에 동의해주세요!',
					  type: 'error',
					  confirmButtonText: '네, 알겠어요!'
					})
				return false;
			}
			
			
			

			if (password.value != password2.value) {
				Swal.fire({
					  title: 'Error!',
					  text: '비밀번호와 비밀번호 확인에 입력된 값이 다릅니다!',
					  type: 'error',
					  confirmButtonText: '네, 알겠어요!'
					})
				return false;
			} else {
				 
				 var isValid= regex.test(password.value);
				 if(!isValid){
					 Swal.fire({
						  title: 'Error!',
						  text: '비밀번호는 영문 대소문자 및 숫자만 입력 가능합니다!',
						  type: 'error',
						  confirmButtonText: '네, 알겠어요!'
						})
					return false;
				 }
				
				if (password.value.length < 6) {
					Swal.fire({
						  title: '비밀번호가 너무 짧아요!',
						  text: '비밀번호는 6자리 이상이어야 합니다!',
						  type: 'error',
						  confirmButtonText: '네, 알겠어요!'
						})
					return false;
				}
				if (password.value.length > 15) {
					Swal.fire({
						  title: '비밀번호가 너무 길어요!',
						  text: '비밀번호는 15자리 이하여야 합니다!',
						  type: 'error',
						  confirmButtonText: '네, 알겠어요!'
						})
					return false;
				}
			}
			
			Swal.fire({
				  title: '회원 가입에 성공했습니다.',
				  text: '이제, Teamplete에 로그인하세요',
				  type: 'success',
				  confirmButtonColor: '#3085d6',
				  confirmButtonText: '네, 알겠어요!'
			}).then((result) => {
				  if (result.value) {
					  form.submit();
				  }
				})
				
				
			
			
			

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