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

@WebServlet("/User_PayOrder_Servlet")
public class User_PayOrder_Servlet  extends HttpServlet {
    private OrderService orderService=new OrderService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                  int status=0;
               if(req.getParameter("status")!=null){
                    status=Integer.parseInt(req.getParameter("status"));
               }
        User user=(User)req.getSession().getAttribute("user");
        List<Order> orders = orderService.selectOrdersByUserId(status, user.getId());
              req.setAttribute("orders",orders);

//        for (Order order : orders) {        emmm不太会用算了
//            List<OrderItem> orderItems = orderService.selectAllItem(order.getId());
//         order.setItemList(orderItems);
//
//        }

              req.getRequestDispatcher("/user_pay_order.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
