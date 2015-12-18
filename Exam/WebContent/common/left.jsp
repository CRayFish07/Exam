<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" >

	var s = $("#s");
	for(var i=1;i<=5;i++){
		if(i==s){
			document.getElementById("s"+i).className="active";
		}else{
			document.getElementById("s"+i).className="";
		}
	}
	

</script>
<ul class="nav nav-pills nav-stacked">
<li role="presentation"><img alt="" src="images/logo.png">
			<input id="s" name="s" type="hidden" value="${requestScope.s} "/>

</li>

<li id="l1" role="presentation" class="active" onclick="change(1)"><a class="glyphicon glyphicon-home" href="main.jsp?mainPage=''&&s=1">&nbsp;首&nbsp;&nbsp;页</a></li>
<li  id="l2" role="presentation" onclick="change(2)"><a class="glyphicon glyphicon-pencil" href="paper!list?s=2">&nbsp;在线考试</a></li>
<li  id="l3" role="presentation" onclick="change(3)"><a class="glyphicon glyphicon-search">&nbsp;成绩查询</a></li>
<li  id="l4" role="presentation" onclick="change(4)"><a class="glyphicon glyphicon-cog">&nbsp;密码修改</a></li>
<li  id="l5" role="presentation" onclick="change(5)"><a class="glyphicon glyphicon-off">&nbsp;退出系统</a></li>
</ul>


	
