package com.jae.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import com.jae.model.Manager;
import com.jae.util.HibernateUtil;

public class ManagerDao {
	public Manager login(Manager manager){
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery("from t_manager where userName= :userName and password= :password");
		query.setString("userName", manager.getUserName());
		query.setString("password", manager.getPassword());
		Manager rManager = (Manager) query.uniqueResult();
		session.getTransaction().commit();
		return rManager;
	}
}
