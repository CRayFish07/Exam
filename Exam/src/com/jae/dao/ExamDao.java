package com.jae.dao;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.jae.model.Exam;
import com.jae.model.PageBean;
import com.jae.util.HibernateUtil;
import com.jae.util.StringUtil;

public class ExamDao {
	public void save(Exam exam){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.merge(exam);
		session.getTransaction().commit();
	}
	
	public List<Exam> list(Exam s_exam,PageBean pb){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		StringBuffer hsql = new StringBuffer();
		hsql.append("from Exam ");
		if(s_exam!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getId())){
			hsql.append(" and student.id = '"+s_exam.getStudent().getId()+"'");
		}
		if(s_exam!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getName())){
			hsql.append(" and student.name = '"+s_exam.getStudent().getName()+"'");
		}
		Query query = session.createQuery(hsql.toString().replaceFirst("and", "where"));
		if(pb!=null){
			query.setFirstResult(pb.getStart());
			query.setMaxResults(pb.getPageSize());
		}
		@SuppressWarnings("unchecked")
		List<Exam> exams = query.list();
		session.getTransaction().commit();
		return exams;
	}
	
	public int count(Exam s_exam){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer sql = new StringBuffer("select count(*) as total from t_exam t1 , t_student t2 where t1.studentId=t2.id");
		if(s_exam!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getId())){
			sql.append(" and t2.id = '"+s_exam.getStudent().getId()+"'");
		}
		if(s_exam!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getName())){
			sql.append(" and t2.name = '"+s_exam.getStudent().getName()+"'");
		}
		Query query = session.createSQLQuery(sql.toString());
		int i = ((BigInteger)query.uniqueResult()).intValue();
		session.getTransaction().commit();
		return i;
	}
}
