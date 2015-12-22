package com.jae.dao;

import org.hibernate.Session;

import com.jae.model.Question;
import com.jae.util.HibernateUtil;

public class QuestionDao {
	public Question getQuestion(String id){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Question question = (Question) session.get(Question.class, Integer.parseInt(id));
		session.getTransaction().commit();
		return question;
	}
}
