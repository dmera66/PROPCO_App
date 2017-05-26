/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package temp;

import Application.Login;
import com.mycompany.propco_maven_new.Users;
import java.awt.BorderLayout;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.persister.entity.AbstractEntityPersister;
import propco_maven_new.HibernateUtil;
/**
 *
 * @author dan
 */
public class Admin_Users extends javax.swing.JFrame{
    private String[] columnNames=new String[7];
    private Object[][] dataValues=new String[3][];
    JTable table = new JTable();
    JScrollPane pane = new JScrollPane();
    JPanel pnlTable = new JPanel();
    JPanel pnlMore = new JPanel();
    JPanel pnlActions = new JPanel();
    JPanel pnlActivities = new JPanel();
    JButton btnMore = new JButton("More Rows...");
    JButton btnCancel = new JButton("Cancel");
    JButton btnSave  = new JButton("Create/Save User");    
    myTableModel model;
    /**
     * Creates new form Admin_Users
     */
    public Admin_Users() {
        //initComponents();
        this.setLocationRelativeTo(null);
        setTitle("Administrative Panel for Users");
        setSize(740,600);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        //initComponents();
        System.out.println("===Add Users and Update Administrative Rights===");
        pnlTable.setLayout(new BorderLayout());
        
        columnNames = new String[] {};//"User Name","Password","Full Privilege","Service Receipt","Assign Service to Technician","Pending Service Request","Review Service Request","Invoices","Reports" };
        dataValues=new Object[][]{}; //{{"","","","","","","","",""},{"","","","","","","","",""},{"","","","","","","","",""},{"","","","","","","","","",},{"","","","","","","","",""},};
        
        myTableModel model=new myTableModel();
        table.setRowHeight(30);
        //table.setShowVerticalLines(true);
        table.setShowGrid(true);
        table.setAutoResizeMode(4);
        
        table.setModel(model);
        table.setCellSelectionEnabled(true);
        
        ListSelectionModel cellSelectionModel = table.getSelectionModel();
        cellSelectionModel.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        
        cellSelectionModel.addListSelectionListener(new ListSelectionListener() {
            
            @Override
            public void valueChanged(ListSelectionEvent e){
                if(! cellSelectionModel.isSelectionEmpty()){
                    System.out.println("in the event");
                    
                    int selectedrow = cellSelectionModel.getMinSelectionIndex();
                    String a = model.getValueAt(selectedrow,1).toString();
                    System.out.println("in the event " + a);
                }
            }
        });
        pane.setSize(740,100);
        pnlTable.add(pane);
        pnlTable.setSize(740,150);
        
        pnlMore.add(btnMore);
        pnlMore.setSize(740,100);
        btnMore.setBounds(350,150,100,30);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
        TableColumnAdjuster tca = new TableColumnAdjuster(table);
        tca.adjustColumns();

        pane.setViewportView(table);
        
        //pnlTable.add(pane);
        //pnlTable.setBounds(0,0,400,200);
        pnlActions.setLayout(new BorderLayout());
        pnlActions.add(btnCancel,BorderLayout.WEST);
        btnCancel.setBounds(50,0,100,30);
        btnSave.setBounds(250,0,100,30);
        pnlActions.add(btnSave,BorderLayout.EAST);
        //pnlActions.setBounds(200,0,400,200);
        pnlActivities.setLayout(new BorderLayout());
        pnlActivities.add(pnlTable,BorderLayout.NORTH);
        pnlActivities.add(pnlMore,BorderLayout.CENTER);
        pnlActivities.add(pnlActions,BorderLayout.SOUTH);
        getContentPane().add(pnlActivities);
        setVisible(true);
        setResizable(false);
        AbstractEntityPersister aep=((AbstractEntityPersister)HibernateUtil.getSessionFactory().getClassMetadata(Users.class));  
        String[] properties=aep.getPropertyNames(); 
        
        String[] tmpArray = {};
        for(int nameIndex=0;nameIndex!=properties.length;nameIndex++){  
            //System.out.println("Property name: "+properties[nameIndex]);  
            String[] columnNames=aep.getPropertyColumnNames(nameIndex);
            for(int columnIndex=0;columnIndex!=columnNames.length;columnIndex++){  
                //System.out.println("Column name: "+columnNames[columnIndex]);  
                tmpArray = add(tmpArray,columnNames[columnIndex]);
            }  
        } 
        
        model.setColumnIdentifiers(tmpArray);
        
        List users_list = usersList();
        for (Iterator iterator = users_list.iterator(); iterator.hasNext();){
            Users users = (Users) iterator.next(); 
            model.addRow(new Object[]{
                users.getUserName(),
                users.getPassword().replaceAll(users.getPassword(), "**********"),
                users.isFullprivilege(),
                users.isServiceReceipt(),
                users.isAssignServiceTech(),
                users.isPendingWo(),
                users.isReviewSr(),
                users.isInvoices(),
                users.isReports()
                });
            }
        btnMore.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                System.out.println("nr of rows " + model.getRowCount());
                if (!model.getValueAt(model.getRowCount()-1,0).toString().isEmpty() 
                        && !model.getValueAt(model.getRowCount()-1,1).toString().isEmpty()){
                    Vector rowData = null;
                    Boolean[] tmpArray = {};
                    for(int columnIndex=2;columnIndex!=model.getColumnCount();columnIndex++){  
                        tmpArray = add(tmpArray,false);
                    }
                    String[] rowData1= {"",""};
                    model.addRow(rowData1);
                    table.validate();
                }
            }
        });
        
        //table.addKeyListener(new KeyListener()); 
        btnCancel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelActionPerformed(evt);
            }
        });
        
        btnSave.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSaveActionPerformed(evt);
            }
        });
        
        
    }
    public class myTableModel extends DefaultTableModel{
        myTableModel(){
            super(dataValues,columnNames);
        }
        @Override
        public boolean isCellEditable(int row,int cols){return true;}
        @Override
        public Class<?> getColumnClass(int columnIndex) {
            if(columnIndex >= 2){
                return Boolean.class;
            }
            return super.getColumnClass(columnIndex);
        }
    }
    private void btnSaveActionPerformed(java.awt.event.ActionEvent evt) {}
    private void btnCancelActionPerformed(java.awt.event.ActionEvent evt) {}
    
    private List usersList(){
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List users_list = null;
        try {
            tx = sesion.beginTransaction();
            users_list = sesion.createQuery("FROM Users").list();
         
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return users_list;
    }
    
    public static String[] add(String[] stringArray, String newValue){
        String[] tempArray = new String[ stringArray.length + 1 ];
        for (int i=0; i<stringArray.length; i++){tempArray[i] = stringArray[i];}
        tempArray[stringArray.length] = newValue;
        return tempArray;
    }

    public static Boolean[] add(Boolean[] booleanArray, Boolean newValue){
        Boolean[] tempArray = new Boolean[ booleanArray.length + 1 ];
        for (int i=0; i<booleanArray.length; i++){tempArray[i] = booleanArray[i];}
        tempArray[booleanArray.length] = newValue;
        return tempArray;
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents
/**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Admin_Users().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
