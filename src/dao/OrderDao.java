package dao;

import domain.Order;
import domain.OrderItem;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.DataSourceUtils;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLOutput;
import java.util.List;
import java.util.Map;

public class OrderDao {
//    查询所有订单  根据status
    public List<Order> selectAllOrders(int status) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        if(status==0){
        String sql = "select o.id,o.total,o.amount,o.status,o.paytype,o.name,o.phone,o.address,o.datetime,u.username from orders o,user u where o.user_id=u.id order by o.datetime desc";
        return r.query(sql, new BeanListHandler<Order>(Order.class));}
        else {
            String sql = "select o.id,o.total,o.amount,o.status,o.paytype,o.name,o.phone,o.address,o.datetime,u.username from orders o,user u where o.user_id=u.id and o.status=? order by o.datetime desc";
            return r.query(sql, new BeanListHandler<Order>(Order.class),status);}
        }

//        根据订单查询所有的订单项
    public List<OrderItem> selectAllItem(int orderid) throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select i.id,i.price,i.amount,g.name ,g.image from orderitem i,goods g where order_id=? and i.goods_id=g.id";
        return r.query(sql, new BeanListHandler<OrderItem>(OrderItem.class),orderid);
    }

    //   _____________________________________________________________________ 查询订单，map集合方法
    public  List<Map<String,Object>>  selectAllItem1(int orderid) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select i.id,i.price,i.amount,g.name ,g.image ,g.id goodsid from orderitem i,goods g where order_id=? and i.goods_id=g.id";
        return  r.query(sql, new MapListHandler(),orderid);
    }
////    插入订单
//    public void insertOrder(Connection con, Order order) throws SQLException {
//        QueryRunner r = new QueryRunner();
//        String sql = "insert into orders(total,amount,status,paytype,name,phone,address,datetime,user_id) values(?,?,?,?,?,?,?,?,?)";
//        r.update(con,sql,
//                order.getTotal(),order.getAmount(),order.getStatus(),
//                order.getPaytype(),order.getName(),order.getPhone(),
//                order.getAddress(),order.getDatetime(),order.getUser().getId() );
//    }
////
////    当我们向主键是自增型的数据库表中（如 user 表）插入一条记录时，我们期望获取刚刚写入这条记录的id，
////            （因为某些场景下需要获得这个id去做其他的操作），此时我们需要使用SELECT
////    LAST_INSERT_ID()这个语句来获取插入记录后返回的自增id的值；
////    获取最后插入的订单id 即购物车的订单id            ava.lang.Long cannot be cast to java.math.BigInteger出bug拉，解决不了暂时，那先不这么做了
//    public int getLastInsertId(Connection con) throws SQLException {
//        QueryRunner r = new QueryRunner();
//        String sql = "select last_insert_id()";
//        BigInteger bi = r.query(con, sql, new ScalarHandler<BigInteger>());
//        System.out.println("___________");
//        System.out.println(bi);
//        System.out.println(r.query(con, sql,new ScalarHandler<BigInteger>()));
//        return Integer.parseInt(bi.toString());
//    }
////    插入订单项
//    public void insertOrderItem(Connection con, OrderItem item) throws SQLException {
//        QueryRunner r = new QueryRunner();
//        String sql ="insert into orderitem(price,amount,goods_id,order_id) values(?,?,?,?)";
//        r.update(con,sql,item.getPrice(),item.getAmount(),item.getGoods().getId(),item.getOrder().getId());
//    }

        public void insertOrder( Order order) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into orders(total,amount,status,paytype,name,phone,address,datetime,user_id) values(?,?,?,?,?,?,?,?,?)";
        r.update(sql,
                order.getTotal(),order.getAmount(),order.getStatus(),
                order.getPaytype(),order.getName(),order.getPhone(),
                order.getAddress(),order.getDatetime(),order.getUser().getId() );
    }
    //    插入订单项
    public void insertOrderItem(OrderItem item) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql ="insert into orderitem(price,amount,goods_id,order_id) values(?,?,?,?)";
        System.out.println("______insertOrderItem_______");
        System.out.println(item.getAmount());
        System.out.println(item.getGoods().getId());
        System.out.println(item.getOrder().getId());
        r.update(sql,item.getPrice(),item.getAmount(),item.getGoods().getId(),item.getOrder().getId());
    }
    //通过user_id和时间获取最新的一个订单项，从而辅助添加订单
    public int getLastInsertId(int user_id) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select id from orders where user_id=? order by datetime desc limit 0,1";
        Order query = r.query(sql, new BeanHandler<Order>(Order.class), user_id);
        return  query.getId();
    }
    //用户id： 查询所有的订单通过状态码和用户id
    public List<Order> selectOrdersByUserId(int status,int id) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
//        System.out.println("-___________");
//        System.out.println(status);
//        System.out.println(id);
        String sql="select * from orders where user_id=? and status=? order by datetime desc ";
        List<Order> query = r.query(sql, new BeanListHandler<Order>(Order.class), id,status);
//        System.out.println("-___________");
//        System.out.println(query);
        return  query;
    }

    public void updateStatus(int id,int status) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql ="update orders set status=? where id = ?";
        r.update(sql,status,id);
    }
}
