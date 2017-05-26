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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Application.UserDAO;
import com.mycompany.propco_maven_new.Users;
import Application.UserManager;

@Service
public class UserManagerImpl implements UserManager {

  @Autowired
  private UserDAO userDAO;
  
  @Transactional
  public void insertUser(Users user) {
    userDAO.insertUser(user);
  }

  @Transactional
  public Users getUserById(int userId) {
    return userDAO.getUserById(userId);
  }
  
  @Transactional
  public Users getUser(String userName) {
    return userDAO.getUser(userName);
  }

  @Transactional
  public List<Users> getUsers() {
    return userDAO.getUsers();
  }

}
