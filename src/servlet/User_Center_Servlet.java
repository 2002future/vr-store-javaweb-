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

@WebServlet("/user_centerServlet")
public class User_Center_Servlet   extends HttpServlet {
    UserService userService =new UserService();
    private GoodsService gService=new GoodsService();
    TypeService tService =new TypeService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        必须要加个！=""，不然会报错
           if(request.getParameter("id")!=null&&request.getParameter("id")!=""){
               int user_id=0;
               user_id=Integer.parseInt(request.getParameter("id"));
               User user = userService.selectUserById(user_id);
               request.getSession().setAttribute("user",user);
           }



        List<Goods> newsGoods = gService.getNewsGoods();
        request.setAttribute("newsGoods",newsGoods);
//        List<Map<String, Object>> newList = gService.getGoodsList(1);  暂时用不上
//        request.setAttribute("newList",newList);
        List<Goods> sellGoods = gService.getSellGoods();
        request.setAttribute("sellGoods",sellGoods);
        System.out.println("IndexServlet运行");
        List<Goods> scrollGood = gService.getScrollGood();
        request.setAttribute("scrollGood",scrollGood);
//           获取所有的类型名
        List<Type> types = tService.selectTypeName();
        this.getServletContext().setAttribute("typeList",types);
        request.getRequestDispatcher("user_center.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
