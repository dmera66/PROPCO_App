/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.propco_maven;

import java.io.Serializable;

/**
 *
 * @author dan
 */
public class Labels implements Serializable{
    private Byte lblid;
    private String labels;

    public Labels() {
    }

    public Labels(Byte lblid, String labels) {
       this.lblid = lblid;
       this.labels = labels;
    }
    
    public Byte getlblid() {
        return lblid;
    }

    public void setlblid(Byte lblid) {
        this.lblid = lblid;
    }
    
    public String getlabels() {
        return labels;
    }

    public void setlabels(String labels) {
        this.labels = labels;
    }
}
