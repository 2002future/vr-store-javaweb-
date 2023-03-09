package servlet;

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

@WebServlet("/goods_FenLeiServlet")
public class Goods_FenLei_Servlet extends HttpServlet {
    private GoodsService gService=new GoodsService();
    private TypeService tService=new TypeService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=0;
//        查询单个
        if(request.getParameter("typeid")!=null){
            id=Integer.parseInt(request.getParameter("typeid"));
            List<Map<String, Object>> goodsList = gService.getGoodsList(id);
            request.setAttribute("goodsList",goodsList);
//            查询所有
        }else{
            List<Map<String, Object>> goodsList = gService.getAllGoods();
            request.setAttribute("goodsList",goodsList);
            //            辅助判断是全部商品还是单个
            request.setAttribute("msg1",1);
        }



        request.getRequestDispatcher("goods_fenLei.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

}
