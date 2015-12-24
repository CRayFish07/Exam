<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="examList">
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div class="title" align="center">考生信息</div>
	<form action="student!list" method="post" class="form-inline">
		<div align="center" class="search">
			<div class="form-group">
				<label >考号:</label> <input type="text"
					class="form-control" id="s_student.id" name="s_student.id" value="${s_student.id} ">
			</div>
			&nbsp;
			<div class="form-group">
				<label >姓名:</label> <input type="text"
					class="form-control" id="s_student.name" name="s_student.name" value="${s_student.name }">
			</div>
			<button type="submit" class="btn btn-primary">查询</button>
		</div>
	</form>
	<div class="add">
		<button type="submit" class="btn btn-success btn-sm" onclick="javascript:window.location='student!preSave'">添加考生</button>
	</div>
	<table class="table table-bordered table-hover ">
		<tr>
			<td>编号</td>
			<td>考号</td>
			<td>姓名</td>
			<td>身份证</td>
			<td>性别</td>
			<td>专业</td>
			<td>操作</td>
		</tr>

		<c:forEach var="student" items="${students }" varStatus="status">
			<tr>
				<td>${status.index+1 }</td>
				<td>${student.id }</td>
				<td>${student.name }</td>
				<td>${student.cardNo }</td>
				<td>${student.sex }</td>
				<td>${student.prefession }</td>
				<td>
					<button type="button" class="btn btn-info">修改</button>
					<button type="button" class="btn btn-danger">删除</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div align="center">
		<nav>
			<ul class="pagination">${pageCode}
			</ul>
		</nav>
	</div>

</div>