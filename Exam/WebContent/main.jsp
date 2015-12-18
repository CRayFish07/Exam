<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap3/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<script
	src="${pageContext.request.contextPath}/bootstrap3/js/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap3/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery.js"></script>
<%
	String mainPage = (String) request.getAttribute("mainPage");
	if (mainPage == null || mainPage == "") {
		mainPage = "/common/default.jsp";
	}
%>
</head>
<body id="bg">
	<div class="container-fluid">
		<div class="col-md-2">
			<div class="dh">
				<jsp:include page="/common/left.jsp"></jsp:include>
			</div>

		</div>
		<div class="col-md-10">
			<div>
			<jsp:include page="<%=mainPage%>"></jsp:include>
			</div>
		<div>
				<jsp:include page="/common/foot.jsp"></jsp:include>
		</div>
		</div>
	</div>

</body>
</html>