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

    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/admin_header.css">
        <link rel="stylesheet" href="./css/admin_goods_menu.css" type="text/css ">
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
<%--头部菜单栏区域--%>
<div class="Bar">
    <div><a href="${pageContext.request.contextPath}/admin_index.jsp"
            <c:if test="${param.flag==1}">class="active" </c:if>>首页</a></div>
    <div id="as"><a href="${pageContext.request.contextPath}/goods_listServlet"
                    <c:if test="${param.flag==2}">class="active" </c:if>>商品管理</a></div>
    <div><a href="${pageContext.request.contextPath}/admin_user_manageServlet"
            <c:if test="${param.flag==3}">class="active" </c:if>>客户管理</a></div>
    <div><a href="${pageContext.request.contextPath}/admin_type_manageServlet"
            <c:if test="${param.flag==4}">class="active" </c:if>>类别管理</a></div>
    <div><a href="${pageContext.request.contextPath}/admin_order_manageServlet"
            <c:if test="${param.flag==5}">class="active" </c:if>>订单管理</a></div>


    <%--    搜索--%>
    <div style="float: right"><a href="${pageContext.request.contextPath}/user_outLoginServlet" onclick="return confirm('确定退出登录?')"
                                 <c:if test="${param.flag==10}">class="active" </c:if>>退出登录</a></div>
<c:if test="${empty user}">
    <div style="float: right"><a href="${pageContext.request.contextPath}/user_login.jsp"  <c:if test="${param.flag==9}">class="active" </c:if>>登录</a></div>
</c:if>

    <div >
        <form action="${pageContext.request.contextPath}/admin_searchServlet" >
            <input type="hidden" name="searchId" value="${param.flag}">
            <%--            做个隐藏域，判断是第几个页面的--%>
            <input type="text" name="keyWord" value="${keyWord}" class="inpu">
            <button type="submit">搜索</button>
        </form>
    </div>

</div>
<%--__________________商品管理菜单栏___________________--%>
<c:if test="${param.flag==2}">
    <div class="aBar1">
    <div>
        <div>商品</div>
        <div><a href="${pageContext.request.contextPath}/goods_listServlet"
                <c:if test="${param.goodsmanage==1 }">class="active1" style="color:red;" </c:if> >全部商品</a></div>
        <div><a href="${pageContext.request.contextPath}/admin_goods_add.jsp"
                <c:if test="${param.goodsmanage==2 }">class="active1" </c:if>>添加商品</a></div>
        <div><a href="#" <c:if test="${param.goodsmanage==3 }">class=" active1" </c:if>>  修改商品</a></div>
    </div>


</div>
</c:if>
<%--___________________________________________________--%>
<%--__________________用户管理菜单栏___________________--%>
<c:if test="${param.flag==3}">
    <div class="aBar1" >
        <div >
            <div >用户</div>
            <div><a href="${pageContext.request.contextPath}/admin_user_manageServlet"
                    <c:if test="${param.usersmanage==1 }">class="active1" style="color:red;" </c:if> >全部用户</a></div>
            <div><a href="${pageContext.request.contextPath}/admin_user_add.jsp"
                    <c:if test="${param.usersmanage==2 }">class="active1" </c:if>>添加用户</a></div>
            <div><a href="#" <c:if test="${param.usersmanage==3 }">class=" active1" </c:if>>  修改用户</a></div>
        </div>

        <div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
</c:if>
<%--___________________订单管理页面________________________________--%>
<c:if test="${param.flag==5}">
    <div class="aBar1" >
        <div >
            <div >订单</div>
            <div><a href="${pageContext.request.contextPath}/admin_order_manageServlet"
                    <c:if test="${status==0 }">class="active1" style="color:red;" </c:if> >全部订单</a></div>
            <div><a href="${pageContext.request.contextPath}/admin_order_manageServlet?status=1"
                    <c:if test="${status==1 }">class="active1" </c:if>>未付款</a></div>
            <div><a href="${pageContext.request.contextPath}/admin_order_manageServlet?status=2" <c:if test="${status==2 }">class=" active1" </c:if>> 已付款</a></div>
            <div><a href="${pageContext.request.contextPath}/admin_order_manageServlet?status=3" <c:if test="${status==3 }">class=" active1" </c:if>> 配送中</a></div>
            <div><a href="${pageContext.request.contextPath}/admin_order_manageServlet?status=4" <c:if test="${status==4 }">class=" active1" </c:if>> 已完成</a></div>
        </div>

        <div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
</c:if>
<%--___________________________________________________--%>

</body>
</html>
