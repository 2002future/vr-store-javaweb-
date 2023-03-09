package servlet;

import domain.Goods;
import domain.Order;
import domain.Type;
import domain.User;
import service.GoodsService;
import service.OrderService;
import service.TypeService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/admin_searchServlet")
public class Admin_Search_Servlet extends HttpServlet {
    private GoodsService goodsService = new GoodsService();
    private UserService userService = new UserService();
    private TypeService typeService = new TypeService();
    private OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchId = req.getParameter("searchId");
        String keyWord = req.getParameter("keyWord");
        req.setAttribute("keyWord",keyWord);
        if (searchId != null) {
            int id = Integer.parseInt(searchId);
//              if(id==2){
//                  List<Map<String, Object>> allGoods = goodsService.getAllSearchGoods(keyWord);
//                  req.setAttribute("allGoods",allGoods);
//                  req.getRequestDispatcher("/admin_goods_manage.jsp").forward(req, resp);
//              }
//            switch 简单一些，跳转的话可以像case2，3一样，也可以像case4一样跳转到Servlet，建议跳转到Servlet
            switch (id) {
                case 2:
                    List<Map<String, Object>> allGoods = goodsService.getAllSearchGoods(keyWord);
                    req.setAttribute("allGoods", allGoods);
                    req.getRequestDispatcher("/admin_goods_manage.jsp").forward(req, resp);
                case 3:
                    List<User> users = userService.getAllSearchUsers(keyWord);
                    req.setAttribute("users",users);
                    req.getRequestDispatcher("/admin_user_manage.jsp").forward(req,resp);
                case 4:
                      req.setAttribute("keyWordtype",keyWord);
                    req.getRequestDispatcher("/admin_type_manageServlet").forward(req,resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
