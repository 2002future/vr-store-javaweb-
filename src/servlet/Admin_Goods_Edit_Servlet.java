package servlet;

import domain.Goods;
import service.GoodsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/goods_editServlet")
public class Admin_Goods_Edit_Servlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String name = req.getParameter("name");
        double price=Double.parseDouble(req.getParameter("price"));
        String introduce = req.getParameter("introduce");
        int stock=Integer.parseInt(req.getParameter("stock"));
        int sell=Integer.parseInt(req.getParameter("sell"));
//        将date类型数据转换
//        String date = req.getParameter("date");
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        try {
//            Date dates = (Date) sdf.parse(date);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//        ---------------
        String image = req.getParameter("image");
        System.out.println("_______________");
        System.out.println(image);
        GoodsService goodsService=new GoodsService();
//        Goods goods=new Goods(name,);
//        goodsService.update(goods);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
