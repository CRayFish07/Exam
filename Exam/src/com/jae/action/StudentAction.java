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
			return SUCCESS;
		}else{
			error = "用户名或密码错误!";
			return ERROR;
		}
	}
	
}
