package servlet;

import domain.Type;
import service.TypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin_type_manageServlet")
public class Admin_Type_Manage_Servlet   extends HttpServlet {
    private TypeService tService = new TypeService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Type> list= tService.selectAllTypes();
//        ____________________如果有搜索
        if(req.getAttribute("keyWordtype")!=null){
            String keyWordtype = req.getAttribute("keyWordtype").toString();
            list=tService.searchTypes(keyWordtype);
        }
//        ________________
        int  editTypeId=0;
        if(req.getParameter("editTypeId")!=null){
            int indexs=Integer.parseInt(req.getParameter("indexs"));
            req.setAttribute("indexs",indexs);
        }

//        this.getServletContext().removeAttribute("typeList");
        this.getServletContext().setAttribute("typeList",list);

        req.getRequestDispatcher("/admin_type_manage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
