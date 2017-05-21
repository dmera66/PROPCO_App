package com.mycompany.propco_maven_new;
// Generated 21-May-2017 5:38:12 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * PestsLinkedProduct generated by hbm2java
 */
@Entity
@Table(name="pestsLinkedProduct"
    ,catalog="PROPCO_Maven_new"
)
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
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="PestsID", nullable=false)
    public int getPestsId() {
        return this.pestsId;
    }
    
    public void setPestsId(int pestsId) {
        this.pestsId = pestsId;
    }

    
    @Column(name="ProductID", nullable=false)
    public int getProductId() {
        return this.productId;
    }
    
    public void setProductId(int productId) {
        this.productId = productId;
    }




}


