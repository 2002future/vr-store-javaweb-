package service;

import dao.TypeDao;
import domain.Type;
import domain.User;

import java.sql.SQLException;
import java.util.List;

public class TypeService {
    TypeDao tDao=new TypeDao();
    //根据id获取类型名
    public Type selectTypeNameByID(int typeid)
    {
        Type type=null;
        try {
            type=tDao.selectTypeNameByID(typeid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return type;
    }

    //根据id获取类型名
    public List<Type> selectTypeName()
    {
        List<Type> type=null;
        try {
            type=tDao.selectTypeName();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return type;
    }
    //    6.查询所有类型
    public List<Type> selectAllTypes() {
        List<Type> Type=null;
        try {
            Type = tDao.selectAllTypes();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  Type;
    }
    //更新类型
     public void update(Type t) {
         try {
             tDao.update(t);
         } catch (SQLException e) {
             e.printStackTrace();
         }
     }
//     删除商品
public void   deleteUserById(int id){
    try {
        tDao.deleteTypeById(id);
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
//     添加商品
public void insert(Type t){
    try {
        tDao.insert(t);
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    //    6.查询所有类型
    public List<Type>  searchTypes(String KeyWord){
        List<Type> Type=null;
        try {
            Type = tDao.searchTypes(KeyWord);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  Type;
    }


}
