package service;

import dao.GoodsDao;
import dao.OrderDao;
import domain.Order;
import domain.OrderItem;
import utils.DataSourceUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class OrderService {
    private OrderDao oDao=new OrderDao();
//    查询所有的订单
    public List<Order>  selectAllOrders(int status){
        List<Order> orders=null;
        try {
           orders = oDao.selectAllOrders(status);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  orders;
    }

    //   用户id： 查询所有的订单通过状态码和用户id
    public List<Order>  selectOrdersByUserId(int status,int id){
        List<Order> orders=null;
        try {
            orders = oDao.selectOrdersByUserId(status,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  orders;
    }


//    查询所有的订单项通过订单id
public List<OrderItem> selectAllItem(int orderid){
        List<OrderItem> orderItems=null;
        try {
            orderItems = oDao.selectAllItem(orderid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  orderItems;
    }

    //     _______________________________________________________________________________________ 根据商品类型获取
    public   List<Map<String,Object>> selectAllItem1(int orderid) {
        List<Map<String,Object>> list=null;
        try {
            list=oDao.selectAllItem1(orderid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }



////添加订单           这种写法出bug拉
//    public void addOrder(Order order) {
//        Connection con = null;
//        try {
//            con = DataSourceUtils.getConnection();
//            con.setAutoCommit(false);
//
//            oDao.insertOrder(con, order);
//            int id = oDao.getLastInsertId(con);
//            order.setId(id);
//            for(OrderItem item : order.getItemMap().values()) {
//                oDao.insertOrderItem(con, item);
//            }
//
//            con.commit();
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//            if(con!=null)
//                try {
//                    con.rollback();
//                } catch (SQLException e1) {
//                    // TODO Auto-generated catch block
//                    e1.printStackTrace();
//                }
//        }
//    }

    ////添加订单
        public void addOrder(Order order,int user_id) {
        try {
            oDao.insertOrder( order);
            int id = oDao.getLastInsertId(user_id);
            order.setId(id);
            ////        插入订单项
            for(OrderItem item : order.getItemMap().values()) {
                oDao.insertOrderItem(item);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }
    }
//    public void insertOrderItem(OrderItem item){
//        try {
//            oDao.insertOrderItem(item);
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//
//        }
//    }
public void updateStatus(int id,int status) {
    try {
        oDao.updateStatus(id, status);
    } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
}
}
