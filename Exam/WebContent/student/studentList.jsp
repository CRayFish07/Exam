<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="examList">
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div class="title" align="center">考生信息</div>
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
</div>