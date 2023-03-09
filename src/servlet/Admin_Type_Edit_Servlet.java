package servlet;

import domain.Type;
import service.TypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin_type_editServlet")
public class Admin_Type_Edit_Servlet extends HttpServlet {
    private TypeService tService = new TypeService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       int typId=Integer.parseInt(req.getParameter("typeId"));
        String typeName = req.getParameter("typeName");
        Type type=new Type(typId,typeName);
          tService.update(type);
        req.getRequestDispatcher("/admin_type_manageServlet").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
