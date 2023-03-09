<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/22
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户中心页面</title>
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="./css/user_center.css" type="text/css ">
</head>
<body style="background-color: #f8f6f6">
<!--header-->
<c:if test="${empty user}">
    <jsp:forward page="no_login.jsp"></jsp:forward>
</c:if>
<jsp:include page="header.jsp">
    <jsp:param name="flag" value="6"></jsp:param>
    <jsp:param name="usercenter" value="1"></jsp:param>
</jsp:include>
<c:if test="${!empty msg}">
    <div class=" alert alert-danger " style="width: 100%">${msg}</div>
</c:if>
<!--//header-->
<div class="container1">
    <div class="container2">
        <%--         订单支付成功时的跳转提示--%>

        <div class="imgZ">
            <img src="${pageContext.request.contextPath}/picture/touxiang1.jpg" alt=""
                 style="width: 120px;height: 120px">
        </div>
        <div class="left">
            <div>${user.username}</div>
            <div>修改个人信息></div>
        </div>


        <div class="right">
            <div>手机号：${user.phone}</div>
            <div>邮箱：${user.email}</div>
        </div>
    </div>
    <%--           ___________________________________________--%>
    <div class="order">
        <div><img src="${pageContext.request.contextPath}/image/nopay.png" alt="" style="width: 100px;height: 100px">
        </div>
        <div>待支付的订单:</div>
        <div style="margin-left: 20px"> <a href="${pageContext.request.contextPath}/User_PayOrder_Servlet?status=1">查看待支付的订单></a></div>
    </div>
    <div class="order" style="margin-left: 200px">
        <div><img src="${pageContext.request.contextPath}/image/noget.png" alt="" style="width: 100px;height: 100px">
        </div>
        <div>待收货的订单:</div>
        <div><a href="${pageContext.request.contextPath}/User_PayOrder_Servlet?status=3">查看待收货的订单></a></div>
    </div>
    <div class="order" >
        <div><img src="${pageContext.request.contextPath}/image/已支付.png" alt="" style="width: 100px;height: 100px">
        </div>
        <div>已支付的订单:</div>
        <div><a href="${pageContext.request.contextPath}/User_PayOrder_Servlet?status=2">查看已支付的订单></a></div>
    </div>
    <div class="order"  style="margin-left: 200px">
        <div><img src="${pageContext.request.contextPath}/image/nopay.png" alt="" style="width: 100px;height: 100px">
        </div>
        <div>已完成的订单:</div>
        <div><a href="${pageContext.request.contextPath}/User_PayOrder_Servlet?status=4">查看已完成的订单></a></div>
    </div>
</div>

<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>

<!--//footer-->

</body>
</html>
