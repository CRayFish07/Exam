package com.jae.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.jae.dao.ManagerDao;
import com.jae.model.Manager;
import com.opensymphony.xwork2.ActionSupport;

public class ManagerAction extends ActionSupport implements ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ManagerDao managerDao = new ManagerDao();
	
	private HttpServletRequest request;
	private String error;
	private Manager manager;
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


	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
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
		Manager currentUser = managerDao.login(manager);
		if(currentUser!=null){
			session.setAttribute("currentUser", currentUser);
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
	
	/*public String save(){
		Student student1 = studentDao.getStudent(student.getId());
		student1.setPassword(student.getPassword());
		studentDao.saveStudent(student1);
		mainPage = "student/updateSuccess.jsp";
		s="4";
		return SUCCESS;
	}*/
	
	public String layout(){
		request.getSession().invalidate();
		return "layout";
	}
	
}
