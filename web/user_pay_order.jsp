<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/28
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户订单状况页面</title>
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="./css/goods_cart.css">
</head>
<body>
<!--header-->

<jsp:include page="header.jsp">
    <jsp:param name="flag" value="6"></jsp:param>
    <jsp:param name="usercenter" value="1"></jsp:param>
</jsp:include>
<!--//header-->

<!--cart-items-->
<div class="container">
    <h2>我的订单</h2>
    <div style="margin-top: 10px;">
        <table class="tabls">
            <tr >
                <th width="15%">订单ID</th>
                <th width="10%">总价</th>
                <th width="10%">数量</th>
                <th width="10%">支付方式</th>
                <th width="10%">下单时间</th>
                <th width="15%">收货地址</th>
                <th  width="15%">操作</th>
            </tr>
            <c:forEach items="${orders }" var="order">
            <tr   class="tablen">
                <th >
                        ${order.id}
                </th>
                <th>¥ ${order.total}</th>
                <th>  ${order.amount}</th>
                <th>
                    <c:if test="${order.paytype==1}">微信</c:if>
                    <c:if test="${order.paytype==2}">支付宝</c:if>
                </th>
                <th> ${order.datetime}</th>
                <th> ${order.address}</th>
                <th ><a class="btn btn-info" href="${pageContext.request.contextPath}/Order_Detail_Servlet?order_id=${order.id}">查看详情</a>
                <c:if test="${order.status==1}">
                    <a class="btn btn-info" href="${pageContext.request.contextPath}/order_submit.jsp">支付</a>
                </c:if></th>
                <div class="clearfix"></div>


</tr>
</c:forEach>
</table>
</div>
</div>

<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>

<!--//footer-->
</body>
</html>
