package servlet;

import domain.Order;
import service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin_order_manageServlet")
public class Admin_Order_Manage_Servlet  extends HttpServlet {
           private OrderService orderService=new OrderService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int status = 0;
        if(req.getParameter("status") != null) {
            status=Integer.parseInt(req.getParameter("status") ) ;
        }
        req.setAttribute("status", status);
        List<Order> orders = orderService.selectAllOrders(status);
        req.getSession().setAttribute("orders",orders);
        req.getRequestDispatcher("admin_order_manage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
