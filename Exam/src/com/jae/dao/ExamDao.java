package com.jae.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.jae.model.Exam;
import com.jae.util.HibernateUtil;
import com.jae.util.StringUtil;

public class ExamDao {
	public void save(Exam exam){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.merge(exam);
		session.getTransaction().commit();
	}
	
	public List<Exam> list(Exam s_exam){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		StringBuffer hsql = new StringBuffer();
		hsql.append("from Exam ");
		if(StringUtil.isNotEmpty(s_exam.getStudent().getId())){
			hsql.append(" and student.id = '"+s_exam.getStudent().getId()+"'");
		}
		Query query = session.createQuery(hsql.toString().replaceFirst("and", "where"));
		@SuppressWarnings("unchecked")
		List<Exam> exams = query.list();
		session.getTransaction().commit();
		return exams;
	}
}
