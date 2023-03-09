package servlet;

import domain.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/users_addServlet")
public class Admin_User_Add_Servlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         req.setCharacterEncoding("utf-8");
         req.removeAttribute("msg1");
         req.removeAttribute("msg2");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        System.out.println(username);
        User user = new User(username,email,password,name,phone,address);
        UserService userService=new UserService();
        if(userService.register(user)) {
            req.setAttribute("msg1", "添加用户成功！");
            req.getRequestDispatcher("admin_user_manageServlet").forward(req, resp);
        }else {
            req.setAttribute("msg2", "用户名或邮箱重复，请重新填写！");
            req.getRequestDispatcher("admin_user_add.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
