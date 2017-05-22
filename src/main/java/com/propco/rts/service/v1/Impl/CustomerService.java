package com.propco.rts.service.v1.Impl;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.propco.rts.dao.HibernateSessionFactory;
import com.propco.rts.pojo.v1.Customer;
import com.propco.rts.service.v1.Service;

public class CustomerService implements Service {

	public void save(Object object) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		System.out.println( "session: "  + session );
		Customer customer = (Customer) object;

        session.beginTransaction(); 
        
        if( customer.getCustomerId() != null )
        {
        	SQLQuery q = session.createSQLQuery("Select * from Customer where customerID = :customerId ");
        	q.addEntity(Customer.class);
        	q.setParameter("customerId", customer.getCustomerId());
        }
        else
        {
	        session.save( customer );	
        }
        session.flush();
		session.getTransaction().commit();        
		session.close();
		
	}

	public void update(Object object) {
		// TODO Auto-generated method stub
		
	}

	public void delete(Object object) {
		// TODO Auto-generated method stub
		
	}

	public Object findByStockCode(String objectID) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
