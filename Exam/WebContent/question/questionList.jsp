<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function checkDelete(id) {
		if (confirm("确定要删除吗？")) {
			$.post(
							"question!delete",
							{
								id : id
							},
							function(result) {
								var result = eval("(" + result + ")");
								if (result) {
									alert("删除成功！");
									window.location.href = "${pageContext.request.contextPath}/question!list";
								} else {
									alert("删除失败！");
								}
							});
		}
	}
</script>
<div class="examList">
	<div class="title" align="center">考生信息</div>
	<form action="question!list" method="post" class="form-inline">
		<div align="center" class="search">
			<div class="form-group">
				<label>姓名:</label> <input type="text" class="form-control"
					id="s_Question.subject" name="s_Question.subject"
					value="${s_Question.subject }">
			</div>
			<button type="submit" class="btn btn-primary">查询</button>
		</div>
	</form>
	<div class="add">
		<button type="submit" class="btn btn-success btn-sm"
			onclick="javascript:window.location='question!preSave'">添加考生</button>
	</div>
	<table class="table table-bordered table-hover ">
		<tr>
			<td>编号</td>
			<td>题目</td>
			<td>加入时间</td>
			<td>类型</td>
			<td>所属试卷</td>
			<td>操作</td>
		</tr>

		<c:forEach var="question" items="${questions }" varStatus="status">
			<tr>
				<td>${status.index+1 }</td>
				<td>${question.subject }</td>
				<td><fmt:formatDate value="${question.joinTime }" type="date" pattern="yyyy-MM-dd"/></td>
				<td><c:choose>
						<c:when test="${question.type==1 }">单选题</c:when>
						<c:otherwise>多选题</c:otherwise>
					</c:choose></td>
				<td>${question.paper.paperName }</td>
				<td>
				<button type="button" class="btn btn-info"
						onclick="javascript:window.location='question!getQuestionMsg?id=${question.id}'">查看详情</button>
					<button type="button" class="btn btn-info"
						onclick="javascript:window.location='student!preSave?id=${student.id}'">修改</button>
					<button type="button" class="btn btn-danger"
						onclick="checkDelete('${question.id}')">删除</button>
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