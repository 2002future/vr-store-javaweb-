package dao;

import domain.Goods;
import domain.Type;
import domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class TypeDao {
    QueryRunner r=new QueryRunner(DataSourceUtils.getDataSource());
    //根据id获取类型名
    public Type selectTypeNameByID(int typeid) throws SQLException {
        String sql="select * from type where id=?";
        return r.query(sql,new BeanHandler<Type>(Type.class),typeid);
    }
    //获取类型名
    public List<Type> selectTypeName() throws SQLException {
        String sql="select * from type";
        return r.query(sql,new BeanListHandler<Type>(Type.class));
    }
    //    .查询所有类型
    public List<Type>   selectAllTypes() throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from type";
        return r.query(sql, new BeanListHandler<Type>(Type.class));
    }
    //修改类型
    public void update(Type t) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update type set name=? where id=?";
        r.update(sql,t.getName(),t.getId());
    }
    //    8.删除类型通过id
    public void   deleteTypeById(int id) throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from type where id=?";
        r.update(sql,id);
    }
    //          添加类型
    public void insert(Type t) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into type(name) values (?)";
        r.update(sql,t.getName());
    }
    //    .模糊查询所有类型
    public List<Type>   searchTypes(String KeyWord) throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from type where id like ? or name like ?";
        return r.query(sql, new BeanListHandler<Type>(Type.class),'%'+KeyWord+'%','%'+KeyWord+'%');
    }
}
