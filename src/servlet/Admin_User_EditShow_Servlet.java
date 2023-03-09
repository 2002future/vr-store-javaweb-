package servlet;

import domain.Goods;
import domain.Type;
import domain.User;
import service.GoodsService;
import service.TypeService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/user_editShowServlet")
public class Admin_User_EditShow_Servlet extends HttpServlet {
  UserService userService=new UserService();
    TypeService typeService=new TypeService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        User user = userService.selectUserById(id);
        req.setAttribute("user",user);
        req.getRequestDispatcher("/admin_user_edit.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
