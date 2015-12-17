<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery.js"></script>
<%
	String mainPage = (String)request.getAttribute("mainPage");
	if(mainPage==null||mainPage==""){
		mainPage="/common/default.jsp";
	}
%>
</head>
<body id="bg">

<div >
	<jsp:include page="/common/left.jsp"></jsp:include>
	<jsp:include page="<%= mainPage%>"></jsp:include>
	<jsp:include page="/common/foot.jsp"></jsp:include>
</div>	


</body>
</html>