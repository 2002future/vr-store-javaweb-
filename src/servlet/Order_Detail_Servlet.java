package servlet;

import domain.Order;
import domain.OrderItem;
import domain.User;
import service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/Order_Detail_Servlet")
public class Order_Detail_Servlet   extends HttpServlet {
    private OrderService orderService=new OrderService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                 int  order_id=Integer.parseInt(req.getParameter("order_id"));
        List<Map<String, Object>>orderItems = orderService.selectAllItem1(order_id);
        req.setAttribute("orderItems",orderItems);
              req.getRequestDispatcher("/User_DetailOrder.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
