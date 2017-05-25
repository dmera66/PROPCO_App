/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Application;

import com.mycompany.propco_maven_new.Customer;
import java.util.Iterator;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author dan
 */
public class listCustomer{
/* Method to READ the unique customer having a specific criteria */
private static SessionFactory factory;   
//public static Customer listCustomer(String field, String value ){
    public listCustomer(String field, String value) {
        Operations.createFactory();
        Session session = factory.openSession();
        Transaction tx = null;
        
        Customer customer = null;
        try{
            System.out.println("listCustomers " + field + ";" + value);
            //tx = session.beginTransaction();
            Criteria cr = session.createCriteria(Customer.class);
            // Add restriction.
            cr.add(Restrictions.like(field, value));
            
            List customers = cr.list();
            System.out.println("listCustomers1 " + field + ";" + value);
            for (Iterator iterator = customers.iterator(); iterator.hasNext();){
                System.out.println("listCustomers2 " + field + ";" + value);
                customer = (Customer) iterator.next();
                CreateSR.txtCustomerName.setText(customer.getCustomerName());
                CreateSR.txtNotes.setText(customer.getNotes());
                CreateSR.txtAddress.setText(customer.getAddress());
                CreateSR.txtAddressNotes.setText(customer.getAddressNotes());
                CreateSR.txtCity.setText(customer.getCity());
                CreateSR.txtProvince.setText(customer.getProvince());
                CreateSR.txtPostalCode.setText(customer.getPostalCode());
                CreateSR.txtContactName.setText(customer.getContactName());
                CreateSR.txtPrimaryPhone.setText(customer.getPrimaryPhone());
                CreateSR.txtExt.setText(customer.getExt());
                CreateSR.txtSecondaryPhone.setText(customer.getSecondaryPhone());
                CreateSR.txtExt2.setText(customer.getExt2());
                CreateSR.txtFax.setText(customer.getFax());
                CreateSR.txtEmailAddress.setText(customer.getEmailAddress());
                //CreateSR.cmbBundles.setSelectedItem(customer.getBundles().getBundleName().toString());
                //cmbBundles.setSelectedItem(new_customer.getBundles().getBundleName());
                //if ((new_customer.getBundles().getBundleName()).isEmpty()){cbBundle.setSelected(false);}
                CreateSR.txtBillingName.setText(customer.getBilling().getBillingName());
                CreateSR.txtBillingAlias.setText(customer.getBilling().getBillingAlias());
                CreateSR.txtBillingAddress.setText(customer.getBilling().getBillingAddress());
                CreateSR.txtBillingCity.setText(customer.getBilling().getBillingCity());
                CreateSR.txtBillingProvince.setText(customer.getBilling().getBillingProvince());
                CreateSR.txtBillingPostalCode.setText(customer.getBilling().getBillingPostalCode());
                CreateSR.txtBillingContactName.setText(customer.getBilling().getBillingContactName());
                CreateSR.txtBillingPrimaryPhone.setText(customer.getBilling().getBillingPrimaryPhone());
                CreateSR.txtBillingExt.setText(customer.getBilling().getBillingExt());
                CreateSR.txtBillingFax1.setText(customer.getBilling().getBillingSecondaryPhone());
                CreateSR.txtBillingExt2.setText(customer.getBilling().getBillingExt2());
                CreateSR.txtBillingFax.setText(customer.getBilling().getBillingFax());
                CreateSR.txtBillingEmailAddress.setText(customer.getBilling().getBillingEmailAddress());
                
                //CreateSR.fillInfo(customer);
                System.out.print("Name: "); 
                //System.out.print("Address: " + customer.getAddress()); 
            }
            //session.load(customer, serializable); ??? what is the second param
            //session.persist(customer);
            
            //tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
    }
}