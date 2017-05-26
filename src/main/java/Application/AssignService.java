/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Application;

import java.awt.BorderLayout;
import javax.swing.DefaultCellEditor;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableModel;

/**
 *
 * @author dan
 */
public class AssignService extends javax.swing.JFrame {
    private String[] columnNames=new String[3];
    private Object[][] dataValues=new String[3][];
    JTable table = new JTable();
    JPanel pnlTable = new JPanel();
    JPanel pnlActions = new JPanel();
    JPanel pnlActivities = new JPanel();
    JButton btnCancel = new JButton("Cancel");
    JButton btnSave  = new JButton("Assign Service");
    JComboBox cmbPestType = new JComboBox();
    JScrollPane pane = new JScrollPane();
    myTableModel model;
     /**
     * Creates new form AssignService
     */
    public AssignService() {
        //initComponents();
        this.setLocationRelativeTo(null);
        setTitle("Assign Service to Technician");
        setSize(800,600);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        System.out.println("===Assign Service to Technician===");
        pnlTable.setLayout(new BorderLayout());
        
        columnNames = new String[] {"Service Request #","Customer Name","Address","PO#","Invoicing","Service Type","Payment Type","Schedule","Date","Select Technician" };
        dataValues=new Object[][] {};//{"","","","","","","","","","","Technician"},{"","","","","","","","","","","Technician"},{"","","","","","","","","","","Technician"},{"","","","","","","","","","","Technician"},{"","","","","","","","","","","Technician"},};
        
        myTableModel model=new myTableModel();
        table.setRowHeight(30);
        //table.setShowVerticalLines(true);
        table.setShowGrid(true);
        table.setAutoResizeMode(4);
        
        table.setModel((TableModel) model);
        //TableColumn colPestType=table.getColumnModel().getColumn(3);
        
        //colPestType.setCellEditor(new DefaultCellEditor(cmbPestType));
        table.setCellSelectionEnabled(true);
        
        ListSelectionModel cellSelectionModel = table.getSelectionModel();
        cellSelectionModel.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        
        pane.setSize(740,100);
        pnlTable.add(pane);
        pnlTable.setSize(800,400);
        
        table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
        TableColumnAdjuster tca = new TableColumnAdjuster(table);
        tca.adjustColumns();
        
        pane.setViewportView(table);
        
        pnlActions.setSize(800,100);
        pnlActions.setBounds(350,400,100,30);
        
        
        
        //fill the combobox
        //fillcombo();
        
        //pnlTable.add(pane);
        //pnlTable.setBounds(0,0,400,200);
        pnlActions.setLayout(new BorderLayout());
        pnlActions.add(btnCancel,BorderLayout.WEST);
        btnCancel.setBounds(50,0,100,30);
        //pnlActions.setBounds(200,0,400,200);
        pnlActivities.setLayout(new BorderLayout());
        pnlActivities.add(pnlTable,BorderLayout.NORTH);
        pnlActivities.add(pnlActions,BorderLayout.SOUTH);
        
        
        getContentPane().add(pnlActivities);
                
        setVisible(true);
        setResizable(false);
        /*
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
        */
        
        //table.addKeyListener(new KeyListener()); 
        btnCancel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelActionPerformed(evt);
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
    private void btnCancelActionPerformed(java.awt.event.ActionEvent evt) {
        System.out.println("btnCancelActionPerformed");
        MainMenu regFace = new MainMenu();
        regFace.setSize(700,800);
        regFace.setLocationRelativeTo(null);
        regFace.setResizable(false);
        dispose();
        regFace.setVisible(true);
    }
    public void fillcombo(){
        //fill the combobox
        
        try{
            //sqlStmt = "select * from Technicians";
            //tblName = "Business_Details";
            //rs = SQLConnection.getRecordSet(sqlStmt);
            //while (rs.next()){
                //get available pests
            //    cmbPestType.addItem((String) (rs.getString("PestsType")));               
            //}
            //cmbPestType.addActionListener(new ActionListener() {
            //    @Override
            //    public void actionPerformed(ActionEvent ae) {
                    //JOptionPane.showMessageDialog(null,cmbPestType.getSelectedItem());
            //        System.out.println("in the combo " + cmbPestType.getSelectedItem());
                    //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            //    }
            //});
        }
        catch (Exception ex){//(SQLException ex) {
            //Logger.getLogger(ServiceReceipt.class.getName()).log(Level.SEVERE, null, ex);
            //if (stmt != null) { stmt.close(); }
            System.out.println("error");      
        }
    }
    
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 950, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 575, Short.MAX_VALUE)
        );

        pack();
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
            java.util.logging.Logger.getLogger(AssignService.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(AssignService.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(AssignService.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(AssignService.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new AssignService().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
        
        
        
