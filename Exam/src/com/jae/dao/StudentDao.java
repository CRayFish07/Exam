package com.jae.dao;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.jae.model.PageBean;
import com.jae.model.Student;
import com.jae.util.HibernateUtil;
import com.jae.util.StringUtil;

public class StudentDao {
	public Student login(Student student){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery("from Student as s where s.id=:id and s.password=:password");
		query.setString("id", student.getId());
		query.setString("password", student.getPassword());
		Student rStudent = (Student) query.uniqueResult();
		session.getTransaction().commit();;
		return rStudent;
	}
	
	public Student getStudent(String id){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Student student = (Student) session.get(Student.class,id);
		session.getTransaction().commit();
		return student;
	}
	
	public void saveStudent(Student student){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.merge(student);
		session.getTransaction().commit();
	}
	
	public List<Student> list(Student s_Student,PageBean pb){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer hsql = new StringBuffer("from Student");
		if(StringUtil.isNotEmpty(s_Student.getId())){
			hsql.append(" and id like '%"+s_Student.getId()+"%'");
		}
		if(StringUtil.isNotEmpty(s_Student.getName())){
			hsql.append(" and name like '%"+s_Student.getName()+"%'");
		}
		Query query = session.createQuery(hsql.toString().replaceFirst("and", "where"));
		if(pb!=null){
			query.setFirstResult(pb.getStart());
			query.setMaxResults(pb.getPageSize());
		}
		@SuppressWarnings("unchecked")
		List<Student> students = (List<Student>)query.list();
		session.getTransaction().commit();
		return students;
	}
	
	public int count(Student s_Student){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer sql = new StringBuffer("select count(*) as total from t_student");
		if(StringUtil.isNotEmpty(s_Student.getId())){
			sql.append(" and id like '%"+s_Student.getId()+"%'");
		}
		if(StringUtil.isNotEmpty(s_Student.getName())){
			sql.append(" and name like '%"+s_Student.getName()+"%'");
		}
		Query query = session.createSQLQuery(sql.toString().replaceFirst("and", "where"));
		int i = ((BigInteger)query.uniqueResult()).intValue();
		session.getTransaction().commit();
		return i;
	}
	
	public void delete(Student student){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.delete(student);
		session.getTransaction().commit();
	}
	
}
