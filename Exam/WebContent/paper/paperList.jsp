<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function checkDelete(id) {
		if (confirm("确定要删除吗？")) {
			$.post("paper!delete",{paperId : id},
							function(result) {
								var result = eval("(" + result + ")");
								if (result.error) {
									alert(result.error);
								} else {
									alert("删除成功！");
									window.location.href = "${pageContext.request.contextPath}/paper!paperList";

								}
							});
		}
	}
</script>
<div class="examList">
	<div class="title" align="center">考试试卷</div>
	<div class="add">
		<button type="submit" class="btn btn-success btn-sm"
			onclick="javascript:window.location='paper!preSave'">添加试卷</button>
	</div>
	<table class="table table-bordered table-hover ">
		<tr>
			<td>编号</td>
			<td>试卷名称</td>
			<td>添加日期</td>
			<td>操作</td>
		</tr>

		<c:forEach var="paper" items="${papers }" varStatus="status">
			<tr>
				<td>${status.index+1 }</td>
				<td>${paper.paperName }</td>
				<td><fmt:formatDate value="${paper.joinDate }" type="date"
						pattern="yyyy-MM-dd HH:mm" /></td>
				<td>
					<button type="button" class="btn btn-info"
						onclick="javascript:window.location='paper!preSave?paperId=${paper.id}'">修改</button>
					<button type="button" class="btn btn-danger"
						onclick="checkDelete('${paper.id}')">删除</button>
				</td>
			</tr>
		</c:forEach>
	</table>

</div>