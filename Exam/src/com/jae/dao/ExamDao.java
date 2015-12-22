package com.jae.dao;

import org.hibernate.Session;

import com.jae.model.Exam;
import com.jae.util.HibernateUtil;

public class ExamDao {
	public void save(Exam exam){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.merge(exam);
		session.getTransaction().commit();
	}
}
