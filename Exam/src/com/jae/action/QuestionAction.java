package com.jae.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.jae.dao.QuestionDao;
import com.jae.model.PageBean;
import com.jae.model.Question;
import com.jae.util.PageUtil;
import com.jae.util.ResponseUtil;
import com.jae.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;

public class QuestionAction extends ActionSupport implements ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private QuestionDao questionDao = new QuestionDao();

	private HttpServletRequest request;
	private String error;
	private Question question;
	private String mainPage;
	private String s;
	private List<Question> questions;
	private Question s_Question;
	private String page;
	private String pageCode;
	private String title;
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

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

	public Question getS_Question() {
		return s_Question;
	}

	public void setS_Question(Question s_Question) {
		this.s_Question = s_Question;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public Question getQuestion() {
		return question;
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

	public void setQuestion(Question question) {
		this.question = question;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String list() {
		mainPage = "question/questionList.jsp";
		HttpSession session = request.getSession();
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		if (s_Question == null) {
			Object o = session.getAttribute("s_Question");
			if (o == null) {
				s_Question = new Question();
			} else {
				s_Question = (Question) o;
				session.setAttribute("s_Question", s_Question);
			}
		} else {
			session.setAttribute("s_Question", s_Question);
		}
		int count = questionDao.count(s_Question);
		PageBean pb = new PageBean(Integer.parseInt(page), 3);
		pageCode = PageUtil.genPagation(request.getContextPath() + "/question!list", count, Integer.parseInt(page), 3);
		questions = questionDao.list(s_Question, pb);
		s = "6";
		return SUCCESS;
	}

	public String getQuestionMsg() {
		mainPage = "question/question.jsp";
		question = questionDao.getQuestion(id);
		s = "6";
		return SUCCESS;
	}

	public void delete() throws Exception {
		question = questionDao.getQuestion(id);
		questionDao.delete(question);
		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(result, ServletActionContext.getResponse());
	}

	/*
	 * public String preSave() { if (StringUtil.isEmpty(id)) { title = "添加考生信息";
	 * } else { title = "修改考生信息"; Question = QuestionDao.getQuestion(id); } s =
	 * "2"; mainPage = "/Question/saveQuestion.jsp"; return SUCCESS; }
	 * 
	 * public String save() throws Exception { if
	 * (StringUtil.isEmpty(Question.getId())) { Question.setId("JS" +
	 * DateUtil.getCurrentDateStr()); } QuestionDao.saveQuestion(Question);
	 * return "save"; }
	 * 
	 */

}
