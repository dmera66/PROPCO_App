
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultCellEditor;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author dan
 */
public class CreateSRActivities extends JFrame {


    /**
     * Creates new form CreateSRActivities
     */
    
    ResultSet rs = null;
    Integer DupSR = 0;
    Integer crt_count = 1;
    String sqlStmt = "";
    Statement stmt ;
    String FollowupCnt = "";
    boolean PastDate = false;
    JTable table = new JTable();
    JComboBox cmbPestType = new JComboBox();
    JScrollPane pane = new JScrollPane();
    JPanel pnlTable = new JPanel();
    JPanel pnlMore = new JPanel();
    JPanel pnlActions = new JPanel();
    JPanel pnlActivities = new JPanel();
    JButton btnMore = new JButton("More Rows...");
    JButton btnCancel = new JButton("Cancel");
    JButton btnCompleteReq  = new JButton("Complete Request");    
    private String[] columnNames=new String[3];
    private Object[][] dataValues=new String[3][];
    JTextField textBox=new JTextField();
    myTableModel model;
    public String ServiceReqNr = null;
    
    public CreateSRActivities() {
        
        setTitle("Service Request Activities");
        setSize(800,600);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        //initComponents();
        System.out.println("===CreateSRActivities===");
        
        pnlTable.setLayout(new BorderLayout());
        
        columnNames = new String[] {"WO#","UNIT/AREA","Notes","PEST TYPE"};
        dataValues=new Object[][] {{"","","","Select PESTS"},{"","","","Select PESTS"},{"","","","Select PESTS"},{"","","","Select PESTS"},{"","","","Select PESTS"},};
        
        myTableModel model=new myTableModel();
        table.setRowHeight(30);
        //table.setShowVerticalLines(true);
        table.setShowGrid(true);
        table.setAutoResizeMode(4);
        
        table.setModel(model);
        TableColumn colWO=table.getColumnModel().getColumn(0);
        TableColumn colPestType=table.getColumnModel().getColumn(3);
        
        colWO.setCellEditor(new DefaultCellEditor(textBox));
        colPestType.setCellEditor(new DefaultCellEditor(cmbPestType));
        table.setCellSelectionEnabled(true);
        
        ListSelectionModel cellSelectionModel = table.getSelectionModel();
        cellSelectionModel.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

        cellSelectionModel.addListSelectionListener(new ListSelectionListener() {
            public void valueChanged(ListSelectionEvent e) {
                String selectedData = null;
                String collectData = "";
                
                int[] selectedRow = table.getSelectedRows();
                int[] selectedColumns = table.getSelectedColumns();

                for (int i = 0; i < selectedRow.length; i++) {
                    for (int j = 0; j < selectedColumns.length; j++) {
                        //if (j>0){
                        //    selectedData = (String) table.getValueAt(selectedRow[i], selectedColumns[j-1]);
                        //}
                        //else{
                            selectedData = (String) table.getValueAt(selectedRow[i], selectedColumns[j]);
                            if (i>0){
                                if (collectData.isEmpty()){
                                    System.out.println("collectData.isEmpty");
                                    collectData = (String) table.getValueAt(selectedRow[i-1], selectedColumns[j]) + ";";
                                }
                                else{
                                    System.out.println("collectData.isNOTEmpty");
                                    collectData = collectData + (String) table.getValueAt(selectedRow[i-1], selectedColumns[j]) + ";";
                                }
                            }
                        //}
                    }
                }
                System.out.println("Selected: " + selectedData);
                System.out.println("Collected: " + collectData);
            }

        });
        
        /*
        public void changeSelection(    int row, int column, boolean toggle, boolean extend){
            super.changeSelection(row, column, toggle, extend);
 
            if (editCellAt(row, column)){
                Component editor = getEditorComponent();
                editor.requestFocusInWindow();
            }
        }
        */
        
        pnlTable.add(pane);
        pnlTable.setSize(800,400);
        
        pnlMore.add(btnMore);
        pnlMore.setSize(800,100);
        btnMore.setBounds(350,400,100,30);
        
        table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
        TableColumnAdjuster tca = new TableColumnAdjuster(table);
        tca.adjustColumns();

        textBox.addKeyListener(new KeyAdapter(){
            public void keyTyped(KeyEvent e){
                System.out.println("keyTyped");
                if(!Character.isDigit(e.getKeyChar()) && e.getKeyChar() !=KeyEvent.VK_BACK_SPACE){
                    //if(e.getKeyChar() == KeyEvent.VK_TAB  || e.getKeyChar() == KeyEvent.VK_ENTER ){
                    System.out.println("keyTyped if");
                    //checkduplicate();
                    textBox.setEditable(false);
                    textBox.setBackground(Color.RED);
                    //JOptionPane.showMessageDialog(null,"String Type Entry Not Allowed");
                }
                else{
                    System.out.println("keyTyped else");
                    textBox.setEditable(true);
                }
            }
        });
        
        
        //table.getColumnModel().getColumn(0).setCellRenderer(new ErrorCellRenderer());
        
        table.addMouseListener(new java.awt.event.MouseAdapter(){
            public void mouseClicked(java.awt.event.MouseEvent e){
                //System.out.println("mouseClicked");
            }
        });
        
        //fill the combobox
        fillcombo();
        
        //table.getColumnModel().getColumn(0).setPreferredWidth(25);
        //table.getColumnModel().getColumn(1).setPreferredWidth(40);
        //table.getColumnModel().getColumn(2).setPreferredWidth(50);
        
        //table.getSelectionModel().addListSelectionListener(new MyListener());
        
        
        pane.setViewportView(table);
        
        //pnlTable.add(pane);
        //pnlTable.setBounds(0,0,400,200);
        pnlActions.setLayout(new BorderLayout());
        pnlActions.add(btnCancel,BorderLayout.WEST);
        btnCancel.setBounds(50,0,100,30);
        btnCompleteReq.setBounds(250,0,100,30);
        pnlActions.add(btnCompleteReq,BorderLayout.EAST);
        //pnlActions.setBounds(200,0,400,200);
        pnlActivities.setLayout(new BorderLayout());
        pnlActivities.add(pnlTable,BorderLayout.NORTH);
        pnlActivities.add(pnlMore,BorderLayout.CENTER);
        pnlActivities.add(pnlActions,BorderLayout.SOUTH);
        
        getContentPane().add(pnlActivities);
                
        setVisible(true);
        setResizable(false);
        
        
        table.addMouseListener(new MouseAdapter(){
            public void mouseClicked(MouseEvent e){
                //System.out.println("mouse event");
            }
        });
        
        btnMore.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Vector rowData = null;
                //model.addRow(new Object[][] {{"","","","Choose"},});
                model.addRow(rowData);
                table.validate();
            }
        });
        
        //table.addKeyListener(new KeyListener()); 
        btnCancel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelActionPerformed(evt);
            }
        });
        
        btnCompleteReq.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCompleteReqActionPerformed(evt);
            }
        });
        //System.out.println("finished module");   
        
    }
    public class myTableModel extends DefaultTableModel{
        myTableModel(){
            super(dataValues,columnNames);
        }
        public boolean isCellEditable(int row,int cols){return true;}
    }

    public void fillcombo(){
        //fill the combobox
        
        try{
            sqlStmt = "select * from Pests ";
            //tblName = "Business_Details";
            rs = SQLConnection.getRecordSet(sqlStmt);
            while (rs.next()){
                //get available pests
                cmbPestType.addItem((String) (rs.getString("PestsType")));               
            }
            cmbPestType.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent ae) {
                    //JOptionPane.showMessageDialog(null,cmbPestType.getSelectedItem());
                    System.out.println("in the combo " + cmbPestType.getSelectedItem());
                    //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }
            });
        }
        catch (SQLException ex) {
            Logger.getLogger(ServiceReceipt.class.getName()).log(Level.SEVERE, null, ex);
            //if (stmt != null) { stmt.close(); }
            System.out.println("error");      
        }
    }
    /*
    private static class MyListener implements ListSelectionListener {

    @Override
    public void valueChanged(ListSelectionEvent e) {
        //TableModel model = CreateSRActivities.table.getModel();
        //System.out.println("value of cell is: " + model.getValueAt(0, 0));
        System.out.println("mylistener " + e.getFirstIndex());
    }
}*/
    
    
    private void btnCompleteReqActionPerformed(java.awt.event.ActionEvent evt) {
        //save all table records in the db
        //Object[][] activities = null;
        int rows_count = 0;
        //if(! Unit.isEmpty())        
        rows_count = table.getRowCount();
        int PestsID = 0;
        ServiceRequest new_SR = new ServiceRequest();
        int user_id = new_SR.getuser_id();
        //activities = new Object [rows_count][10];
        Integer ActivityNr = 0;
        for(int row = 0; row<rows_count; row++){
            if (table.getValueAt(row, 1) != null){
                //reslove if value is not null - is it empty?
                ActivityNr = ActivityNr + 1;
                //String col0 = (String)avoid_null(table.getValueAt(row,0));
                String col0 = table.getValueAt(row,0).toString();
                String col1 = table.getValueAt(row,1).toString();
                String col2 = table.getValueAt(row,2).toString();
                //String col3 = (String)avoid_null(table.getValueAt(row,3));
                String return_field = "PestsID"; 
                
                String sqlStmt = "Select " + return_field + " from Pests WHERE PestsType = '" + table.getValueAt(row, 3) + "'";
                if (table.getValueAt(row, 3)!=null){ PestsID = SQLConnection.return_int_value(sqlStmt,return_field);}
                System.out.println("PESTSID:"+ PestsID);
                System.out.println("USERID:" + user_id);
                System.out.println("ServReqNr:" + new_SR.getServReqNr()+ ActivityNr + col0 + col1+col2+PestsID+new_SR.getuser_id());
                int userid = new_SR.getuser_id();
                Activities new_activity = new Activities(ActivityNr,col0,col1,col2,PestsID,"I",DateUtils.now_date_time(),DateUtils.now_date_time(),userid);
                System.out.println("Activity is:" + new_activity.getID());
                /*
                activities[row][0] = ServiceReqNr;
                ActivityNr = ActivityNr + 1;
                System.out.println("ActNr:" + ActivityNr);
                activities[row][1] = ActivityNr.toString();
                activities[row][2] = (String)avoid_null(table.getValueAt(row,0));
                activities[row][3] = (String)avoid_null(table.getValueAt(row, 1));
                activities[row][4] = (String)avoid_null(table.getValueAt(row, 2));
                String return_field = "PestsID"; 
                String sqlStmt = "Select " + return_field + " from Pests WHERE PestsType = '" + (String)avoid_null(table.getValueAt(row, 3)) + "'";
                PestsID = SQLConnection.return_value(sqlStmt,return_field);
                System.out.println("PestsID=" + PestsID);

                activities[row][5] = PestsID.toString();
                activities[row][6] = "I";
                activities[row][7] = DateUtils.now_date_time();
                activities[row][8] = DateUtils.now_date_time();
                //activities[row][9] = frmLogin.user_id.toString();        
                activities[row][9] = user_id;
                */
        }
        }
        FollowupDlg followup_dlg = new FollowupDlg();
        followup_dlg.init();
        followup_dlg.dispose();
        dispose();
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
            .addGap(0, 408, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 563, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    public class FollowupDlg extends JFrame implements ActionListener{
        JLabel lblQuestion = new JLabel("Choose how many follow-ups services to create?");
        JTextField txtFollowupCount = new JTextField("0");
        JComboBox cmbFollowup = new JComboBox();
        JPanel AskPanel = new JPanel();
        JButton BtnCancel = new JButton("Cancel");
        JButton BtnOK = new JButton("OK");
        int crt_count = 0;
        int Count = 0;
        private JDialog Dlg = new JDialog((ServiceReceipt) null,"Input",true);
        
        public int getCount(){
            return Count;
        }
        public void setCount(int crt_count) {
            Count = crt_count;
        }
        
        public void init()
        {
            Container DlgCntnr = Dlg.getContentPane();
            cmbFollowup.setMaximumRowCount(10);
            cmbFollowup.setModel(new javax.swing.DefaultComboBoxModel<>(new Integer[] { 1, 2, 3, 4, 5, 6, 7, 8, 9 }));
            DlgCntnr.setLayout(new FlowLayout());
            DlgCntnr.add(lblQuestion);
            //DlgCntnr.add(txtFollowupCount);
            DlgCntnr.add(cmbFollowup);
            
            AskPanel.add(BtnCancel);
            AskPanel.add(BtnOK);
            DlgCntnr.add(AskPanel);
            
            BtnCancel.addActionListener(this);
            BtnOK.addActionListener(this);
            //cmbFollowup.addActionListener(this);
            //Dlg.setBounds(220, 160, 220, 170);
            Dlg.setSize(330, 100);
            Dlg.setLocationRelativeTo(null);
            Dlg.show();
        }
        public void dispose()
        {
            Dlg.dispose();
        }
        public void actionPerformed(ActionEvent e1)
            {
            if(e1.getSource() == BtnOK){
                //Dlg.setSize(250, 170);
                //check if value is numeric
                FollowupCnt = cmbFollowup.getSelectedItem().toString() ;
                //FollowupCnt.intValue(txtFollowupCount getText());
                //System.out.println("actioned performed followup count = " + FollowupCnt);

                crt_count=1;
                //System.out.println("PastDate outside of loop" + PastDate);
                do
                    //for(int count=1;count<=Integer.parseInt(FollowupCnt);count++){
                    {    
                    FollowupDatesDlg follow_dates = new FollowupDatesDlg();
                    PastDate=false;
                    follow_dates.init();
                    //System.out.println("PastDate in loop after init " + PastDate);
                    //check if the date was in the future and reset counter if not
                    if(PastDate==true) {
                        //System.out.println("in here??");
                        crt_count=crt_count-1;
                    }
                    crt_count++;
                    follow_dates.dispose();
                    //System.out.println("followup counter is: " + crt_count);

                    Dlg.dispose();
                }
                while (crt_count<=Integer.parseInt(FollowupCnt));
            }            
            else if(e1.getSource() == BtnCancel){
                //save the records now in here!!!
                Dlg.dispose();
                MainMenu regFace = new MainMenu();
                regFace.setSize(700,800);
                regFace.setLocationRelativeTo(null);
                regFace.setResizable(false);
                dispose();
                regFace.setVisible(true);
            }
         }
    }
    
    public class FollowupDatesDlg extends JFrame implements ActionListener{
        FollowupDlg new_dlg = new FollowupDlg();
        int my_val = new_dlg.Count;
        
        
        //System.out.println("date is: " + calFollowup.getCalendar().toString());
        //System.out.println("count is " + my_val);
        
        //create a list of numerals and get the numeral according to the number in FollowupCnt
        String[] arr = {"first", "second", "third", "fourth","fifth","sixth","seventh","eighth","ninth","tenth"};
        //System.out.println("count is " + my_val);
        JLabel lblQuestion = new JLabel("Please select the date for the " + arr[my_val] +" follow-up");
        com.toedter.calendar.JCalendar calFollowup = new com.toedter.calendar.JCalendar();
        
        JPanel AskPanel = new JPanel();
        //JButton BtnCancel = new JButton("Cancel");
        JButton BtnOK = new JButton("OK");
                
        private JDialog Dlg = new JDialog((ServiceReceipt) null,"Input",true);
        
        
        public void init()
        {
            Container DlgCntnr = Dlg.getContentPane();
            DlgCntnr.setLayout(new FlowLayout());
            DlgCntnr.add(lblQuestion);
            DlgCntnr.add(calFollowup);
                        
            //AskPanel.add(BtnCancel);
            AskPanel.add(BtnOK);
            DlgCntnr.add(AskPanel);
            
            //BtnCancel.addActionListener(this);
            BtnOK.addActionListener(this);
            Dlg.setSize(410, 300);
            Dlg.setLocationRelativeTo(null);
            Dlg.show();
        }
        public void dispose()
        {
            Dlg.dispose();
        }
        public void actionPerformed(ActionEvent e1)
            {
                String Table_Fields = "";
                String stmt_Values = "";
                if(e1.getSource() == BtnOK){
                    //Dlg.setSize(250, 170);
                    //check if value is numeric
                    //FollowupCnt.intValue(txtFollowupCount getText());
                    System.out.println("followup count 1 = " + FollowupCnt);
                    //calFollowup.setSelectableDateRange(calFollowup.getTodayButtonText() , calFollowup.getMaxSelectableDate() );
                    //System.out.println("date is: " + calFollowup.getCalendar().toString());
                    //date1.before(date2) 
                    Calendar cal = Calendar.getInstance();
                    if (calFollowup.getCalendar().before(Calendar.getInstance())){
                        JOptionPane.showMessageDialog(null,"You cannot select a date in the past","Wrong Date!",JOptionPane.ERROR_MESSAGE);
                        //reset the counter
                        PastDate=true;
                    }
                    else{
                        PastDate=false;
                        //we create the servicerequest and fill info in the Service_Request table
                        Table_Fields = "(CID,BID,BundleName,PONr,Invoicing,ServiceType,PaymentType,Schedule,ServiceDate,CreationDate,UpdateDate,User_id,ActivityCount)";
                        stmt_Values = "(?,?,?,?,?,?,?,?,?,?,?,?,?)";
                        
                        create_service_request(Table_Fields,stmt_Values);
                        
                        ServiceRequest create_SR = new ServiceRequest();
                        String return_field = "ServiceReqNr"; 
                        //String sqlStmt = "Select " + return_field + " from Service_Request WHERE User_id='" + frmLogin.user_id + "' AND ActivityCount = 0";
                        String sqlStmt = "Select " + return_field + " from Service_Request WHERE UID='" + create_SR.getuser_id() + "' AND ActivityCount = 0";
                        ServiceReqNr = SQLConnection.return_value(sqlStmt,return_field);
                        //ServiceRequest new_SR = new ServiceRequest(Integer.getInteger(ServiceReqNr),0,0);
                        //System.out.println("Service_req is: " + new_SR.ServReqNr);
                        System.out.println("date/time selected is: " + calFollowup.getCalendar().getTime().toString());
                        //System.out.println("date/time now is: "  + Calendar.getInstance());
                        Table_Fields = "(ServiceReqNr,ActivityNr,WONr,Unit,Notes,PestsID,ActivityStatus,CreationDate,UpdateDate,User_id)";
                        stmt_Values = "(?,?,?,?,?,?,?,?,?,?)";
                        insert_activities(Table_Fields,stmt_Values);
                    }
                    //if(todayDate.after(historyDate) && todayDate.before(futureDate)) {
                        // In between
                    //}
                    System.out.println("date/time is: " + calFollowup.getCalendar().getTime().toString());
                    System.out.println("PastDate in action performed" + PastDate);
                    //save activity in the db
                    Dlg.dispose();
                    }
                /*
                else if(e1.getSource() == BtnCancel){
                        //needs to save and then get you to main
                        Dlg.dispose();
                    } */
         }
    }
    
    public static void main(String args[]){
           CreateSRActivities SRActivities = new CreateSRActivities();
           SRActivities.setVisible(true);
    }
    /*
    public class ErrorCellRenderer extends DefaultTableCellRenderer {

    private static final long serialVersionUID = 1L;

    public Component getTableCellRendererComponent(JTable table, Object value,
            boolean isSelected, boolean hasFocus, int row, int column) {
        Component component = super.getTableCellRendererComponent(table, value, isSelected, hasFocus,
                row, column);

        //System.out.println("getTableCellRendererComponent" + value.toString() + ";");
        if(!value.toString().isEmpty() && checkduplicate(value.toString())){
            //if(value.toString().contains("@") || value.toString().contains("$") || value.toString().contains("#")) {
            component.setBackground(Color.RED);
        } else {
            component.setBackground(Color.WHITE);
        }

        return component;
    }
*/
    public boolean checkduplicate(String cell_value) {
            boolean dup_count = false;
            System.out.println("checkduplicate");
            if (Integer.parseInt(ServiceReceipt.BID) >0){
                String sqlStmt = "Select count(*) as num, a.ServiceReqNr as ServiceReq from Service_Request a, Service_Request_Activities b " 
                               + "where b.WONr = '" + cell_value 
                               + "' and a.ServiceReqNr = b.ServiceReqNr and b.BID = '" + Integer.parseInt(ServiceReceipt.BID) + "'";
                
                try{
                    rs = SQLConnection.getRecordSet(sqlStmt);
                    System.out.println("checkduplicate" + rs.getInt("num"));
                    if (rs.getInt("num") != 0){
                        DupSR = rs.getInt("ServiceReq");
                        WODuplicateDlg WODup = new WODuplicateDlg();
                        WODup.init();
                        WODup.dispose();
                        dup_count = true; 
                    }
                }
                catch (SQLException ex) {
                    Logger.getLogger(ServiceReceipt.class.getName()).log(Level.SEVERE, null, ex);
                    //if (stmt != null) { stmt.close(); }
                    System.out.println("error");      
                }
            }
        return dup_count;
    }
    public class WODuplicateDlg extends JFrame implements ActionListener{
        //JLabel Lbl = new JLabel("Please input the number of followup SR's to create?");
        JLabel lblQuestion = new JLabel("This WO# was used previously in SR# ");
        JTextField txtSRNr = new JTextField("0");
        //JComboBox cmbFollowup = new JComboBox();
        JPanel AskPanel = new JPanel();
        //JButton BtnClear = new JButton("Clear");
        JButton BtnOK = new JButton("OK");
                
        private JDialog Dlg = new JDialog((ServiceReceipt) null,"Input",true);
        
        
        public void init()
        {
            Container DlgCntnr = Dlg.getContentPane();
            //cmbFollowup.setMaximumRowCount(10);
            //cmbFollowup.setModel(new javax.swing.DefaultComboBoxModel<>(new Integer[] { 1, 2, 3, 4, 5, 6, 7, 8, 9 }));
            DlgCntnr.setLayout(new FlowLayout());
            DlgCntnr.add(lblQuestion);
            DlgCntnr.add(txtSRNr);
            //DlgCntnr.add(cmbFollowup);
            
            //AskPanel.add(BtnClear);
            AskPanel.add(BtnOK);
            DlgCntnr.add(AskPanel);
            
            //BtnClear.addActionListener(this);
            BtnOK.addActionListener(this);
            //cmbFollowup.addActionListener(this);
            //Dlg.setBounds(220, 160, 220, 170);
            Dlg.setSize(330, 100);
            Dlg.setLocationRelativeTo(null);
            Dlg.show();
        }
        public void dispose()
        {
            Dlg.dispose();
        }
        public void actionPerformed(ActionEvent e1)
            {
                if(e1.getSource() == BtnOK){
                    //Dlg.setSize(250, 170);
                    //check if value is numeric
                    //FollowupCnt = cmbFollowup.getSelectedItem().toString() ;
                    //FollowupCnt.intValue(txtFollowupCount getText());
                    System.out.println("SR# = " + DupSR);
                    Dlg.dispose();
                    }
                //else if(e1.getSource() == BtnClear){
                    //clear the field
                    //ServiceReceiptP2.txtWO1.setText(TOOL_TIP_TEXT_KEY);
                //    Dlg.dispose();
                 //   }
         }
    }
    
    public void create_service_request(String Table_Fields, String stmt_Values){
        String sqlStmt = "";
        sqlStmt = "INSERT INTO Service_Request " + Table_Fields + " VALUES " + stmt_Values + ";";
        System.out.println(sqlStmt);
        try{
            PreparedStatement stmt = SQLConnection.conn.prepareStatement(sqlStmt);
            
            
            ServiceRequest new_service = new ServiceRequest();
            stmt.setInt(1,new_service.getCustID());
            stmt.setInt(2,new_service.getBusinessID());
            stmt.setString(3,new_service.getBundleName());
            stmt.setString(4,new_service.getPO());
            stmt.setString(5,new_service.getFreq());
            stmt.setString(6,new_service.getServiceType());
            stmt.setString(7,new_service.getPayment());
            stmt.setString(8,new_service.getDaySched());
            stmt.setString(9,new_service.getCalendarDate());
            stmt.setString(10,new_service.getCreationDate());
            stmt.setString(11,new_service.getUpdateDate());
            stmt.setInt(12,new_service.getuser_id());
            stmt.setInt(13,0);

            System.out.println("CustID:" +  new_service.getCustID() 
                    + ";BusinessID:" + new_service.getBusinessID()
                    + ";BundleName:" + new_service.getBundleName()
                    + ";PO:" + new_service.getPO()  + ";Freq:" + new_service.getFreq()
                    + ";ServiceType:" + new_service.getServiceType()
                    + ";Payment:" + new_service.getPayment()
                    + ";DaySched:" + new_service.getDaySched()
                    + ";Calendar:" + new_service.getCalendarDate()
                    + ";CreationDate:" + new_service.getCreationDate()
                    + ";UpdateDate:" + new_service.getUpdateDate()
                    + ";user_id:" + new_service.getuser_id()
                    + ";count:0");

            //stmt.executeUpdate();   
    }
    catch(Exception e){
        JOptionPane.showMessageDialog(this,e.getMessage());
    }
                    
    }
            
    //private Object makeObj(final String item)  {
    //        return new Object() { public String toString() { return item; } };
    //    }
    
    public Object avoid_null(Object field_value){
        //String my_string;
        //my_string = (field_value == null) ? "": field_value.toString();
        return (field_value == null) ? "": field_value;//.toString();
        //return my_string;
    }
    
    public void insert_activities(String Table_Fields, String stmt_Values){
        //Activities new_activity = new Activities();
        System.out.println("nr of activities" + Activities.numberOfActivities());
        try{
            int rows_count = table.getRowCount();
            sqlStmt = "INSERT INTO Service_Request_activity " + Table_Fields + " VALUES " + stmt_Values + ";";
            System.out.println(sqlStmt);
            PreparedStatement stmt = SQLConnection.conn.prepareStatement(sqlStmt);
            //stmt.setInt(1,
            //stmt.setInt(2,ActivityNr);
            //stmt.setString(3, WONr);
            //stmt.setString(4, Unit);
            //stmt.setString(5, Notes);
            //String sqlStmt1 = "Select PestsID from Pests WHERE PestsType = '" + PestType + "'";
            //rs = SQLConnection.getRecordSet(sqlStmt1);
            //Integer PestsID = rs.getInt("PestsID");
            //System.out.println("PestsID=" + PestsID);
            //stmt.setInt(6, PestsID);
            //stmt.setString(7,"I");//I-Initial,S-Sent,R-Received,C-completed,X-Cancelled
            //stmt.setString(8,DateUtils.now_date_time());
            //stmt.setString(9,DateUtils.now_date_time());
            //stmt.setInt(10,frmLogin.user_id);

            //stmt.addBatch();
                    
            //Activities a = new Activities() 
            /*
            for(int row = 0; row<rows_count; row++)
            {
                Integer ActivityNr = row+1;
                /*
                String WONr = (String)table.getValueAt(row, 0);
                String Unit = (String)table.getValueAt(row, 1);
                String Notes = (String)table.getValueAt(row, 2);
                String PestType = (String)table.getValueAt(row, 3);
                
                String WONr = (String)avoid_null(table.getValueAt(row,0));
                String Unit = (String)avoid_null(table.getValueAt(row, 1));
                String Notes = (String)avoid_null(table.getValueAt(row,3));
                String PestType = (String)avoid_null(table.getValueAt(row,4));
                System.out.println("WONr:"+ WONr + ";Unit:" + Unit + ";Notes:" + Notes + ";PestType:" + PestType);
                
                /*        
                if(! Unit.isEmpty()){
                    stmt.setInt(1,Integer.parseInt(ServiceReceipt.ServiceReqNr));
                    stmt.setInt(2,ActivityNr);
                    stmt.setString(3, WONr);
                    stmt.setString(4, Unit);
                    stmt.setString(5, Notes);
                    String sqlStmt1 = "Select PestsID from Pests WHERE PestsType = '" + PestType + "'";
                    rs = SQLConnection.getRecordSet(sqlStmt1);
                    Integer PestsID = rs.getInt("PestsID");
                    System.out.println("PestsID=" + PestsID);
                    stmt.setInt(6, PestsID);
                    stmt.setString(7,"I");//I-Initial,S-Sent,R-Received,C-completed,X-Cancelled
                    stmt.setString(8,DateUtils.now_date_time());
                    stmt.setString(9,DateUtils.now_date_time());
                    stmt.setInt(10,frmLogin.user_id);
                    
                    stmt.addBatch();
                }*/
            //}
            //stmt.executeBatch();
            //SQLConnection.conn.commit();
            //Update ActivityCount in ServiceRequest table
            
        }
        catch(Exception e){
            //error here!!!
            //JOptionPane.showMessageDialog(this,e.getMessage());
        }                                                
   }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}

