<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

	function checkForm(){
		var paperId = $("#paper").val();
		if(paper==null||paper==""){
			alter("请选择试卷");
			return false;
		}
		return true;
	}

</script>
<div class="data_list">
	<div class="data_content">
		<form action="paper!getPaperPage" method="post" onsubmit="return checkForm()">
			<table width="40%" align="center" >
				<tr>
					<td height="120px"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><label><strong>选择考试试卷：</strong></label></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><select class="form-control" style="width: 150px;" name="paperId" id="paperId">
							<option value="">请选择试卷...</option>
							<c:forEach var="paper" items="${papers }">
								<option value="${paper.id }">${paper.paperName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td align="center">
						<button type="submit" class="btn btn-primary">确定</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary">返回</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>