<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="examList" >
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div  class="title" align="center">${currentStudent.name}的成绩 </div>
	<table class="table table-bordered table-hover ">
		<tr>
			<td>编号</td>
			<td>考试日期</td>
			<td>试卷名称</td>
			<td>总分</td>
			<td>单选分数</td>
			<td>多选分数</td>
		</tr>

		<c:forEach var="exam" items="${exams }" varStatus="status">
			<tr>
				<td>${status.index+1 }</td>
				<td><fmt:formatDate value="${exam.examDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${exam.paper.paperName }</td>
				<td>${exam.score }</td>
				<td>${exam.singleScore }</td>
				<td>${exam.moreScore }</td>
			</tr>
		</c:forEach>
	</table>
</div>