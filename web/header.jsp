<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/5/28
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    jquery.min.js文件的引用要在bootstrap.min.js之前。--%>
    <title>头部</title>
    <link rel="stylesheet" href="./css/admin_goods_menu.css" type="text/css ">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="./js/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="./js/bootstrap.bundle.js"></script>
<%--    <script type="text/javascript" src="./js/jquery.min.js"></script>--%>
<%--    boostrap.js也可以--%>
    <script type="text/javascript" src="./js/bootstrap.js"></script>
</head>
<body>

<%--<jsp:param>动作用于实现参数的传递，该动作以键值对的形式为其他动作提供附加的参数信息。该动作不能单独使用，需要作为其他动作标记的子标记出现，
通常和<jsp:forward>、<jsp:include>、<jsp:plugin>动作一起使用，实现参数的传递。--%>

<%--通过在a标签里面设置一个<c:if>从而获取传递的参数，--%>
<div class="Bar">
    <div><a href="${pageContext.request.contextPath}/indexServlet" <c:if test="${param.flag==1}">class="active" </c:if>>首页</a></div>
    <div><a href="${pageContext.request.contextPath}/goods_hotSellServlet"  <c:if test="${param.flag==2}">class="active" </c:if>>热销</a></div>
    <div><a href="${pageContext.request.contextPath}/goods_NewsServlet"   <c:if test="${param.flag==3}">class="active" </c:if>>新品</a></div>
<%--    分类--%>
<div class="fenLei">
            <a  href="#" class="dropdown-toggle <c:if test="${param.flag==4}">active </c:if>"  data-toggle="dropdown" >商品分类</a>
            <div class="fen dropdown-menu " aria-labelledby="dropdownMenuOffset" style="background-color: rgb(51,51,51)">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/goods_FenLeiServlet">全部商品</a></li>
<%--                在indexServlet定义一个typelist获取类型名this.getServletContext().setAttribute("typeList",types);--%>
                <c:forEach items="${typeList}" var="t">
                    <li ><a class="dropdown-item" href="${pageContext.request.contextPath}/goods_FenLeiServlet?typeid=${t.id}">${t.name}</a></li>
                </c:forEach>
            </div>
</div>
<%--    搜索--%>
    <div style="float: right"><a href="${pageContext.request.contextPath}/user_centerServlet?id=${user.id}"   <c:if test="${param.flag==6}">class="active" </c:if>>个人中心</a></div>
<c:if test="${empty user}">
    <div style="float: right"><a href="${pageContext.request.contextPath}/user_login.jsp"  <c:if test="${param.flag==9}">class="active" </c:if>>登录</a></div>
    <div style="float: right"><a href="${pageContext.request.contextPath}/user_register.jsp"<c:if test="${param.flag==10}">class="active" </c:if>>注册</a></div>
</c:if>

    <div style="float: right">
        <form action="${pageContext.request.contextPath}/goods_searchServlet" >
            <input type="text" name="keyWord" value="${keyWord}" class="inpu">
            <button type="submit" <c:if test="${param.flag==5}">class="active" </c:if>>搜索</button>
        </form>
    </div>
    <div  style="margin-left: 30px"><a href="${pageContext.request.contextPath}/goods_cart.jsp">


        <c:if test="${!empty order}">
            <div  id="yuanquan">${order.amount}</div>
        </c:if>
<c:if test="${param.flag!=7}">
        <img src="${pageContext.request.contextPath}/image/shopping.png" style="width: 50px;height: 50px "></a></div>
    </c:if>
    <c:if test="${param.flag==7}">
    <img src="${pageContext.request.contextPath}/image/购物车.png" style="width: 70px;height: 70px "></a></div>
</c:if>
    </div>


<%--__________________个人信息菜单栏___________________--%>
<c:if test="${param.flag==6}">
    <div class="aBar1" style="height: 450px">
        <div>
            <div>个人信息</div>
            <div><a href="${pageContext.request.contextPath}/user_centerServlet?id=${user.id}"
                    <c:if test="${param.usercenter==1 }">class="active1" style="color:red;" </c:if> >我的信息</a></div>
            <div><a href="${pageContext.request.contextPath}/user_editorShowServlet?user_id=${user.id}"
                    <c:if test="${param.usercenter==2 }">class="active1" </c:if>>修改信息</a></div>

        </div>


        <div>
            <div> <a href="${pageContext.request.contextPath}/goods_cart.jsp">购物车</a></div>
         <div><a href="${pageContext.request.contextPath}/user_outLoginServlet" onclick="return confirm('确定退出登录?')">退出登录</a></div>
        </div>
    </div>
</c:if>

</body>
</html>
