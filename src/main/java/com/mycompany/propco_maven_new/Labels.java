package com.mycompany.propco_maven_new;
// Generated 21-May-2017 4:03:39 PM by Hibernate Tools 4.3.1



/**
 * Labels generated by hbm2java
 */
public class Labels  implements java.io.Serializable {


     private byte lblid;
     private String labels;

    public Labels() {
    }

    public Labels(byte lblid, String labels) {
       this.lblid = lblid;
       this.labels = labels;
    }
   
    public byte getLblid() {
        return this.lblid;
    }
    
    public void setLblid(byte lblid) {
        this.lblid = lblid;
    }
    public String getLabels() {
        return this.labels;
    }
    
    public void setLabels(String labels) {
        this.labels = labels;
    }




}

