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


import com.mycompany.propco_maven_new.Users;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserDAOImpl implements UserDAO {

  @Autowired
  private SessionFactory sessionFactory;
  
  //@Override
  public void insertUser(Users user) {
    sessionFactory.getCurrentSession().save(user);
  }

  //@Override
  public Users getUserById(int userId) {
    return (Users) sessionFactory.
      getCurrentSession().
      get(Users.class, userId);
  }
  
  //@Override
  public Users getUser(String userName) {
    Query query = sessionFactory.
      getCurrentSession().
      createQuery("from User where username = :username");
    query.setParameter("username", userName);
    return (Users) query.list().get(0);
  }
  
  //@Override
  @SuppressWarnings("unchecked")
  public List<Users> getUsers() {
    Criteria criteria = sessionFactory.
      getCurrentSession().
      createCriteria(Users.class);
    return criteria.list();
  }

}
