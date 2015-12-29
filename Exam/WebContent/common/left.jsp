<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function checkClick(str) {
		var sl;

		document.getElementById("l5").className = "active";
		for (var i = 1; i <= 4; i++) {
			var className = document.getElementById("l" + i).className;
			if (className == "active") {
				document.getElementById("l" + i).className = "";
				sl = i;
			}
		}
		if (confirm("确定要退出系统吗？")) {
			if(str=="str"){
			window.location.href = "student!layout";
			}else{
			window.location.href = "manager!layout";
			}
		} else {
			document.getElementById("l5").className = "";
			document.getElementById("l" + sl).className = "active";
		}

	}
</script>
<c:choose>
<c:when test="${currentUser.flag==2}">
	<ul class="nav nav-pills nav-stacked">
		<li role="presentation"><img alt="" src="images/logo.png">
			<input id="sh" type="hidden" value="${s} " /></li>
		<li id="l1" role="presentation" class="active""><a
			class="glyphicon glyphicon-home" href="/main.jsp?mainPage=''">&nbsp;首&nbsp;&nbsp;页</a></li>
		<li id="l2" role="presentation"><a
			class="glyphicon glyphicon-pencil" href="paper!list">&nbsp;在线考试</a></li>
		<li id="l3" role="presentation"><a
			class="glyphicon glyphicon-search" href="exam!list">&nbsp;成绩查询</a></li>
		<li id="l4" role="presentation"><a
			class="glyphicon glyphicon-cog" href="student!preUpdate">&nbsp;密码修改</a></li>
		<li id="l5" name="l5" role="presentation"><a
			class="glyphicon glyphicon-off" onclick="checkClick('str')">&nbsp;退出系统</a></li>
	</ul>
</c:when>
<c:otherwise>
	<ul class="nav nav-pills nav-stacked">
		<li role="presentation"><img alt="" src="images/logo.png">
			<input id="sh" type="hidden" value="${s} " /></li>
		<li id="l1" role="presentation" class="active""><a
			class="glyphicon glyphicon-home" href="main.jsp?mainPage=''">&nbsp;首&nbsp;&nbsp;页</a></li>
		<li id="l2" role="presentation"><a
			class="glyphicon glyphicon-pencil" href="student!list">&nbsp;考生信息管理</a></li>
		<li id="l3" role="presentation"><a
			class="glyphicon glyphicon-search" href="exam!getList">&nbsp;考生成绩查询</a></li>
		<li id="l4" role="presentation"><a
			class="glyphicon glyphicon-cog" href="paper!paperList">&nbsp;试卷管理</a></li>
		<li id="l6" role="presentation"><a
			class="glyphicon glyphicon-cog" href="question!list">&nbsp;题目管理</a></li>
		<li id="l5" name="l5" role="presentation"><a
			class="glyphicon glyphicon-off" onclick="checkClick('tr')">&nbsp;退出系统</a></li>
	</ul>
</c:otherwise>
</c:choose>


<script type="text/javascript">
	var s = $("#sh").val();
	if (s == null || s == " ") {
		document.getElementById("l1").className = "active"
	} else {
		for (var i = 1; i <= 6; i++) {
			if (i == s) {
				document.getElementById("l" + i).className = "active";
			} else {
				document.getElementById("l" + i).className = "";
			}
		}
	}
</script>


