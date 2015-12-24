package com.jae.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.jae.dao.StudentDao;
import com.jae.model.PageBean;
import com.jae.model.Student;
import com.jae.util.DateUtil;
import com.jae.util.PageUtil;
import com.jae.util.StringUtil;
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
	private List<Student> students;
	private Student s_student;
	private String page;
	private String pageCode;
	private String title;

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

	public Student getS_student() {
		return s_student;
	}

	public void setS_student(Student s_student) {
		this.s_student = s_student;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
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
		this.request = request;
	}

	public String login() {
		HttpSession session = request.getSession();
		Student currentUser = studentDao.login(student);
		if (currentUser != null) {
			session.setAttribute("currentUser", currentUser);
			s = "1";
			return SUCCESS;
		} else {
			error = "用户名或密码错误!";
			return ERROR;
		}
	}

	public String preUpdate() {
		mainPage = "student/updatePassword.jsp";
		s = "4";
		return SUCCESS;
	}

	public String update() {
		Student student1 = studentDao.getStudent(student.getId());
		student1.setPassword(student.getPassword());
		studentDao.saveStudent(student1);
		mainPage = "student/updateSuccess.jsp";
		s = "4";
		return SUCCESS;
	}

	public String layout() {
		request.getSession().invalidate();
		return "layout";
	}

	public String list() {
		mainPage = "student/studentList.jsp";
		HttpSession session = request.getSession();
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		if (s_student == null) {
			Object o = session.getAttribute("s_student");
			if (o == null) {
				s_student = new Student();
			} else {
				s_student = (Student) o;
				session.setAttribute("s_student", s_student);
			}
		} else {
			session.setAttribute("s_student", s_student);
		}
		int count = studentDao.count(s_student);
		PageBean pb = new PageBean(Integer.parseInt(page), 3);
		pageCode = PageUtil.genPagation(request.getContextPath() + "/student!list", count, Integer.parseInt(page), 3);
		students = studentDao.list(s_student, pb);
		s = "2";
		return SUCCESS;
	}

	public String preSave() {
		if (student ==null) {
			title = "添加考生信息";
		}else{
			title = "修改考生信息";
		}
		mainPage = "/student/saveStudent.jsp";
		return SUCCESS;
	}

	public String save() throws Exception{
		if (StringUtil.isEmpty(student.getId())) {
			student.setId("JS"+DateUtil.getCurrentDateStr());
		}
		studentDao.saveStudent(student);
		return "save";
	}

}
