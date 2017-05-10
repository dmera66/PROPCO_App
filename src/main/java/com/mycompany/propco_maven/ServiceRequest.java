package com.mycompany.propco_maven;
// Generated 10-May-2017 9:39:45 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * ServiceRequest generated by hbm2java
 */
public class ServiceRequest  implements java.io.Serializable {


     private Integer serviceReqNr;
     private Bundles bundles;
     private Business business;
     private Customer customer;
     private Users users;
     private String ponr;
     private String invoicing;
     private String serviceType;
     private String paymentType;
     private String schedule;
     private Date serviceDate;
     private Date creationDate;
     private Date updateDate;
     private byte activityCount;
     private ServiceRequestActivities serviceRequestActivities;

    public ServiceRequest() {
    }

	
    public ServiceRequest(Bundles bundles, Business business, Customer customer, Users users, String invoicing, String serviceType, String paymentType, String schedule, Date serviceDate, Date creationDate, Date updateDate, byte activityCount) {
        this.bundles = bundles;
        this.business = business;
        this.customer = customer;
        this.users = users;
        this.invoicing = invoicing;
        this.serviceType = serviceType;
        this.paymentType = paymentType;
        this.schedule = schedule;
        this.serviceDate = serviceDate;
        this.creationDate = creationDate;
        this.updateDate = updateDate;
        this.activityCount = activityCount;
    }
    public ServiceRequest(Bundles bundles, Business business, Customer customer, Users users, String ponr, String invoicing, String serviceType, String paymentType, String schedule, Date serviceDate, Date creationDate, Date updateDate, byte activityCount, ServiceRequestActivities serviceRequestActivities) {
       this.bundles = bundles;
       this.business = business;
       this.customer = customer;
       this.users = users;
       this.ponr = ponr;
       this.invoicing = invoicing;
       this.serviceType = serviceType;
       this.paymentType = paymentType;
       this.schedule = schedule;
       this.serviceDate = serviceDate;
       this.creationDate = creationDate;
       this.updateDate = updateDate;
       this.activityCount = activityCount;
       this.serviceRequestActivities = serviceRequestActivities;
    }
   
    public Integer getServiceReqNr() {
        return this.serviceReqNr;
    }
    
    public void setServiceReqNr(Integer serviceReqNr) {
        this.serviceReqNr = serviceReqNr;
    }
    public Bundles getBundles() {
        return this.bundles;
    }
    
    public void setBundles(Bundles bundles) {
        this.bundles = bundles;
    }
    public Business getBusiness() {
        return this.business;
    }
    
    public void setBusiness(Business business) {
        this.business = business;
    }
    public Customer getCustomer() {
        return this.customer;
    }
    
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public String getPonr() {
        return this.ponr;
    }
    
    public void setPonr(String ponr) {
        this.ponr = ponr;
    }
    public String getInvoicing() {
        return this.invoicing;
    }
    
    public void setInvoicing(String invoicing) {
        this.invoicing = invoicing;
    }
    public String getServiceType() {
        return this.serviceType;
    }
    
    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }
    public String getPaymentType() {
        return this.paymentType;
    }
    
    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }
    public String getSchedule() {
        return this.schedule;
    }
    
    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }
    public Date getServiceDate() {
        return this.serviceDate;
    }
    
    public void setServiceDate(Date serviceDate) {
        this.serviceDate = serviceDate;
    }
    public Date getCreationDate() {
        return this.creationDate;
    }
    
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
    public Date getUpdateDate() {
        return this.updateDate;
    }
    
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
    public byte getActivityCount() {
        return this.activityCount;
    }
    
    public void setActivityCount(byte activityCount) {
        this.activityCount = activityCount;
    }
    public ServiceRequestActivities getServiceRequestActivities() {
        return this.serviceRequestActivities;
    }
    
    public void setServiceRequestActivities(ServiceRequestActivities serviceRequestActivities) {
        this.serviceRequestActivities = serviceRequestActivities;
    }




}


