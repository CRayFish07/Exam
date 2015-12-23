package com.jae.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.jae.dao.StudentDao;
import com.jae.model.Student;
import com.opensymphony.xwork2.ActionSupport;

public class StudentAction extends ActionSupport implements ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private StudentDao studentDao = new StudentDao();
	
	private HttpServletRequest request;
	private String error;
	private Student student;
	private String mainPage;
	private String s;
	
	

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

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

	public String login(){
		HttpSession session = request.getSession();
		Student currentStudent = studentDao.login(student);
		if(currentStudent!=null){
			session.setAttribute("currentStudent", currentStudent);
			s="1";
			return SUCCESS;
		}else{
			error = "用户名或密码错误!";
			return ERROR;
		}
	}
	
	public String preSave(){
		mainPage = "student/updatePassword.jsp";
		s="4";
		return SUCCESS;
	}
	
	public String save(){
		Student student1 = studentDao.getStudent(student.getId());
		student1.setPassword(student.getPassword());
		studentDao.saveStudent(student1);
		mainPage = "student/updateSuccess.jsp";
		s="4";
		return SUCCESS;
	}
	
	public String layout(){
		request.getSession().invalidate();
		return "layout";
	}
	
}
