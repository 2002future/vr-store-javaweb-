package servlet;

import domain.Goods;
import service.GoodsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/goods_searchServlet")
public class Goods_Search_Servlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyWord = req.getParameter("keyWord");
        GoodsService goodsService = new GoodsService();
        List<Goods> searchGoods = goodsService.getSearchGoods(keyWord);
        req.setAttribute("searchGoods",searchGoods);
        req.setAttribute("keyWord",keyWord);
        req.getRequestDispatcher("/goods_search.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
