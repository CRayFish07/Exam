<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="data_list">
	<div class="data_content">
		<form action="paper!list" method="post">
			<table width="40%" align="center" >
				<tr>
					<td height="200px"></td>
				</tr>
				<tr>
					<td align="center"><label><strong>选择考试试卷：</strong></label></td>
					<td><select class="form-control" style="width: 150px;">
							<option>请选择试卷...</option>
							<c:forEach var="paper" items="${papers }">
								<option value="${paper.id }">${paper.paperName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td align="center">
						<button type="button" class="btn btn-primary">确定</button>
					</td>
					<td>
						<button type="button" class="btn btn-primary">返回</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>