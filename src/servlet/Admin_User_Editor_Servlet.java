package servlet;

import domain.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin_user_editorServlet")
public class Admin_User_Editor_Servlet  extends HttpServlet {
    private UserService userService=new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        int id=Integer.parseInt(req.getParameter("user_id"));
        String username = req.getParameter("username");
        String email=req.getParameter("email");
        String name = req.getParameter("name");
        String phone=req.getParameter("phone");
        String password=req.getParameter("password");
        String address = req.getParameter("address");
        User u=new User(id,username,email,password,name,phone,address);
        boolean update = userService.update(u);
        if(update==false){
            req.setAttribute("msg", "用户名或邮箱,手机号重复，请重新填写！");
        }
        else {
            req.setAttribute("msg", "修改成功");
        }
        User user = userService.selectUserById(id);
        req.setAttribute("user",user);
        req.getRequestDispatcher("/admin_user_edit.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
