package com.mycompany.propco_maven_new;
// Generated 21-May-2017 4:03:39 PM by Hibernate Tools 4.3.1



/**
 * PestsLinkedProduct generated by hbm2java
 */
public class PestsLinkedProduct  implements java.io.Serializable {


     private Integer id;
     private int pestsId;
     private int productId;

    public PestsLinkedProduct() {
    }

    public PestsLinkedProduct(int pestsId, int productId) {
       this.pestsId = pestsId;
       this.productId = productId;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public int getPestsId() {
        return this.pestsId;
    }
    
    public void setPestsId(int pestsId) {
        this.pestsId = pestsId;
    }
    public int getProductId() {
        return this.productId;
    }
    
    public void setProductId(int productId) {
        this.productId = productId;
    }




}

