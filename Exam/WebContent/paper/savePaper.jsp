<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkForm() {
		var name = $("#name").val();

		if (name == "" || name == null) {
			alert("姓名不能为空!");
			return false;
		}

	}
</script>
<div class="savePaper">
	<div class="title">${title }</div>
	<div align="center">
		<form action="paper!save" method="post" onsubmit="return checkForm()"
			class="form-inline">
			<table class="table ">
				<tr>

					<div class="form-group">
						<td><label for="name" >试卷名称:</label></td>
						<td><input type="text" class="form-control" id="name"
							name="paper.paperName" value="${ paper.paperName}"></td>
					</div>

				</tr>
				<tr>
					<td><input type="hidden" value="${paper.id }" name="paper.id">
						<input type="hidden" value="${paper.joinDate }"
						name="paper.joinDate">
						<button type="submit" class="btn btn-primary">提交</button></td>
					<td><button type="button" class="btn btn-primary"
							onclick="javascript:history.back()">返回</button></td>
				</tr>
			</table>
		</form>
	</div>
</div>