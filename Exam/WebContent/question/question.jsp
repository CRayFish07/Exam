<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="questionMsg">
	<div class=title>题目信息</div>
	<div align="center">
		<table class="table" >
			<tr>
				<div class="form-group">
					<td><label>考试题目:</label></td>
					<td><input type="text" class="form-control "
						value="${question.subject}" readonly="readonly" disabled/></td>
				</div>

			</tr>
			<tr>
				<div class="form-group">
					<td><label>题目类型:</label></td>
					<td><c:choose>
							<c:when test="${question.type==1} }">
								<input type="text" class="form-control" value="单选题"
									readonly="readonly" disabled/>
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" value="多选题"
									readonly="readonly" disabled/>
							</c:otherwise>
						</c:choose></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>所属试卷:</label></td>
					<td><input type="text" class="form-control"
						value="${question.paper.paperName}" readonly="readonly" disabled/></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>加入时间:</label></td>
					<td><input type="text" class="form-control"
						value="<fmt:formatDate value='${question.joinTime }' type='date' pattern='yyyy-MM-dd'/>"
						readonly="readonly" disabled/></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>选项一:</label></td>
					<td><input type="text" class="form-control"
						value="${question.optionA}" readonly="readonly" disabled/></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>选项二:</label></td>
					<td><input type="text" class="form-control"
						value="${question.optionB}" readonly="readonly" disabled/></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>选项三:</label></td>
					<td><input type="text" class="form-control"
						value="${question.optionC}" readonly="readonly" disabled/></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>选项四:</label></td>
					<td><input type="text" class="form-control"
						value="${question.optionD}" readonly="readonly" disabled/></td>
				</div>

			</tr>
			<tr>

				<div class="form-group">
					<td><label>答案:</label></td>
					<td><input type="text" class="form-control"
						value="${question.answer}" readonly="readonly" disabled/></td>
				</div>

			</tr>
			<tr>
				<td>
					<button type="button" class="btn btn-primary"
						onclick="javascript:history.back()">返回</button>
				</td>
				<td></td>
			</tr>
		</table>
	</div>
</div>