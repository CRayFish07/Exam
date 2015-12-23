<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<script type="text/javascript">
	var totalTime = 5 * 60;
	var useTime = 0, remainTime = totalTime;
	function checkTime() {
		useTime += 1;
		remainTime -= 1;

		if (remainTime == 0) {
			$("#myForm").submit();
		}

		var hourU = Math.floor(useTime / 3600);
		var minuteU = Math.floor((useTime - hourU * 3600) / 60);
		var secondU = Math.floor(useTime - hourU * 3600 - minuteU * 60);
		document.getElementById("useTime").innerHTML = format(hourU) + ":"
				+ format(minuteU) + ":" + format(secondU);

		var hourR = Math.floor(remainTime / 3600);
		var minuteR = Math.floor((remainTime - hourR * 3600) / 60);
		var secondR = Math.floor(remainTime - hourR * 3600 - minuteR * 60);
		document.getElementById("remainTime").innerHTML = format(hourR) + ":"
				+ format(minuteR) + ":" + format(secondR);
	}

	function format(time) {
		if (time < 10) {
			return "0" + time;
		} else {
			return time;
		}
	}

	window.setInterval("checkTime()", 1000);
</script>
<div class="data_list">
	<div class=" row time">
		<div class="col-md-4">
			考试时间: <font id="totalTime">20分钟</font>
		</div>
		<div class="col-md-4 ">
			计时：<font id="useTime" ></font>
		</div>
		<div class="col-md-4">
			剩余时间：<font id="remainTime" ></font>
		</div>
	</div>
	<div class="title">${paper.paperName }</div>
	<div class="ftitle">
		<font>(总分120分&nbsp;单选60分&nbsp;多选60分)</font>
	</div>
	<div class="data_exam_content">
	<form action="exam!test" method="post" id="myForm">
		<input type="hidden" name="exam.student.id" value="${currentStudent.id} ">
		<input type="hidden" name="exam.paper.id" value="${paper.id} ">
		<strong><big>一，单选题</big></strong>(每题20分，答错不得分)<br /> <br />
		<c:forEach var="s" items="${squestions }" varStatus="status">
			<strong>[&nbsp;${status.index+1 }&nbsp;]&nbsp;${s.subject} </strong>
			<div class="radio option">
				<label class="radio"> <input type="radio"
					name="id-r-${s.id }" value="A" /> ${s.optionA }
				</label> <label class="radio"> <input type="radio"
					name="id-r-${s.id }" value="B" /> ${s.optionB }
				</label> <label class="radio"> <input type="radio"
					name="id-r-${s.id }" value="C" /> ${s.optionC }
				</label> <label class="radio"> <input type="radio"
					name="id-r-${s.id }" value="D" /> ${s.optionD }
				</label>
			</div>
			<br />
		</c:forEach>
		<br /> <strong><big>二，多选题</big></strong>(每题30分，答错不得分)<br /> <br />
		<c:forEach var="m" items="${mquestions }" varStatus="status">
			<strong>[&nbsp;${status.index+1 }&nbsp;]&nbsp;${m.subject} </strong>
			<div class="checkbox option">
				<label class="checkbox"> <input type="checkbox"
					name="id-c-${m.id }" value="A" /> ${m.optionA }
				</label> <label class="checkbox"> <input type="checkbox"
					name="id-c-${m.id }" value="B" /> ${m.optionB }
				</label> <label class="checkbox"> <input type="checkbox"
					name="id-c-${m.id }" value="C" /> ${m.optionC }
				</label><label class="checkbox"> <input type="checkbox"
					name="id-c-${m.id }" value="D" /> ${m.optionD }
				</label>
			</div>
			<br />
		</c:forEach>
		<br />
	<div>
		<button  type="submit" class="btn btn-primary">确定</button>
	</div>
	</form
	</div>
</div>