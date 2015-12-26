package com.jae.dao;


import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

import com.jae.model.Paper;
import com.jae.util.HibernateUtil;

public class PaperDao {
	public List<Paper> list(){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query query =session.createQuery("from Paper");
		@SuppressWarnings("unchecked")
		List<Paper> papers = (List<Paper>)query.list();
		session.getTransaction().commit();
		return papers;
	}
	
	public Paper getPaper(String paperId){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Paper paper = (Paper) session.get(Paper.class, Integer.parseInt(paperId));
		session.getTransaction().commit();
		return paper;
	}
	
	public void delete(Paper paper){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.delete(paper);
		session.getTransaction().commit();
	}
}
