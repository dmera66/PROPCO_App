package com.mycompany.propco_maven;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author dan
 */
public class DateUtils {
    public static final String DATE_FORMAT_NOW = "yyyy-MM-dd"; // HH:mm:ss";
    ResultSet rs = null;
    Integer DupSR = 0;
    String sqlStmt = "";
    Statement stmt ;

    public static String now_date_time() {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date my_date = new Date();
        return sdf.format(my_date);
    }
    public static String now_date() {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
        Date my_date = new Date();
        return sdf.format(my_date);
    }
    
    public static String Calendar_date(Date my_date){
        System.out.println("my_date:" + my_date.toString());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        return sdf.format(my_date);
    }
    public static Object makeObj(final String item)  {
            return new Object() { public String toString() { return item; } };
    }
    
    public Object avoid_null(Object field_value){
        return (field_value == null) ? "": field_value;
    }
}
