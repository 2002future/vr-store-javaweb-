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

@WebServlet("/goods_editShowServlet")
public class Admin_Goods_EditShow_Servlet extends HttpServlet {
    GoodsService goodsService=new GoodsService();
    TypeService typeService=new TypeService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          int id=Integer.parseInt(req.getParameter("id"));
        Goods goodsById = goodsService.getGoodsById(id);
        List<Type> typeList1 = typeService.selectTypeName();
        req.getSession().setAttribute("good",goodsById);
        req.getSession().setAttribute("typeList1",typeList1);
        req.getRequestDispatcher("/admin_goods_edit.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
