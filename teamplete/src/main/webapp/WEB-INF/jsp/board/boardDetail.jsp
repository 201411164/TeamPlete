<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
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


<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>


  table {
    border: 1px solid black;
  }
  
    th, td {
    border: 1px solid black;
  }
  
#fileName:hover {
   text-decoration: underline;
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

   <header> <jsp:include page="/WEB-INF/jsp/include/navbar.jsp" />
   </header>
   <div class="app-content content">
	 <div class="content-wrapper" id="contentWrapper">


	<div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0 ">${ boardDetail.title }</h2>                            
                        </div>
                </div>
            </div>


			<div class="col-xl-3 col-md-6 col-sm-6">
				<div class="card">
					<div class="card-content">						
						<div class="card-body">
						<div class="card-header">
							<h4 class="card-title">작성자 : <strong>${ boardDetail.writerName }</strong></h4>
						</div>
						<ul class="list-group list-group-flush">
						<li class="list-group-item">
                                           <h4 class="primary"
														>${ fn:replace(boardDetail.content, newLineChar, "<br/>") }</h4>
                                        </li>
                                        
                        <c:forEach var="file" items="${ fileList }">
                        <li class="list-group-item">
										<h6 class="text-nowrap"
											style="white-space: nowrap; display: inline;" id="fileName"
											onClick="fileDown('filePath=${ file.filePath }&fileNameKey=${ file.fileNameKey }&fileName=${ file.fileName }')">${ file.fileName }</h6>
										<c:choose>
											<c:when test="${ file.fileSize >= 1024 }">
												<h6 id="strong" style="display: inline;">
													(
													<fmt:formatNumber value="${ file.fileSize / 1024 }"
														pattern=".00" />
													MB)
												</h6>
											</c:when>
											<c:otherwise>
												<h6 id="strong" style="display: inline;">(${ file.fileSize }KB)</h6>
											</c:otherwise>
										</c:choose>
										</br>
										 </li>
									</c:forEach>                
                                        
						</ul>
						</div>
					</div>
					<div>


						



					<footer> </footer>
				</div>
			</div>
			
	</c:otherwise>
	</c:choose>



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
function fileDown(file){
    location.href = "${ pageContext.request.contextPath}/fileDownload?" + file;
}
</script>
</body>
</html>