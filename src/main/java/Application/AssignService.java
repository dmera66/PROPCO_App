/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Application;

import java.awt.BorderLayout;
import java.sql.SQLException;
import javax.swing.DefaultCellEditor;
import javax.swing.JComboBox;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
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
    JComboBox cmbPestType = new JComboBox();
    JScrollPane pane = new JScrollPane();
    myTableModel model;
     /**
     * Creates new form AssignService
     */
    public AssignService() {
        initComponents();
        setTitle("Assign Service to Technician");
        setSize(800,600);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        //initComponents();
        System.out.println("===Assign Service to Technician===");
        pnlTable.setLayout(new BorderLayout());
        
        columnNames = new String[] {"Service Request #","Customer Name","Address","PO#","Invoicing","Service Type","Payment Type","Schedule","Date","Select Technician" };
        dataValues=new Object[][] {{"","","","","","","","","","","Technician"},{"","","","","","","","","","","Technician"},{"","","","","","","","","","","Technician"},{"","","","","","","","","","","Technician"},{"","","","","","","","","","","Technician"},};
        
        myTableModel model=new myTableModel();
        table.setRowHeight(30);
        //table.setShowVerticalLines(true);
        table.setShowGrid(true);
        table.setAutoResizeMode(4);
        
        table.setModel((TableModel) model);
        TableColumn colPestType=table.getColumnModel().getColumn(3);
        
        colPestType.setCellEditor(new DefaultCellEditor(cmbPestType));
        table.setCellSelectionEnabled(true);
        
        ListSelectionModel cellSelectionModel = table.getSelectionModel();
        cellSelectionModel.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        pnlTable.add(pane);
        pnlTable.setSize(800,400);
        
        pnlCommands.setSize(800,100);
        pnlCommands.setBounds(350,400,100,30);
        
        table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
        TableColumnAdjuster tca = new TableColumnAdjuster(table);
        tca.adjustColumns();

        pane.setViewportView(table);
        //fill the combobox
        fillcombo();
        
        //pnlTable.add(pane);
        //pnlTable.setBounds(0,0,400,200);
        pnlCommands.setLayout(new BorderLayout());
        //pnlCommands.add(btnCancel,BorderLayout.WEST);
        //btnCancel.setBounds(50,0,100,30);
        //pnlActions.setBounds(200,0,400,200);
        //pnlActivities.setLayout(new BorderLayout());
        //pnlActivities.add(pnlTable,BorderLayout.NORTH);
        
        
        getContentPane().add(pnlTable);
                
        setVisible(true);
        setResizable(false);
        
    
        
        //table.addKeyListener(new KeyListener()); 
        btnCancel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelActionPerformed(evt);
            }
        });
        
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
    
    
    public class myTableModel extends AssignService{
        myTableModel(){
            //super(dataValues,columnNames);
        }
        public boolean isCellEditable(int row,int cols){return true;}
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        pnlTitle = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        pnlTable = new javax.swing.JPanel();
        pnlCommands = new javax.swing.JPanel();
        btnCancel = new javax.swing.JButton();
        btnSave = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Arial", 1, 24)); // NOI18N
        jLabel1.setText("Assign Service to Technician");
        jLabel1.setFocusable(false);
        jLabel1.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);

        javax.swing.GroupLayout pnlTitleLayout = new javax.swing.GroupLayout(pnlTitle);
        pnlTitle.setLayout(pnlTitleLayout);
        pnlTitleLayout.setHorizontalGroup(
            pnlTitleLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlTitleLayout.createSequentialGroup()
                .addGap(308, 308, 308)
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        pnlTitleLayout.setVerticalGroup(
            pnlTitleLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlTitleLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addContainerGap())
        );

        javax.swing.GroupLayout pnlTableLayout = new javax.swing.GroupLayout(pnlTable);
        pnlTable.setLayout(pnlTableLayout);
        pnlTableLayout.setHorizontalGroup(
            pnlTableLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 950, Short.MAX_VALUE)
        );
        pnlTableLayout.setVerticalGroup(
            pnlTableLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 463, Short.MAX_VALUE)
        );

        btnCancel.setText("Cancel");

        btnSave.setText("Save");

        javax.swing.GroupLayout pnlCommandsLayout = new javax.swing.GroupLayout(pnlCommands);
        pnlCommands.setLayout(pnlCommandsLayout);
        pnlCommandsLayout.setHorizontalGroup(
            pnlCommandsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlCommandsLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btnCancel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(btnSave)
                .addContainerGap())
        );
        pnlCommandsLayout.setVerticalGroup(
            pnlCommandsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, pnlCommandsLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(pnlCommandsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnCancel)
                    .addComponent(btnSave))
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(pnlTitle, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(pnlCommands, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(pnlTable, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(pnlTitle, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(pnlTable, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(pnlCommands, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
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
    private javax.swing.JButton btnCancel;
    private javax.swing.JButton btnSave;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel pnlCommands;
    private javax.swing.JPanel pnlTable;
    private javax.swing.JPanel pnlTitle;
    // End of variables declaration//GEN-END:variables
}
        
        
        
