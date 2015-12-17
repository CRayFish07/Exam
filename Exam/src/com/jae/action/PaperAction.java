package com.jae.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.jae.dao.PaperDao;
import com.jae.model.Paper;
import com.opensymphony.xwork2.ActionSupport;


public class PaperAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private PaperDao paperDao = new PaperDao();
	
	private HttpServletRequest request;
	private String mainPage;
	private List<Paper> papers = new ArrayList<Paper>();
	
	
	public List<Paper> getPapers() {
		return papers;
	}



	public void setPapers(List<Paper> papers) {
		this.papers = papers;
	}



	public String getMainPage() {
		return mainPage;
	}



	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public String list(){
		mainPage="exam/selectPaper.jsp";
		papers=paperDao.list();
		return SUCCESS;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
	
}
