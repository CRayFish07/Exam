package com.jae.action;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.jae.dao.ExamDao;
import com.jae.dao.QuestionDao;
import com.jae.model.Exam;
import com.jae.model.PageBean;
import com.jae.model.Student;
import com.jae.util.PageUtil;
import com.jae.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class ExamAction extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;
	private String mainPage;
	private String pageCode;
	private String page;
	private String s="2";
	
	private QuestionDao questionDao = new QuestionDao();
	
	
	private ExamDao examDao =new ExamDao();
	private Exam s_exam;
	private Exam exam ;
	private List<Exam> exams;
	
	
	
	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public Exam getS_exam() {
		return s_exam;
	}

	public void setS_exam(Exam s_exam) {
		this.s_exam = s_exam;
	}

	public List<Exam> getExams() {
		return exams;
	}

	public void setExams(List<Exam> exams) {
		this.exams = exams;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public String getS() {
		return s;
	}

	public void setS(String s) {
		this.s = s;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String test() {
		Map<String, String[]> answerMap = request.getParameterMap();
		Iterator<Entry<String, String[]>> answerIt = answerMap.entrySet().iterator();
		int singleScore = 0;
		int moreScore = 0;
		int totalScore;
		while (answerIt.hasNext()) {
			Entry<String, String[]> answerEntry = answerIt.next();
			String keyStr = answerEntry.getKey();
			String[] values = answerEntry.getValue();
			String key;
			String value = "";
			if (keyStr.equals("exam.student.id") || keyStr.equals("exam.paper.id")) {
				continue;
			}
			if (keyStr.split("-")[1].equals("r")) {
				key = keyStr.split("-")[2];
				value = values[0];
				singleScore += this.calResult(key, value, "1");
			} else {
				key = keyStr.split("-")[2];
				for (String s : values) {
					value += s + ",";
				}
				moreScore += this.calResult(key, value.substring(0, value.length() - 1), "2");
			}
		}
		totalScore = singleScore + moreScore;
		exam.setSingleScore(singleScore);
		exam.setMoreScore(moreScore);
		exam.setScore(totalScore);
		exam.setExamDate(new Date());
		examDao.save(exam);
		mainPage="exam/resultPage.jsp";
		return SUCCESS;
	}

	private int calResult(String key, String value, String type) {
		String answer = questionDao.getQuestion(key).getAnswer();
		if (type.equals("1")) {
			if (value.equals(answer)) {
				return 20;
			}
		} else {
			if (value.equals(answer)) {
				return 30;
			}
		}
		return 0;
	}
	
	public String list(){
		HttpSession session = request.getSession();
		s_exam = new Exam();
		s_exam.setStudent((Student) session.getAttribute("currentUser"));
		exams = examDao.list(s_exam,null);
		mainPage = "exam/examList.jsp";
		s="3";
		return SUCCESS;
	}
	
	public String getList(){
		if(StringUtil.isEmpty(page)){
			page ="1";
		}
		HttpSession session = request.getSession();
		if(s_exam==null){
			Object object =session.getAttribute("s_exam");
			if(object!=null){
				s_exam = (Exam) object;
				session.setAttribute("s_exam", s_exam);
			}else{
				s_exam = null;
			}
		}else{
			session.setAttribute("s_exam", s_exam);
		}
		PageBean pb = new PageBean(Integer.parseInt(page),5);
		int count = examDao.count(s_exam);
		pageCode = PageUtil.genPagation(request.getContextPath()+"/exam!getList", count, Integer.parseInt(page),5);
		exams = examDao.list(s_exam, pb);
		mainPage = "exam/allExamList.jsp";
		s="3";
 		return SUCCESS;
	}

}
