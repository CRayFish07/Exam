<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function checkForm(){
		var subject = $("#subject").val();
		var type = $("#type").val();
		var paper = $("#paper").val();
		var time = $("#time").val();
		var optionA = $("#optionA").val();
		var optionB = $("#optionB").val();
		var optionC = $("#optionC").val();
		var optionD = $("#optionD").val();
		var answer = $("#answer").val();
		
		if(subject==null||subject==""){
			alert("考试题目不能为空！");
			return false;
		}
		if(type==null||type==""){
			alert("题目类型不能为空！");
			return false;
		}
		if(paper==null||paper==""){
			alert("试卷不能为空！");
			return false;
		}
		if(time==null||time==""){
			alert("日期不能为空！");
			return false;
		}
		if(optionA==null||optionA==""){
			alert("选项一不能为空！");
			return false;
		}
		if(optionB==null||optionB==""){
			alert("选项二不能为空！");
			return false;
		}
		if(optionC==null||optionC==""){
			alert("选项三不能为空！");
			return false;
		}
		if(optionD==null||optionD==""){
			alert("选项四不能为空！");
			return false;
		}
		if(answer==null||answer==""){
			alert("选项五不能为空！");
			return false;
		}
	}
</script>
<div class="questionMsg">
	<div class=title>题目信息</div>
	<div align="center">
		<form action="question!save" onsubmit="return checkForm()">
		<table class="table">
			<tr>
				<div class="form-group">
					<td><label>考试题目:</label></td>
					<td><input type="text" class="form-control "
						name="question.subject" id="subject" value="${question.subject}" /></td>
				</div>
			</tr>
			<tr>
				<div class="form-group">
					<td><label>题目类型:</label></td>
					<td><select class="form-control" name="question.type" id="type">
							<option value="">请选择类型</option>
							<option value="1" ${question.type==1?'selected':'' }>单选题</option>
							<option value="2" ${question.type==2?'selected':'' }>多选题</option>
					</select></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>所属试卷:</label></td>
					<td>
					<select class="form-control" name="question.paper.id" id="paper">
							<option value="">请选择试卷</option>
					<c:forEach items="${papers }" var="paper">
						<option value="${paper.id }" ${question.paper.id==paper.id?'selected':'' }>${paper.paperName }</option>
					</c:forEach>
					</td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>加入时间:</label></td>
					<td><input type="text" class="Wdate form-control " style="height: 35px;" onclick="WdatePicker()" id="time" name="question.joinTime"
						value="<fmt:formatDate value='${question.joinTime }' type='date' pattern='yyyy-MM-dd'/>" /></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>选项一:</label></td>
					<td><input type="text" class="form-control"
						value="${question.optionA}" name="question.optionA" id="optionA" /></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>选项二:</label></td>
					<td><input type="text" class="form-control"
						value="${question.optionB}" name="question.optionB" id="optionB" /></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>选项三:</label></td>
					<td><input type="text" class="form-control"
						value="${question.optionC}" name="question.optionC" id="optionC" /></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>选项四:</label></td>
					<td><input type="text" class="form-control"
						value="${question.optionD}" name="question.optionD" id="optionD" /></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>答案:</label></td>
					<td><input type="text" class="form-control"
						value="${question.answer}" name="question.answer" id="answer" />&nbsp;&nbsp;<font>(多选题答案用‘,’隔开，例：A,D)</font></td>
				</div>

			</tr>
			<tr>
				<td>
					<input type="hidden" name="id" value="${question.id }"/>
					<button type="submit" class="btn btn-primary">提交</button>
				</td>
				<td><button type="button" class="btn btn-primary"
						onclick="javascript:history.back()">返回</button></td>
			</tr>
		</table>
			</form>
	</div>
</div>