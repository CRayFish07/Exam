package com.jae.dao;

import java.util.List;

import org.hibernate.Query;
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
	
	public boolean exitQuestion(String id){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		String hsql = "from Question where paperId=:paperId";
		Query query = session.createQuery(hsql);
		query.setString("paperId", id);
		@SuppressWarnings("unchecked")
		List<Question> questions = query.list();
		session.getTransaction().commit();
		if(questions.size()>0){
			return true;
		}
		return false;
	}
	
}
