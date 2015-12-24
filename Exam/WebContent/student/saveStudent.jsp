<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkForm() {
		var name = $("#name").val();
		var sex = $("#sex").val();
		var cardNo = $("#cardNo").val();
		var password = $("#password").val();
		var prefession = $("#prefession").val();

		if (name == "" || name == null) {
			alert("姓名不能为空!");
			return false;
		}

		if (sex == "" || sex == null) {
			alert("性别不能为空!");
			return false;
		}
		if (cardNo == "" || cardNo == null) {
			alert("身份证不能为空!");
			return false;
		}
		if (password == "" || password == null) {
			alert("密码不能为空!");
			return false;
		}
		if (prefession == "" || prefession == null) {
			alert("专业不能为空!");
			return false;
		}

	}
</script>
<div class="saveStudent">
	<div class="title">${title }</div>
	<div align="center">
		<form action="student!save" method="post"
			onsubmit="return checkForm()" class="form-inline">
			<table class="table ">
				<tr>
					<td>
						<div class="form-group">
							<label for="name">姓名:</label> <input type="text"
								class="form-control" id="name" name="student.name" value="${ student.name}">
						</div>
					</td>
					<td>
						<div class="form-group">
							<label for="sex">性别:</label> <select class="form-control"
								id="sex" name="student.sex">
								<option value="">请选择性别：</option>
								<option value="男" ${student.sex=='男'?'selected':'' }>男</option>
								<option value="女" ${student.sex=='女'?'selected':'' }>女</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="cardNo">身份证:</label> <input type="text"
								class="form-control" id="cardNo" name="student.cardNo" value="${student.cardNo }">
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label for="password">密码:</label> <input type="text"
								class="form-control" id="password" name="student.password" value="${student.password }">
						</div>
					</td>
					<td>
					<div class="form-group">
							<label for="prefession">专业:</label> <input type="text"
								class="form-control" id="prefession" name="student.prefession" value="${student.prefession}">
						</div>
					</td>
				</tr>
				<tr>
					<td>
					<input type="hidden" value="${student.id }" name="student.id">
						<button type="submit" class="btn btn-primary">提交</button>
					</td>
					<td>
						<button type="button" class="btn btn-primary"
							onclick="javascript:history.back()">返回</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>