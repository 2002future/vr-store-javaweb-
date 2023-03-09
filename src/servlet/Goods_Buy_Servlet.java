package servlet;

import com.mysql.cj.x.protobuf.MysqlxCrud;
import domain.Goods;
import domain.Order;
import domain.OrderItem;
import domain.User;
import service.GoodsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/goods_buyServlet")
public class Goods_Buy_Servlet extends HttpServlet {
    private GoodsService gService = new GoodsService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Order o = null;
//        若购物车不为空，则获取购物车对象，若为空，则创建一个购物车对象
        if(request.getSession().getAttribute("order") != null) {
            o = (Order) request.getSession().getAttribute("order");
        }else {
            o = new Order();
            request.getSession().setAttribute("order", o);
        }
        int goodsid = Integer.parseInt(request.getParameter("goodsid"));
        Goods goods = gService.getGoodsById(goodsid);
        if(goods.getStock()>0) {
//            如果存货>0的话，则添加这个商品，在addGoods方法体中进行更近一步的判别
            o.addGoods(goods);


            response.getWriter().print("ok");
        }else {
            response.getWriter().print("fail");
        }


////        判断有没有登录
//        if(request.getSession().getAttribute("user")!=null){
//            User user=(User)request.getSession().getAttribute("user");
//
//        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}