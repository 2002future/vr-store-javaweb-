package servlet;

import domain.Order;
import domain.OrderItem;
import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

@WebServlet(name = "order_confirm1",urlPatterns = "/order_confirm1")
public class Order_Confirm1_Servlet extends HttpServlet {
    private OrderService oService = new OrderService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Order o = (Order) request.getSession().getAttribute("order");
        try {
            BeanUtils.copyProperties(o, request.getParameterMap());
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        User user=(User)request.getSession().getAttribute("user");

        int user_id = user.getId();
        System.out.println(user_id);
        o.setDatetime(new Date());
        o.setStatus(1);

        o.setUser((User) request.getSession().getAttribute("user"));
        oService.addOrder(o,user_id);
        request.getSession().removeAttribute("order");
        request.setAttribute("msg", "订单保存成功！");
        request.getRequestDispatcher("/user_center.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
