/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Application;

/**
 *
 * @author dan
 */
import java.util.List;

import com.mycompany.propco_maven_new.Users;

public interface UserDAO {

  void insertUser(Users user);
  
  Users getUserById(int userID);
  
  Users getUser(String userName);
  
  List<Users> getUsers();
}