package com.mycompany.propco_maven;
// Generated 10-May-2017 9:39:45 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Department generated by hbm2java
 */
public class Department  implements java.io.Serializable {


     private int did;
     private Business business;
     private Users users;
     private String deptName;
     private String contractNr;
     private Date creationDate;
     private Date updateDate;
     private Set customers = new HashSet(0);

    public Department() {
    }

	
    public Department(int did, Business business, Users users, String deptName, String contractNr, Date creationDate, Date updateDate) {
        this.did = did;
        this.business = business;
        this.users = users;
        this.deptName = deptName;
        this.contractNr = contractNr;
        this.creationDate = creationDate;
        this.updateDate = updateDate;
    }
    public Department(int did, Business business, Users users, String deptName, String contractNr, Date creationDate, Date updateDate, Set customers) {
       this.did = did;
       this.business = business;
       this.users = users;
       this.deptName = deptName;
       this.contractNr = contractNr;
       this.creationDate = creationDate;
       this.updateDate = updateDate;
       this.customers = customers;
    }
   
    public int getDid() {
        return this.did;
    }
    
    public void setDid(int did) {
        this.did = did;
    }
    public Business getBusiness() {
        return this.business;
    }
    
    public void setBusiness(Business business) {
        this.business = business;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public String getDeptName() {
        return this.deptName;
    }
    
    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }
    public String getContractNr() {
        return this.contractNr;
    }
    
    public void setContractNr(String contractNr) {
        this.contractNr = contractNr;
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
    public Set getCustomers() {
        return this.customers;
    }
    
    public void setCustomers(Set customers) {
        this.customers = customers;
    }




}


