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
		return rStudent;
	}
}
