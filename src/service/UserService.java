package service;

import dao.UserDao;
import domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class UserService {
    private UserDao uDao = new UserDao();
    public boolean register(User user) {
//  ________________________________________________________________________ 1.  注册操作--判断用户名和email,手机号是否已存在
        try {
            if(uDao.isUsernameExist(user.getUsername())) {

                return false;
            }
            if(uDao.isEmailExist(user.getEmail())) {
                return false;
            }
            if(uDao.isPhoneExist(user.getPhone())) {
                return false;
            }
            uDao.addUser(user);
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }
//    __________________________________________________________________________      2.登陆
    public User login(String ue,String password) {
        User user=null;
        try {
            user = uDao.selectByUsernamePassword(ue, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if(user!=null) {
            return user;
        }
        try {
            user=uDao.selectByEmailPassword(ue, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if(user!=null) {
            return user;
        }
        return null;
    }
    //    6.查询所有用户
    public List<User> selectAllUsers() {
        List<User> users=null;
        try {
           users = uDao.selectAllUsers();
        } catch (SQLException e) {
            e.printStackTrace();
        }
      return  users;

    }
//    通过id查询用户
      public  User selectUserById(int id){
        User user=null;
          try {
             user= uDao.selectUserById(id);
          } catch (SQLException e) {
              e.printStackTrace();
          }
          return user;
      }
//      通过id删除用户
public  void deleteUserById(int id){
    try {
        uDao.deleteUserById(id);
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    //    查询用户
    public  List<User>  getAllSearchUsers(String keyWord){
        List<User> user=null;
        try {
            user= uDao.getAllSearchUsers(keyWord);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    //修改用户信息
    public boolean update(User u){
        try {
            if(uDao.isUsername1Exist(u.getUsername(),u.getId())) {

                return false;
            }
            if(uDao.isEmail1Exist(u.getEmail(),u.getId())) {
                return false;
            }
            if(uDao.isPhone1Exist(u.getPhone(),u.getId())) {
                return false;
            }
            uDao.update(u);

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
