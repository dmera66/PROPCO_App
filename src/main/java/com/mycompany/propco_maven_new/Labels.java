package com.mycompany.propco_maven_new;
// Generated 21-May-2017 5:38:12 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Labels generated by hbm2java
 */
@Entity
@Table(name="labels"
    ,catalog="PROPCO_Maven_new"
    , uniqueConstraints = @UniqueConstraint(columnNames="Labels") 
)
public class Labels  implements java.io.Serializable {


     private byte lblid;
     private String labels;

    public Labels() {
    }

    public Labels(byte lblid, String labels) {
       this.lblid = lblid;
       this.labels = labels;
    }
   
     @Id 

    
    @Column(name="LBLID", unique=true, nullable=false)
    public byte getLblid() {
        return this.lblid;
    }
    
    public void setLblid(byte lblid) {
        this.lblid = lblid;
    }

    
    @Column(name="Labels", unique=true, nullable=false, length=40)
    public String getLabels() {
        return this.labels;
    }
    
    public void setLabels(String labels) {
        this.labels = labels;
    }




}


