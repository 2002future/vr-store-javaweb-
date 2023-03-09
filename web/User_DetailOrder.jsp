<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/28
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单详情页面</title>
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="./css/goods_cart.css">
</head>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="flag" value="6"></jsp:param>
    <jsp:param name="usercenter" value="3"></jsp:param>
</jsp:include>
<div class="container">
<div style="margin-top: 10px;margin-left: 100px">
    <table class="tabls" >
        <tr >
            <th width="30%">商品名称</th>
            <th width="10%">单价</th>
            <th width="10%">数量</th>
            <th width="10%">总价</th>
        </tr>
        <c:forEach items="${orderItems }" var="item">
        <tr   class="tablen">
            <th >
                <a href="${pageContext.request.contextPath}/goods_detailServlet?id=${item.goodsid}">
                    <img src="${pageContext.request.contextPath }${item.image}" class="img-responsive"
                         style="width: 130px; height: 160px;float: left;">
                </a>
                <a href="${pageContext.request.contextPath}/goods_detailServlet?id=${item.goodsid}" style="margin-left: 0px;margin-top: 20px;line-height: 150px;">${item.name}</a>
            </th>
            <th>   ¥ ${item.price}</th>
            <th >
                <span class="btn btn-info" style="font-size: 20px;width: 50px">    ${item.amount}</span>
            <th>     ¥ ${item.price*item.amount}</th>
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
