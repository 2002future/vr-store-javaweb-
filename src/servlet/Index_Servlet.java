package servlet;

import domain.Goods;
import domain.Type;
import service.GoodsService;
import service.TypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/indexServlet")
public class Index_Servlet extends HttpServlet {
    private GoodsService gService=new GoodsService();
    TypeService tService =new TypeService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Goods> newsGoods = gService.getNewsGoods();
        request.setAttribute("newsGoods",newsGoods);
//        List<Map<String, Object>> newList = gService.getGoodsList(1);  暂时用不上
//        request.setAttribute("newList",newList);
        List<Goods> sellGoods = gService.getSellGoods();
        request.setAttribute("sellGoods",sellGoods);
        System.out.println("IndexServlet运行");
        List<Goods> scrollGood = gService.getScrollGood();
        request.setAttribute("scrollGood",scrollGood);
//           获取所有的类型名
        List<Type> types = tService.selectTypeName();
        this.getServletContext().setAttribute("typeList",types);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         this.doGet(request,response);
    }
}