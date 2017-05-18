/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.client.Application;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import main.java.com.propco.rts.server.pojo.v1.Billing;
import main.java.com.propco.rts.server.pojo.v1.Bundles;
import main.java.com.propco.rts.server.pojo.v1.Customer;
import main.java.com.propco.rts.server.pojo.v1.Department;
import main.java.com.propco.rts.server.pojo.v1.Users;

/**
 *
 * @author dan.mera
 */
public class Operations {
    private static String QUERY_BASED_ON_CUSTOMER_NAME = "from Customer c inner join fetch c.business inner join fetch c.users inner join fetch c.department inner join fetch c.bundles where c.customerName like '%";
    //private static String QUERY_BASED_ON_CUSTOMER_STREET="from Customer so inner join fetch so.business where so.address like '520%';
    private static String QUERY_BASED_ON_CUSTOMER_STREET = "from Customer c inner join fetch c.business inner join fetch c.users inner join fetch c.department inner join fetch c.bundles where c.address like '%";
    private static String QUERY_BASED_ON_BILLING_NAME = "from Business b inner join fetch b.users where b.name like '%";
    private static String QUERY_BASED_ON_DEPARTMENT = "from Department";
    private static String QUERY_BASED_ON_BUNDLES = "from Bundles";
    
    private static SessionFactory factory;
    private static Session session;
    private static Transaction tx;
    //Customer new_customer = null;
    //Business new_business = null;
    
    public Operations() {
        try{
            factory = new Configuration().configure().buildSessionFactory();
        }catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    /* Method to retrieve an user from the database */
    public Users retrieveUser(Integer user_id){
        // Get the session from session factory
        Session session = factory.openSession();
        Transaction tx = null;
        //Integer departmentID = null;
        Users users = null;
        try{
            //begin the transaction
            tx = session.beginTransaction();
            //Create a new bundle object
            //users = new Users(Login.user_id);
            // save the bundle object.The changes to persistent object will be written to database.
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            //close the session.
            session.close();
        }
        return users;
    }
    
    /* Method to add a billing record in the database */
    public Billing addBilling(String billingName, String billingAlias, String billingAddress, String billingCity, String billingProvince, String billingPostalCode, String billingContactName, String billingPrimaryPhone, String billingExt, String billingSecondaryPhone, String billingExt2, String billingFax, String billingEmailAddress, int updatedByUser){
        // Get the session from session factory
        Session session = factory.openSession();
        Transaction tx = null;
        Integer billingID = null;
        Billing billing = null;
        try{
            //begin the transaction
            tx = session.beginTransaction();
            //Create a new bundle object
            
            billing = new Billing();
            // save the bundle object.The changes to persistent object will be written to database.
            billingID = (Integer) session.save(billing);
            //The changes to persistent object will be written to database.
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            //close the session.
            session.close();
        }
      return billing;
    }
    /* Method to update a billing record in the database */
    public void updateBilling(Department department,String billingName, String billingAlias, String billingAddress, String billingCity, String billingProvince, String billingPostalCode, String billingContactName, String billingPrimaryPhone, String billingExt, String billingSecondaryPhone, String billingExt2, String billingFax, String billingEmailAddress, int updatedByUser){
        // Get the session from session factory
        Session session = factory.openSession();
        Transaction tx = null;
        Integer billingID = null;
        try{
            //begin the transaction
            tx = session.beginTransaction();
            //Create a new bundle object
            Billing billing = (Billing)session.get(Billing.class, billingID);
            //billing.setDepartments(department);
            billing.setBillingName(billingName);
            billing.setBillingAlias(billingAlias);
            billing.setBillingAddress(billingAddress);
            billing.setBillingCity(billingCity);
            billing.setBillingProvince(billingProvince);
            billing.setBillingPostalCode(billingPostalCode);
            billing.setBillingContactName(billingContactName);
            billing.setBillingPrimaryPhone(billingPrimaryPhone);
            billing.setBillingExt(billingExt);
            billing.setBillingSecondaryPhone(billingSecondaryPhone);
            billing.setBillingExt2(billingExt2);
            billing.setBillingFax(billingFax);
            billing.setBillingEmailAddress(billingEmailAddress);
            //billing.setCreationDate(creationDate);
            billing.setUpdateDate(DateUtils.Date_as_Date(DateUtils.now_date_time()));
            billing.setUpdatedByUser(Login.user_id);
            session.update(billing);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            //close the session.
            session.close();
        }
    }
    /* Method to add a department record in the database */
    public Department addDepartment(String departmentName, String contractNumber){
        // Get the session from session factory
        Session session = factory.openSession();
        Transaction tx = null;
        Integer departmentID = null;
        Department department = null;
        try{
            //begin the transaction
            tx = session.beginTransaction();
            //Create a new bundle object
            department = new Department();
            // save the bundle object.The changes to persistent object will be written to database.
            departmentID = (Integer) session.save(department);
            //The changes to persistent object will be written to database.
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            //close the session.
            session.close();
        }
        return department;
   }
    /* Method to update a department record in the database */
    public void updateDepartment(String departmentName, String contractNumber){
        // Get the session from session factory
        Session session = factory.openSession();
        Transaction tx = null;
        Integer departmentID = null;
        try{
            //begin the transaction
            tx = session.beginTransaction();
            //Create a new bundle object
            Department department = (Department)session.get(Department.class, departmentID);
            department.setDepartmentName(departmentName);
            department.setContractNumber(contractNumber);
            //department.setCreationDate(creationDate);
            department.setUpdateDate(DateUtils.Date_as_Date(DateUtils.now_date_time()));
            department.setUpdatedByUser(Login.user_id);
            session.update(department);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            //close the session.
            session.close();
        }
    }
    /* Method to add a bundle record in the database */
    public Bundles addBundle(String bundleName){
        // Get the session from session factory
        Session session = factory.openSession();
        Transaction tx = null;
        Integer bundleID = null;
        Bundles bundles = null;
        try{
            //begin the transaction
            tx = session.beginTransaction();
            //Create a new bundle object
            bundles = new Bundles();
            // save the bundle object.The changes to persistent object will be written to database.
            bundleID = (Integer) session.save(bundles);
            //The changes to persistent object will be written to database.
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            //close the session.
            session.close();
        }
      return bundles;
    }
    /* Method to update a bundle record in the database */
    public void updateBundles(String bundleName){
        // Get the session from session factory
        Session session = factory.openSession();
        Transaction tx = null;
        Integer bundleID = null;
        try{
            //begin the transaction
            tx = session.beginTransaction();
            //Create a new bundle object
            Bundles bundles = (Bundles)session.get(Bundles.class, bundleID);
            bundles.setBundleName(bundleName);
            
            //department.setCreationDate(creationDate);
            //bundles .setUpdateDate(DateUtils.Date_as_Date(DateUtils.now_date_time()));
            //bundles.setUpdatedByUser(Login.user_id);
            session.update(bundles);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            //close the session.
            session.close();
        }
    }
            
    /* Method to add a customer record in the database */
    public Integer addCustomer(Billing billing, Bundles bundles, Users users,String CustomerName,String Notes,String Address,String Unit,String AddressNotes,String City,String Province,String PostalCode,String ContactName,String PrimaryPhone,String Ext,String SecondaryPhone,String Ext2,String Fax,String EmailAddress) {
       // get the session from session factory
      Session session = factory.openSession();
      Transaction tx = null;
      Integer customerID = null;
      Customer customer = null;
      try{
          // begin the transaction from the sessiom
         tx = session.beginTransaction();
         // create a new object for bundle
         customer = new Customer();
         //Billing billing, Bundles bundles, Users users, String customerName, String notes, String address, String unit,String addressNotes, String city, String province, String postalCode, String contactName, String primaryPhone, String ext, String secondaryPhone, String ext2, String fax, String emailAddress, Date creationDate, Date updateDate, Set serviceRequests
         // save the author . It auto generates the Id .So need to give the id
         customerID = (Integer) session.save(customer);
         //The changes to persistent object will be written to database.
         tx.commit();
      }catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace();
      }finally {
          // close the session
         session.close();
      }
      return customerID;
   }
   
    /* Method to list all the books detail */
    public void listBilling(String query){
        //Get the session from the session factory.
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            //Make an HQL query to get the results from books table . You can also use SQL here.
            List billing = session.createQuery(query).list();
            //Iterate over the result and print it.
            for (Iterator iterator = billing.iterator(); iterator.hasNext();){
                Billing book = (Billing) iterator.next();
                //System.out.print("Title : " + book.getTitle());
                //System.out.print("\tGenre of the  book: " + book.getGenre());
                // Get the author of the book here.
                //Author author = book.getAuthor();
                //System.out.println("Author of the book ");
                //System.out.println("\tname : " +  author.getName());
                //System.out.println("\tage : " + author.getAge());
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
   }
    public void initializeSession(){
        try{
            factory = new Configuration().configure().buildSessionFactory();
            session = factory.openSession();
            tx = session.beginTransaction();
            
        }catch (Throwable ex) { 
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex); 
        }
    }
    
    private List executeHQLQuery(String query){
        //System.out.println("Session executeHQLQuery opened");
        List resultList = null;
        try{
            tx = session.beginTransaction();
            //System.out.println("Session executeHQLQuery tx begin");
            Query q = session.createQuery(query);
            //System.out.println("Session executeHQLQuery query completed");
            resultList = q.list();
            tx.commit();
        }
        catch (HibernateException he){
            if (tx!=null) tx.rollback();
            he.printStackTrace();
        }
        //when to close it????
        //finally{
        //    session.close();
        //    System.out.println("Session executeHQLQuery closed");
        //}
        
        return resultList;
    }
    /* Method to CREATE an employee in the database */
}
