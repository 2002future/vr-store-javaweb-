package servlet;

import domain.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user_loginServlet")
public class User_Login_Servlet extends HttpServlet {
    private UserService uService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String aUser = request.getParameter("aUser");
        String aPassword = request.getParameter("aPassword");
        User user = uService.login(aUser,aPassword);

        if(user==null) {
            request.setAttribute("failMsg", "用户名、邮箱或者密码错误，请重新登录！");
            request.getRequestDispatcher("/user_login.jsp").forward(request, response);
        }else {
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("MSGSUCCESS","您已登录，无需重复登录");
            if(user.isIsadmin()){
                request.getRequestDispatcher("/admin_index.jsp").forward(request, response);
            }
            else {
                request.getRequestDispatcher("/user_center.jsp").forward(request, response);
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
