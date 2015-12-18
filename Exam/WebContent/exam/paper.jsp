<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="data_list">
	<div class="data_exam_content">
		<strong><big>一，单选题</big></strong>(每题20分，答错不得分)<br/><br/>
		<c:forEach var="s" items="${squestions }" varStatus="status">
			<strong>[&nbsp;${status.index+1 }]&nbsp;${s.subject} </strong>
			<div class="radio">
			<label class="radio">
				<input type="radio" name="id-r-${s.id }" value="A"/>
				${s.optionA }
			</label>
			<label class="radio">
				<input type="radio" name="id-r-${s.id }" value="B"/>
				${s.optionB }
			</label>
			<label class="radio">
				<input type="radio" name="id-r-${s.id }" value="C"/>
				${s.optionC }
			</label>
			<label class="radio">
				<input type="radio" name="id-r-${s.id }" value="D"/>
				${s.optionD }
			</label>
			</div>
			<br/>
		</c:forEach>
		<br/>
		<strong><big>二，多选题</big></strong>(每题30分，答错不得分)<br/><br/>
		<c:forEach var="m" items="${mquestions }" varStatus="status">
			<strong>[&nbsp;${status.index+1 }]&nbsp;${m.subject} </strong>
			<div class="checkbox">
			<label class="checkbox">
				<input type="checkbox" name="id-r-${m.id }" value="A"/>
				${m.optionA }
			</label>
			<label class="checkbox">
				<input type="checkbox" name="id-r-${m.id }" value="B"/>
				${m.optionB }
			</label>
			<label class="checkbox">
				<input type="checkbox" name="id-r-${m.id }" value="C"/>
				${m.optionC }
			</label>
			<label class="checkbox">
				<input type="checkbox" name="id-r-${m.id }" value="D"/>
				${m.optionD }
			</label>
			</div>
			<br/>
		</c:forEach>
		<br/>
	</div>
</div>