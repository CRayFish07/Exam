<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="examList">
	<div class="title" align="center">考生成绩</div>
	<form action="exam!getList" method="post" class="form-inline">
		<div align="center" class="search">
			<div class="form-group">
				<label >考号:</label> <input type="text"
					class="form-control"  name="s_exam.student.id" value="${s_exam.student.id} ">
			</div>
			&nbsp;
			<div class="form-group">
				<label >姓名:</label> <input type="text"
					class="form-control"  name="s_exam.student.name" value="${s_exam.student.name }">
			</div>
			<button type="submit" class="btn btn-primary">查询</button>
		</div>
	</form>
	<table class="table table-bordered table-hover ">
		<tr>
			<td>编号</td>
			<td>学号</td>
			<td>考试日期</td>
			<td>试卷名称</td>
			<td>总分</td>
			<td>单选分数</td>
			<td>多选分数</td>
		</tr>

		<c:forEach var="exam" items="${exams }" varStatus="status">
			<tr>
				<td>${status.index+1 }</td>
				<td>${exam.student.id }</td>
				<td><fmt:formatDate value="${exam.examDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${exam.paper.paperName }</td>
				<td>${exam.score }</td>
				<td>${exam.singleScore }</td>
				<td>${exam.moreScore }</td>
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