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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/components.css">
<link
	href="https://fonts.googleapis.com/cssf?family=Montserrat:300,400,500,600"
	rel="stylesheet">
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
<!-- END: Page CSS-->
<style>
p {
	color: black;
}

label {
	color: black;
}

#members {
	background-color: blue;
	font-weight: bold;
}

.sec {
	margin-left: 25%;
	padding-top: 10%;
}
</style>

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
// $(document).ready(function() {
//     $('#checkbtn').on('click', function() {
//        $.ajax({
//           type : 'POST',
//           url : '/checkSignUp',
//           data : {
//              "idCheck" : $('#memberid').val() 
//           },
//           success : function(data) {
//              if ($.trim(data) == 0) {
//                 $('#checkMsg').html('<p style="color:blue">사용가능</p>');
//              } else {
//                 $('#checkMsg').html('<p style="color:red">사용불가능</p>');
//              }
//           }
//        });
//     });
//  });

</script>

</head>
<body>

	<header> <jsp:include page="/WEB-INF/jsp/include/navbar.jsp" />
	</header>

	<section class="sec" id="sec">
	<h2>${ team.teamName }상세페이지입니다.</h2>

	<div id="membersView">
		<c:forEach items="${ members }" var="member">
			<span id="members">${ member.memberid }</span>
		</c:forEach>
	</div>

<!-- 	<section id="form-and-scrolling-components"> -->
	<div class="row match-height">
		<div class="col-md-4 col-sm-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Form Components</h4>
				</div>
				<div class="card-content">
					<div class="card-body">
						<div class="form-group">
							<h5>Add Team Member Form</h5>
							<p>Add Team Member</p>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-success"
								data-toggle="modal" data-target="#inlineForm">add member</button>

							<!-- Modal -->
							<div class="modal fade text-left" id="inlineForm" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel33"
								aria-hidden="true">
								<div
									class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
									role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="myModalLabel33">Inline Add
												Member Form</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post"
											action="${pageContext.request.contextPath}/teamdetail/${ team.teamId }"
											name="createTeamForm">
											<input type="hidden" name="teamId" id="teamId" value="${ team.teamId }">
											<div class="modal-body">
												<label>Member ID: </label>
												<div class="form-group">
													<input type="text" name="memberId" id="memberId"
														placeholder="Member ID" class="form-control">
												</div>
												<div class="modal-footer">
													<button type="button" onClick="submitMember()"
														class="btn btn-primary" data-dismiss="modal">Create</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 태스크 조회, 태스크 추가 -->
	<table id="taskTable" style="color: black;">
		<thead>
			<tr>
				<th>writer</th>
				<th>content</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<c:forEach var="task" items="${ taskList }">
				<tr id="tr${ task.taskId }">
					<td>${ task.writerName }</td>
					<td>${ task.content }</td>
					<td>
						<div>
<%-- 							<button name="modifyTask" value="${ task.taskId }">수정</button> --%>
							<button name="deleteTask" value="${ task.taskId }">삭제</button>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 태스크 등록 Modal -->
	<button id="createTaskBtn" class="btn btn-outline-success"
		data-toggle="modal" data-target="#createTask">태스크 등록</button>

	<div class="modal fade text-left" id="createTask" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel33">태스크를 추가해주세요.</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="post"
					action="${pageContext.request.contextPath}/teamdetail/${ team.teamId }/task"
					name="createTaskForm">
					<input type="hidden" name="writerId" id="writerId" value="${ loginVO.memberid }">
					<input type="hidden" name="writerName" id="writerName" value="${ loginVO.name }">
					<input type="hidden" name="teamId" id="teamId" value="${ team.teamId }">
					<div class="modal-body">
						<label>Content: </label>
						<div class="form-group">
							<textarea class="form-control" name="content" id="content" rows="5"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" id="taskSubmit" class="btn btn-primary" onClick="submitTask()"
								data-dismiss="modal">Create</button>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	</section>

	<footer>
	</footer>



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
   function submitMember(){
	    var form = document.createTeamForm;
	    var result = confirm(document.getElementById('memberId').value + "님을 팀에 추가하시겠습니까?");
	    
	    if(result) {
// 	    	form.submit();
	        var data = {teamId : $('#teamId').val(),
	    		   	   memberId : $('#memberId').val()
	    		   	   };
	       $.ajax({
	          type : 'POST',
	          url : '/teamdetail/${ team.teamId }',
	          data : JSON.stringify(data),
	          contentType : "application/json",
	          success : function(data) {
	        	  console.log(data);

// 	         	  $('#membersView').load(document.URL +  ' #membersView');
	        	  location.reload();
	          },
	          error : function(error) {
	        	  console.log(error);
	          }
	       });
	    }else {
	    	return;
	    }
	    
	}
   
   function submitTask(){

// 	    var createTaskForm = document.createTaskForm;
	    
// 	    createTaskForm.submit();

       var data = {writerId : $('#writerId').val(),
    		   	   writerName : $('#writerName').val(),
    		   	   teamId : $('#teamId').val(),
    		   	   content : $('#content').val()
    		   	   };
       $.ajax({
          type : 'POST',
          url : '/teamdetail/${ team.teamId }/task',
          data : JSON.stringify(data),
          contentType : "application/json",
          success : function(data) {
        	  console.log(data);

//         	  $('#taskTable').load(document.URL +  ' #taskTable');
        	  location.reload();
          },
          error : function(error) {
        	  console.log(error);
          }
       });
   }
   
   	var taskId = '';
	$(document).ready(function() {
		
		$("button[name='deleteTask']").click(function() {
			
			taskId = this.value;
			console.log(taskId);
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					url : '/task/delete/' + taskId,
					type : 'DELETE'
				});
// 				$('#taskTable').load(document.URL +  ' #taskTable');
				location.reload();
			} else return;

		});
		
	});


   
   
</script>
</body>
</html>