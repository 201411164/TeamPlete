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
	href="${ pageContext.request.contextPath }/resources/css/theme-elements.css">

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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%-- <jsp:include page="/WEB-INF/jsp/include/navbar.jsp" /> --%>

</head>
<body>

	<c:choose>
		<c:when test="${ empty loginVO }">
			<%
				response.sendRedirect("/");
			%>
		</c:when>
		<c:otherwise>

<c:import url="/navbar/${ loginVO.memberid }" />
		
		<input type="hidden" name="memberid" id="memberid"
												value="${ user.memberid }">

		
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
					
					<div class="card">
						<div class="card-header d-flex justify-content-between">
										<h4 class="text-primary mr-1" style="font-family:'Inter'; font-weight:700; font-size:26px;">상점</h4>
										<i class="feather icon-more-horizontal cursor-pointer"></i>
									</div>

						<div class="card-content">
							<div class="card-body">
											
											
											
							 <div class="pricing-table pricing-table-no-gap mb-4">
						<div class="col-md-4">
							<div class="plan">
								<div class="plan-header">
									<h3>Basic</h3>
								</div>
								<div class="plan-price">
								<span class="price">무료</span>
									<label class="price-label">1개월</label>
									
								</div>
								<div class="plan-features">
									<ul>
										<li><strong>1</strong>개의 팀 생성 가능</li>
										<li>최대 <strong>5</strong>명의 팀원 수</li>
										<li><strong>15</strong>개의 게시글 작성 가능</li>
										<li><strong>100</strong>MByte의 저장 공간</li>
									</ul>
								</div>
								<div class="plan-footer">
								<c:choose>
							<c:when test="${user.type eq 'U'}">
							<a href="#" class="btn btn-dark btn-modern btn-outline py-2 px-4">현재 사용중인 플랜</a>
							</c:when>
							</c:choose>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="plan plan-featured">
								<div class="plan-header bg-primary">
									<h3>Gold</h3>
								</div>
								<div class="plan-price">
									<span class="price"><small><del class="muted">7,900</del></small>-> <mark>4,900</mark><span class="price-unit">₩</span></span>
									<label class="price-label">1개월</label>
								</div>
								
								<div class="plan-features">
									<ul>
										<li>최대 <strong>5</strong>개의 팀 생성 가능</li>
										<li>최대 <strong>20</strong>명의 팀원 수</li>
										<li>무제한 게시글 작성 가능</li>
										<li><strong>2</strong>GByte의 저장 공간</li>
									</ul>
								</div>
								<div class="plan-footer">
								<c:choose>
							<c:when test="${user.type eq 'G'}">
							<a href="#" class="btn btn-primary btn-modern py-2 px-4">현재 사용중인 플랜</a>
							</c:when>
							<c:when test="${user.type eq 'U'}">
							<a href="#" id="upGold" class="btn btn-primary btn-modern py-2 px-4">구독하기</a>
							</c:when>
							</c:choose>
									
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="plan">
								<div class="plan-header">
									<h3>Premium</h3>
								</div>
								<div class="plan-price">
									
									<span class="price">13,900<span class="price-unit">₩</span></span>
									<label class="price-label">1개월</label>
								</div>
								
								<div class="plan-features">
									<ul>
										<li>무제한 팀 생성</li>
										<li>무제한 팀원 수</li>
										<li>무제한 게시글 작성 가능</li>
										<li>10GB의 저장 공간</li>
									</ul>
								</div>
								<div class="plan-footer">
								<c:choose>
							<c:when test="${user.type eq 'P'}">
							<a href="#" class="btn btn-dark btn-modern btn-outline py-2 px-4">현재 사용중인 플랜</a>
							</c:when>
							
							<c:otherwise>
							<a href="#" id="upPremium" class="btn btn-dark btn-modern btn-outline py-2 px-4">구독하기</a>
							</c:otherwise>
							</c:choose>
								</div>
							</div>
						</div>
					</div>
							
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

	
$("#upGold").click(function () {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp83333023');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
	pg: 'kakao', // version 1.1.0부터 지원.
	/*
	'kakao':카카오페이,
	html5_inicis':이니시스(웹표준결제)
	'nice':나이스페이
	'jtnet':제이티넷
	'uplus':LG유플러스
	'danal':다날
	'payco':페이코
	'syrup':시럽페이
	'paypal':페이팔
	*/
	pay_method: 'card',
	/*
	'samsung':삼성페이,
	'card':신용카드,
	'trans':실시간계좌이체,
	'vbank':가상계좌,
	'phone':휴대폰소액결제
	*/
	merchant_uid: 'merchant_' + new Date().getTime(),
	/*
	*/
	name: 'Teamplete : 골드 유저 업그레이드',
	//결제창에서 보여질 이름
	amount: 4900,
	//가격
	//buyer_email: 'wkrleksm1@naver.com',
	buyer_name: '고동욱',
	//buyer_tel: '010-2051-2131',
	//buyer_addr: '경기도 파주시 와석순환로 307',
	//buyer_postcode: '10892',
	
	}, function (rsp) {
	console.log(rsp);
	if (rsp.success) {
	
		var data = {
				"memberid" : $('#memberid').val(),
				"type" : "G"
			};
		
		$.ajax({
			type : 'PUT',
			url : '/mypage/updatetype',
			data : JSON.stringify(data),
	        contentType : "application/json",
			success : function(result) {
				console.log(data);
				location.reload();
			},
			error : function(request, status, error) {
				console.log(data);
	            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
		
	var msg = '결제가 완료되었습니다.';
	msg += '고유ID : ' + rsp.imp_uid;
	msg += '상점 거래ID : ' + rsp.merchant_uid;
	msg += '결제 금액 : ' + rsp.paid_amount;
	msg += '카드 승인번호 : ' + rsp.apply_num;
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);
	});
	});
	
	
$("#upPremium").click(function () {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp83333023');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
	pg: 'kakao', // version 1.1.0부터 지원.
	/*
	'kakao':카카오페이,
	html5_inicis':이니시스(웹표준결제)
	'nice':나이스페이
	'jtnet':제이티넷
	'uplus':LG유플러스
	'danal':다날
	'payco':페이코
	'syrup':시럽페이
	'paypal':페이팔
	*/
	pay_method: 'card',
	/*
	'samsung':삼성페이,
	'card':신용카드,
	'trans':실시간계좌이체,
	'vbank':가상계좌,
	'phone':휴대폰소액결제
	*/
	merchant_uid: 'merchant_' + new Date().getTime(),
	/*
	*/
	name: 'Teamplete : 프리미엄 유저 업그레이드',
	//결제창에서 보여질 이름
	amount: 13900,
	//가격
	//buyer_email: 'wkrleksm1@naver.com',
	buyer_name: '고동욱',
	//buyer_tel: '010-2051-2131',
	//buyer_addr: '경기도 파주시 와석순환로 307',
	//buyer_postcode: '10892',
	
	}, function (rsp) {
	console.log(rsp);
	if (rsp.success) {
	
		var data = {
				"memberid" : $('#memberid').val(),
				"type" : "P"
			};
		
		$.ajax({
			type : 'PUT',
			url : '/mypage/updatetype',
			data : JSON.stringify(data),
	        contentType : "application/json",
			success : function(result) {
				console.log(data);
				location.reload();
			},
			error : function(request, status, error) {
				console.log(data);
	            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
		
	var msg = '결제가 완료되었습니다.';
	msg += '고유ID : ' + rsp.imp_uid;
	msg += '상점 거래ID : ' + rsp.merchant_uid;
	msg += '결제 금액 : ' + rsp.paid_amount;
	msg += '카드 승인번호 : ' + rsp.apply_num;
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);
	});
	});	
	




























function checkpw() {
    $.ajax({
        type : 'POST',
        url : '/checkPW',
		data : {
			  "memberid" : $('#memberid').val(),
			  "password" : $('#password').val()
		},
        success : function(result) {
           if ($.trim(result) == 1) {
//               alert("비밀번호가 맞습니다.");
				var input = document.getElementById('password');
          	input.value = "";
          	$('#checkPWForm').modal("hide");
				$("#modifyMyInfo").modal();
           } else {
          	alert("비밀번호가 틀렸습니다. 다시 입력해주세요.");
          	var input = document.getElementById('password');
          	input.value = "";
           }
        },
        error : function(request, status, error) {
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
     });
};

// $(document).ready(function() {
//     $('#checkPWBtn').on('click', checkpw());
// });


$("#password").keydown(function(key) {
    if (key.keyCode == 13) {// 엔터
    	checkpw();
    }
});


//회원정보 수정
$("#modifyInfoBtn").click(function() {
	
	var password1 = $('#pwModify').val();
	var password2 = $('#pwModify2').val();
	var pw;
   
	if(password1 != password2){
		alert("비밀번호와 비밀번호 확인에 입력된 값이 다릅니다");
		var input = document.getElementById('pwModify2');
        input.value = "";
          	
	} else if(password1 != "" && password2 == "") {
		
		alert("비밀번호 확인을 입력해주세요");
		
	} else {
		
		if (password1 == "" && password2 == "") {
			pw = "${ loginVO.password }";
		} else {
			pw = $('#pwModify').val();
		}
	
	var data = {
			"memberid" : $('#memberid').val(),
			"name" : $('#name').val(),
			"password" : pw,
			"email" : $('#email').val()
		};
	
	$.ajax({
		type : 'PUT',
		url : '/mypage/modify',
		data : JSON.stringify(data),
        contentType : "application/json",
		success : function(result) {
			console.log(data);
			$('#modifyMyInfo').modal("hide");
			location.reload();
		},
		error : function(request, status, error) {
			console.log(data);
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
	}
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