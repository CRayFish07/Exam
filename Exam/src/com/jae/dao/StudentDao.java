package com.jae.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import com.jae.model.Student;
import com.jae.util.HibernateUtil;

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
	
}
