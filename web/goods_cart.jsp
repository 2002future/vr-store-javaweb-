<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/28
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车页面</title>
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="./css/goods_cart.css">
    <script type="text/javascript" src="js/cart.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>


<!--header-->
<jsp:include page="header.jsp">
    <jsp:param name="flag" value="7"></jsp:param>
</jsp:include>
<!--//header-->


<!--cart-items-->
<div class="container">
    <h2>我的购物车</h2>
    <div style="margin-top: 10px;">
        <table class="tabls">
            <tr >
                <th width="30%">商品名称</th>
                <th width="10%">单价</th>
                <th width="10%">数量</th>
                <th width="10%">总价</th>
                <th  width="10%">操作</th>
            </tr>
            <c:forEach items="${order.itemMap }" var="item">
            <tr   class="tablen">
                <th >
                    <a href="${pageContext.request.contextPath}/goods_detailServlet?id=${item.key}">
                        <img src="${pageContext.request.contextPath }${item.value.goods.image}" class="img-responsive"
                             style="width: 130px; height: 160px;float: left;">
                    </a>
                    <a href="${pageContext.request.contextPath}/goods_detailServlet?id=${item.key}" style="margin-left: 0px;margin-top: 20px;line-height: 150px;">${item.value.goods.name}</a>
                </th>
                    <th>   ¥ ${item.value.price}</th>
                    <th >

                        <a class="btn btn-warning" href="javascript:buy(${item.key});">+</a>
                        <span class="btn btn-info" style="font-size: 20px;width: 50px">    ${item.value.amount}</span>
                        <a class="btn btn-warning" href="javascript:lessen(${item.key});" >-</a></th>

                    <th>     ¥ ${item.value.price*item.value.amount}</th>
                    <th>    <a class="btn shan" href="javascript:deletes(${item.key});">x</a></th>

                <div class="clearfix"></div>
    </div>
</div>
</tr>
</c:forEach>
</table>
</div>

<div class="cart-header col-md-12">
    <hr>
    <h3>订单总金额: ¥ ${order.total}</h3>
    <a class="btn btn-success btn-lg" style="margin-left:74%" href="${pageContext.request.contextPath}/order_submit">提交订单</a>
</div>


</div>
<!--//cart-items-->


<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>
<!--//footer-->

</body>
</html>
