package dao;

import domain.Goods;
import domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class UserDao {
//    1.添加用户
    public void addUser(User user) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into user(username,email,password,name,phone,address,isadmin,isvalidate) values(?,?,?,?,?,?,?,?)";
        r.update(sql,user.getUsername(),user.getEmail(),user.getPassword(),user.getName(),user.getPhone(),user.getAddress(),user.isIsadmin(),user.isIsvalidate());
    }
    QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());


//2.判断用户名是否存在
    public boolean isUsernameExist(String username) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where username = ?";
        User u = r.query(sql, new BeanHandler<User>(User.class),username);
        if(u==null) {
            return false;
        }else {
            return true;
        }
    }
//   3.判断用户的email是否存在
    public boolean isEmailExist(String email) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where email = ?";
        User u = r.query(sql, new BeanHandler<User>(User.class),email);
        if(u==null) {
            return false;
        }else {
            return true;
        }
    }
    //判断用户的手机号是否存在
    public boolean isPhoneExist(String phone) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where phone = ?";
        User u = r.query(sql, new BeanHandler<User>(User.class),phone);
        if(u==null) {
            return false;
        }else {
            return true;
        }
    }
//    4.通过用户名密码登陆
public User selectByUsernamePassword(String username,String password) throws SQLException {
    QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
    String sql = "select * from user where username=? and password=?";
    return r.query(sql, new BeanHandler<User>(User.class),username,password);
}
//5.通过邮箱密码登陆     ***********   获取个人的信息
    public User selectByEmailPassword(String email,String password) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where email=? and password=?";
        return r.query(sql, new BeanHandler<User>(User.class),email,password);
    }
//    6.查询所有用户
    public List<User>   selectAllUsers() throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where isadmin=0";
        return r.query(sql, new BeanListHandler<User>(User.class));
    }
    //    7.查询用户通过id
    public User   selectUserById(int id) throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where id=?";
        return r.query(sql, new BeanHandler<User>(User.class),id);
    }
//    8.删除用户通过id
public void   deleteUserById(int id) throws SQLException{
    QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
    String sql = "delete from user where id=?";
   r.update(sql,id);
}
    //    9搜索----通过名称和id，email，收件人，电话，地址 管理员页面
    public  List<User>   getAllSearchUsers(String keyWord) throws SQLException {
        String sql="select * from user where (id like ?   or username like ?   or email like ?  or name like ?  or phone like ?  or address like ?) and isadmin=0 ";
        return  r.query(sql, new BeanListHandler<User>(User.class),'%'+ keyWord+'%','%'+ keyWord+'%','%'+ keyWord+'%','%'+ keyWord+'%','%'+ keyWord+'%','%'+ keyWord+'%');
    }
    //10修改用户基本信息
    public void update(User u) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update user set username=?,email=?,password=?,name=?,phone=?,address=? where id=?";
        r.update(sql,u.getUsername(),u.getEmail(),u.getPassword(),u.getName(),u.getPhone(),u.getAddress(),u.getId());
    }



    //2.修改时判断用户名是否存在
    public boolean isUsername1Exist(String username,int id) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where username = ? and id !=?";
        User u = r.query(sql, new BeanHandler<User>(User.class),username,id);
        if(u==null) {
            return false;
        }else {
            return true;
        }
    }
    //   3.修改时判断用户的email是否存在
    public boolean isEmail1Exist(String email ,int id) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where email = ? and id !=?";
        User u = r.query(sql, new BeanHandler<User>(User.class),email,id);
        if(u==null) {
            return false;
        }else {
            return true;
        }
    }
    //修改时判断用户的手机号是否存在
    public boolean isPhone1Exist(String phone,int id) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where phone = ? and id !=?";
        User u = r.query(sql, new BeanHandler<User>(User.class),phone,id);
        if(u==null) {
            return false;
        }else {
            return true;
        }
    }


}
