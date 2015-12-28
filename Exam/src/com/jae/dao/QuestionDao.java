package com.jae.dao;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.jae.model.PageBean;
import com.jae.model.Question;
import com.jae.util.HibernateUtil;
import com.jae.util.StringUtil;

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
	
	public List<Question> list(Question s_Question,PageBean pb){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer hsql = new StringBuffer("from Question");
		if(StringUtil.isNotEmpty(s_Question.getSubject())){
			hsql.append(" and subject like '%"+s_Question.getSubject()+"%'");
		}
		Query query = session.createQuery(hsql.toString().replaceFirst("and", "where"));
		if(pb!=null){
			query.setFirstResult(pb.getStart());
			query.setMaxResults(pb.getPageSize());
		}
		@SuppressWarnings("unchecked")
		List<Question> Questions = (List<Question>)query.list();
		session.getTransaction().commit();
		return Questions;
	}
	
	public int count(Question s_Question){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer sql = new StringBuffer("select count(*) as total from t_question");
		if(StringUtil.isNotEmpty(s_Question.getSubject())){
			sql.append(" and subject like '%"+s_Question.getSubject()+"%'");
		}
		Query query = session.createSQLQuery(sql.toString().replaceFirst("and", "where"));
		int i = ((BigInteger)query.uniqueResult()).intValue();
		session.getTransaction().commit();
		return i;
	}

	public void delete(Question question) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.delete(question);
		session.getTransaction().commit();
	}
}
