package com.mycompany.propco_maven_new;
// Generated 21-May-2017 4:03:39 PM by Hibernate Tools 4.3.1



/**
 * Product generated by hbm2java
 */
public class Product  implements java.io.Serializable {


     private Byte id;
     private String productName;
     private String measurement;
     private String pcpnumber;

    public Product() {
    }

    public Product(String productName, String measurement, String pcpnumber) {
       this.productName = productName;
       this.measurement = measurement;
       this.pcpnumber = pcpnumber;
    }
   
    public Byte getId() {
        return this.id;
    }
    
    public void setId(Byte id) {
        this.id = id;
    }
    public String getProductName() {
        return this.productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public String getMeasurement() {
        return this.measurement;
    }
    
    public void setMeasurement(String measurement) {
        this.measurement = measurement;
    }
    public String getPcpnumber() {
        return this.pcpnumber;
    }
    
    public void setPcpnumber(String pcpnumber) {
        this.pcpnumber = pcpnumber;
    }




}

