<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkForm() {
		var oldPassword = $("#oldPassword").val();
		var newPassword = $("#newPassword").val();
		var newPassword2 = $("#newPassword2").val();

		if (oldPassword == "" || oldPassword == null) {
			alert("原密码不能为空!");
			return false;
		}

		if (oldPassword != '${currentUser.password}') {
			alert("原密码错误！");
			return false;
		}
		if (newPassword == "" || newPassword == null) {
			alert("新密码不能为空!");
			return false;
		}
		if (newPassword2 == "" || newPassword2 == null) {
			alert("确认密码不能为空!");
			return false;
		}
		if (newPassword != newPassword2) {
			alert("新密码两次输入不同！");
			return false;
		}

	}
</script>
<div class="updatePassword">
	<div class="title">修改密码</div>
	<div  align="center">
		<form action="student!update" method="post" onsubmit="return checkForm()" class="form-horizontal"> 
			<table class="table ">
				<tr>
					<td>用户名：</td>
					<td><input name="student.id" value="${currentUser.id} "
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>原密码：</td>
					<td><input id="oldPassword" /></td>
				</tr>
				<tr>
					<td>新密码：</td>
					<td><input id="newPassword" name="student.password"/></td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td><input id="newPassword2" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button type="submit" class="btn btn-primary">提交</button></td>
				</tr>
			</table>
		</form>
	</div>
</div>