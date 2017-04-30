
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Dan.Mera
 */

public class MainMenu extends javax.swing.JFrame {

    /**
     * Creates new form MainMenu
     */
    

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    /*
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        pnlOptions = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setMaximumSize(new java.awt.Dimension(700, 800));
        setMinimumSize(new java.awt.Dimension(700, 800));
        setPreferredSize(new java.awt.Dimension(700, 800));
        setResizable(false);

        pnlOptions.setPreferredSize(new java.awt.Dimension(700, 500));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Picture1.png"))); // NOI18N

        javax.swing.GroupLayout pnlOptionsLayout = new javax.swing.GroupLayout(pnlOptions);
        pnlOptions.setLayout(pnlOptionsLayout);
        pnlOptionsLayout.setHorizontalGroup(
            pnlOptionsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, pnlOptionsLayout.createSequentialGroup()
                .addContainerGap(370, Short.MAX_VALUE)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(88, 88, 88))
        );
        pnlOptionsLayout.setVerticalGroup(
            pnlOptionsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, pnlOptionsLayout.createSequentialGroup()
                .addContainerGap(217, Short.MAX_VALUE)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(93, 93, 93))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(pnlOptions, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(pnlOptions, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
    /*
    public static void main(String args[]) {
        //* Set the Nimbus look and feel 
        
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        */
        /* Create and display the form 
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainMenu().setVisible(true);
            }
        });
    }
    */
/*
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel pnlOptions;
    // End of variables declaration//GEN-END:variables
    */
    JPanel pnlOptions = new JPanel();
    JPanel pnlPage = new JPanel();
    JPanel pnlLogo = new JPanel();
    
public MainMenu() {
        ResultSet rs;
        //ResultSet rs_privileges;
        setTitle("MAIN MENU");
        setSize(600,820);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setVisible(true);
        setResizable(false);
        
	pnlOptions.setLayout(null);
        pnlLogo.setLayout(null);
        pnlPage.setLayout(null);
        
        JLabel lblLogo = new javax.swing.JLabel();
        lblLogo.setIcon(new javax.swing.ImageIcon(getClass().getResource("Picture1.png")));
	lblLogo.setBounds(25,200,400,400);
        pnlLogo.add(lblLogo);
	String sqlStmt = "select count(*) as num from Labels";
        try {
            ReportClick handler = new ReportClick();
            rs = SQLConnection.getRecordSet(sqlStmt);
            int nr_of_buttons = rs.getInt("num");
            System.out.println("nr of buttons " + nr_of_buttons);
            JButton [] btn = new JButton[nr_of_buttons];
            //now we retrieve the labels
            sqlStmt = "select * from Labels";
            rs = SQLConnection.getRecordSet(sqlStmt);
            //System.out.println("this row" + rs.getRow());
            for (int counter=0;counter < nr_of_buttons;counter++){
                btn[counter] = new JButton(rs.getString("Labels"));
                //System.out.println(counter + " " + rs.getString("Labels"));
                pnlOptions.add(btn[counter]);
                btn[counter].setEnabled(true);
                btn[counter].setBounds(20,20+110*(counter),250,80);
                btn[counter].addActionListener(handler);
                rs.next();
            }
            pnlOptions.setBounds(0,0,300,820);
            pnlLogo.setBounds(300,0,300,820);
            sqlStmt = "select full_privilege,Service_Receipt,Assign_Service_Tech,Pending_WO,Review_SR,Invoices,Reports from Users where user_name = '" + frmLogin.user_name + "'";
            rs = SQLConnection.getRecordSet(sqlStmt);
            //System.out.println("row " + rs.getInt(1));
            if (rs.getInt(1) == 0){ 
                for (int counter=0;counter<nr_of_buttons;counter++){
                    if (rs.getInt(counter+1) == 0){
                        btn[counter].setEnabled(false);        
                    }
                }
            }
        }
        catch(SQLException ex) {
            Logger.getLogger(ServiceReceipt.class.getName()).log(Level.SEVERE, null, ex);
            //if (stmt != null) { stmt.close(); }
            System.out.println("activity error"); 
            JOptionPane.showMessageDialog(null,"User does not exist.","",JOptionPane.ERROR_MESSAGE);
        }
            	
        pnlPage.add(pnlOptions);
        pnlPage.add(pnlLogo);
        pnlPage.setSize(700,820);
        getContentPane().add(pnlPage);
        
        }
   	class ReportClick implements ActionListener{
	   public void actionPerformed(ActionEvent event){
	      JButton btn = (JButton) event.getSource();
	      System.out.println(btn.getText());

	      switch (btn.getText()){
	      	case "Create Service Receipt":
                    ServiceReceipt srFace = new ServiceReceipt();
                    srFace.setSize(1200,840);
                    srFace.setLocationRelativeTo(null);
                    srFace.setResizable(false);
                    dispose();
                    srFace.setVisible(true);
                    System.out.println("Service Receipt");
                    break;
                    
	      	case "Assign Service to Technician":
                    AssignService asFace = new AssignService();
                    asFace.setSize(1280,720);
                    asFace.setLocationRelativeTo(null);
                    asFace.setResizable(false);
                    dispose();
                    asFace.setVisible(true);
                    System.out.println("Assign Service");
                    break;
                        
	      	case "Pending Work Orders":
                    PendingWO pwoFace = new PendingWO();
                    pwoFace.setSize(1280,720);
                    pwoFace.setLocationRelativeTo(null);
                    pwoFace.setResizable(false);
                    dispose();
                    pwoFace.setVisible(true);
                    break;
                                
	      	case "Review Service Receipts":
                    ReviewSR reviewsr = new ReviewSR();
                    reviewsr.setSize(1280,720);
                    reviewsr.setLocationRelativeTo(null);
                    reviewsr.setResizable(false);
                    dispose();
                    reviewsr.setVisible(true);
                    break;
                    /*
	      	case "Create Invoice":
                    CreateInvoice ciFace = new CreateInvoice();
                    ciFace.setSize(1280,720);
                    ciFace.setLocationRelativeTo(null);
                    ciFace.setResizable(false);
                    dispose();
                    ciFace.setVisible(true);
                    break;
	      	case "Reports":
                    Reports repFace = new Reports();
                    repFace.setSize(1280,720);
                    repFace.setLocationRelativeTo(null);
                    repFace.setResizable(false);
                    dispose();
                    repFace.setVisible(true);
                    break;*/
	      	default:
                    frmLogin logscreen = new frmLogin();
                    logscreen.setResizable(false);
                    logscreen.setSize(370,300);
                    logscreen.setLocationRelativeTo(null);
                    dispose();
                    //System.out.println("got in logout?");
                    logscreen.setVisible(true);
                    break;
	      }
	   }
        }
}