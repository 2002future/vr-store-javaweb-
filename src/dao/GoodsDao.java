package dao;

import domain.Goods;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

//                            　MapListHandler 类  （实现ResultSetHandler 接口）把从数据库中查询出的记录 都 放到List  集合当中，
//                                    List集合中每一个对象都是Map类型，可以根据这条记录的字段名读出相对应的值.
public class GoodsDao {
    QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
    //   _____________________________________________________________________ 根据商品类型获取商品  商品分类
    public  List<Map<String,Object>>  getGoodsList(int recommendType) throws SQLException {
        String sql="select g.id,g.name,g.image,g.price,t.name typename from goods g,type t where type_id=? and  g.type_id=t.id";
        return  r.query(sql, new MapListHandler(),recommendType);
    }
//   _____________________________________________________________________ 获取新品
    public List<Goods> getNewsGoods() throws SQLException {
        String sql = "select id,name,image,price,date from goods  order  by date desc limit 0,8;";
        return r.query(sql, new BeanListHandler<Goods>(Goods.class));
    }
    //   ______________________________________________________________________ 获取热销产品
    public List<Goods> getSellGoods() throws SQLException {
        String sql = "select id,name,image,price,date,sell from goods  order  by sell desc limit 0,12;";
        return r.query(sql, new BeanListHandler<Goods>(Goods.class));
    }
    //    _____________________________________________________________________________________    通过good.id获取每个商品的详情
    public Goods getGoodsById(int id) throws SQLException {
        String sql = "select g.id,g.name,g.image,g.price,g.introduce,g.stock,g.sell,g.date,t.id typeid,t.name typename from goods g,type t where g.id = ? and g.type_id=t.id";
//        System.out.println("______________________2");
//        System.out.println(r.query(sql, new BeanHandler<Goods>(Goods.class),id));
        return r.query(sql, new BeanHandler<Goods>(Goods.class),id);

    }
    //   _________ 根据销售量获取全部商品，限制在20个吧，不然服务器压力太大，后面有时间的话做一下，只显示20个，当点击加载更多的时候再加载20个
    public List<Goods> getAllSellGoods() throws SQLException {
        String sql = "select id,name,image,price,date,sell from goods  order  by sell desc  limit 0,100;";
        return r.query(sql, new BeanListHandler<Goods>(Goods.class));
    }
    //   _____________________________________________________________________ 根据时间获取全部新品
    public List<Goods> getAllNewsGoods() throws SQLException {
        String sql = "select id,name,image,price,date from goods  order  by date desc limit 0,100;";
        return r.query(sql, new BeanListHandler<Goods>(Goods.class));
    }
    //   _____________________________________________________________________ 获取全部产品
    public  List<Map<String,Object>>  getAllGoods() throws SQLException {
        String sql="select g.id,g.name,g.image,g.price,t.name typename,g.introduce,g.sell,g.stock,g.date from goods g,type t where   g.type_id=t.id";
        return  r.query(sql, new MapListHandler());
    }
//    搜索----通过名称和介绍
    public List<Goods> getSearchGoods(String keyWord) throws SQLException {
//        String sql = "select * from goods where name  like ? or introduce like ?";
               String sql = "select * from goods where name  like ?";
        return r.query(sql, new BeanListHandler<Goods>(Goods.class),'%'+ keyWord+'%');
    }
    //    搜索----通过名称和介绍 管理员页面
    public  List<Map<String,Object>>  getAllSearchGoods(String keyWord) throws SQLException {
        String sql="select g.id,g.name,g.image,g.price,t.name typename,g.introduce,g.sell,g.stock,g.date from goods g,type t where (g.name like ? or g.id like ?) and  g.type_id=t.id";
        return  r.query(sql, new MapListHandler(),'%'+ keyWord+'%','%'+ keyWord+'%');
    }
//    获取轮播图对象
    public List<Goods> getScrollGood() throws SQLException{
        String sql="select id,name,scroll  from goods where scroll is not null limit 0,4 " ;
         return r.query(sql, new BeanListHandler<Goods>(Goods.class));
    }
//          添加商品
public void insert(Goods g) throws SQLException {
    QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
    String sql = "insert into goods(name,image,price,introduce,stock,sell,type_id,date) values(?,?,?,?,?,?,?,?)";
    r.update(sql,g.getName(),g.getImage(),g.getPrice(),g.getIntroduce(),g.getStock(),g.getSell(),g.getType_id());
}
      //修改商品
      public void update(Goods g) throws SQLException {
          QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
          String sql = "update goods set name=?,image=?,price=?,introduce=?,stock=?,sell=?,type_id=?,date=? where id=?";
          r.update(sql,g.getName(),g.getImage(),g.getPrice(),g.getIntroduce(),g.getStock(),g.getSell(),g.getType_id(),g.getDate(),g.getId());
      }
//     删除商品
    public void delete(int id) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from goods where id = ?";
        r.update(sql,id);
    }

}
