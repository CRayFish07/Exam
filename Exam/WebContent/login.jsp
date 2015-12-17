<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/supersized.css">
<link rel="stylesheet" href="assets/css/style.css">
<script src="assets/js/jquery-1.8.2.min.js"></script>
<script src="assets/js/supersized.3.2.7.min.js"></script>
<script src="assets/js/supersized-init.js"></script>
<script src="assets/js/scripts.js"></script>
<script type="text/javascript">
	function reset(){
	$("#student.id").val("");
	$("#student.password").val("");
	}
	
</script>
</head>
<body>

	<div class="page-container">
		<h1>考试系统登录</h1>
		<form action="student!login" method="post">
			<input type="text" name="student.id"  class="username"
				placeholder="请输入您的考号！"> 
			<input type="password"
				name="student.password" class="password" placeholder="请输入您的密码！">
			<!-- <input type="Captcha" class="Captcha" name="Captcha"
				placeholder="请输入验证码！"> -->
			<button type="submit" class="submit_button">登录</button>
			&nbsp;&nbsp;
			<button class="reset_button" onclick="reset()">重置</button>
		</form>
	</div>
	<div style="margin-top: 80px"><font color="red">${error }</font></div>
</body>
</html>