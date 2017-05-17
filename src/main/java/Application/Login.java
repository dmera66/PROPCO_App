package Application;


import com.mycompany.propco_maven_new.Users;
import java.awt.event.KeyEvent;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import propco_maven_new.HibernateUtil;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Dan.Mera
 */
public class Login extends javax.swing.JFrame {


    //public static List<ArrayList<String>> my_array;
    //public static String user_name;
    //public static Integer user_id;
    public static Integer user_id;
    String puname = null;
    private static String QUERY_BASED_ON_USERNAME="from Users where username ='";
    private static String QUERY_BASED_ON_PASSWORD="from Users where password ='";
   
    /**
     * Creates new form PROPCO_UI
     */
    public Login() {
        initComponents();
        place_form();
        //SQLConnection.establishConnection();
    }

    private void runQueryBasedOnUserName(){
        executeHQLQuery(QUERY_BASED_ON_USERNAME + txtUserName.getText() + "'");
    }
    
    private void runQueryBasedOnPassword(){
        executeHQLQuery(QUERY_BASED_ON_PASSWORD + txtPassword.getText() + "'");
    }
    
    private void executeHQLQuery(String query){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Query q = session.createQuery(query);
            List resultList = q.list();
            returnResult(resultList);
            tx.commit();
        }
        catch (HibernateException he){
            if (tx!=null) tx.rollback();
            he.printStackTrace();
        }
        finally{
            session.close();
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

        txtUserName = new javax.swing.JTextField();
        btnLogin = new javax.swing.JButton();
        txtPassword = new javax.swing.JPasswordField();
        lblLogo = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Login Authentication");
        setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        setName("frmLogin"); // NOI18N
        setResizable(false);

        txtUserName.setFont(new java.awt.Font("Arial", 0, 11)); // NOI18N
        txtUserName.setText("Username");
        txtUserName.setToolTipText("Enter your Username");
        txtUserName.setNextFocusableComponent(txtPassword);
        txtUserName.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtUserNameFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txtUserNameFocusLost(evt);
            }
        });

        btnLogin.setInheritsPopupMenu(true);
        btnLogin.setLabel("Login");
        btnLogin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLoginActionPerformed(evt);
            }
        });

        txtPassword.setFont(new java.awt.Font("Arial", 0, 11)); // NOI18N
        txtPassword.setText("Password");
        txtPassword.setToolTipText("Enter your Password");
        txtPassword.setName(""); // NOI18N
        txtPassword.setNextFocusableComponent(btnLogin);
        txtPassword.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtPasswordFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txtPasswordFocusLost(evt);
            }
        });
        txtPassword.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txtPasswordKeyPressed(evt);
            }
        });

        lblLogo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Application/Picture1.png"))); // NOI18N

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(87, 87, 87)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.CENTER)
                    .addComponent(lblLogo, javax.swing.GroupLayout.PREFERRED_SIZE, 229, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtUserName, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtPassword, javax.swing.GroupLayout.PREFERRED_SIZE, 104, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnLogin, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(109, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(105, Short.MAX_VALUE)
                .addComponent(lblLogo, javax.swing.GroupLayout.PREFERRED_SIZE, 110, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(27, 27, 27)
                .addComponent(txtUserName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(txtPassword, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btnLogin)
                .addGap(35, 35, 35))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
    private void place_form() {
        this.setLocationRelativeTo(null);
    }
    private void btnLoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLoginActionPerformed
        System.out.println("action listener");
        puname = txtUserName.getText(); 
        runQueryBasedOnUserName();
    }//GEN-LAST:event_btnLoginActionPerformed

    private void returnResult(List resultList){
        if (resultList.isEmpty()){
            JOptionPane.showMessageDialog(null,"User does not exist.","",JOptionPane.ERROR_MESSAGE);
            txtUserName.requestFocus();
            txtUserName.setText("");
        }
        //List resultList = session.createQuery("FROM Employee").list(); 
         for (Iterator iterator = resultList.iterator(); iterator.hasNext();){
            Users user = (Users) iterator.next(); 
            
        //for(Object obj : resultList){
            //Users new_user = (Users)obj;
            user_id = user.getUserId();
            String user_name = user.getUserName();
            char[] ppaswd = txtPassword.getPassword();
            char[] dbpassArray = user.getPassword().toCharArray();
            
            if(Arrays.equals(dbpassArray,ppaswd)){
                    MainMenu regFace = new MainMenu();
                    regFace.setSize(700,800);
                    regFace.setLocationRelativeTo(null);
                    regFace.setResizable(false);
                    dispose();
                    regFace.setVisible(true);
                } 
                else{
                    JOptionPane.showMessageDialog(null,"The password is incorrect.","",JOptionPane.ERROR_MESSAGE);
                    txtPassword.requestFocus();
                    txtPassword.setText("");
                }
            
        }
    }
    private void txtUserNameFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtUserNameFocusLost
        if (txtUserName.getText().trim().equals("")){
            txtUserName.setText("Username");
	} 
    }//GEN-LAST:event_txtUserNameFocusLost

    private void txtUserNameFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtUserNameFocusGained
        if(txtUserName.getText().trim().equals("Username")){
            txtUserName.setText("Username");
            txtUserName.selectAll();
	} 
    }//GEN-LAST:event_txtUserNameFocusGained

    private void txtPasswordFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtPasswordFocusGained
        txtPassword.selectAll();
    }//GEN-LAST:event_txtPasswordFocusGained

    private void txtPasswordFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtPasswordFocusLost
        if (txtPassword.getPassword().equals("")) {
            txtPassword.setText("Password");
	}
    }//GEN-LAST:event_txtPasswordFocusLost

    private void txtPasswordKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtPasswordKeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            //System.out.println("key pressed");
            puname = txtUserName.getText(); 
            runQueryBasedOnUserName();
        }
    }//GEN-LAST:event_txtPasswordKeyPressed
    
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
                new Login().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnLogin;
    private javax.swing.JLabel lblLogo;
    private javax.swing.JPasswordField txtPassword;
    private javax.swing.JTextField txtUserName;
    // End of variables declaration//GEN-END:variables
}