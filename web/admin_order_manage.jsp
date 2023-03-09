<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/26
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单管理页面</title>
</head>
<body>
<div class="container-fluid">
    <!--header-->
    <jsp:include page="admin_header.jsp">
        <jsp:param name="flag" value="5"></jsp:param>
    </jsp:include>

    <table class="table table-bordered table-hover" style="margin-left: 220px;margin-top: 20px;width: 1200px">
        <tr>
            <th width="3%">ID</th>
            <th width="3%">总价</th>
<%--            <th width="8%">商品详情</th>--%>
            <th width="8%">收货信息</th>
            <th width="3%">订单状态</th>
            <th width="3%">支付方式</th>
            <th width="3%">下单用户</th>
            <th width="5%">下单时间</th>
            <th width="10%">操作</th>
        </tr>

        <c:forEach items="${orders}" var="order">
            <tr>
                <td><p>${order.id }</p></td>
                <td><p>${order.total }</p></td>
<%--                <td>--%>
<%--                    <c:forEach items="${order.itemList }" var="item">--%>
<%--                        <p>${item.goodsName }(${item.price }) x ${item.amount}</p>--%>
<%--                    </c:forEach>--%>
<%--                </td>--%>
                <td>
                    <p>${order.name }</p>
                    <p>${order.phone }</p>
                    <p>${order.address }</p>
                </td>
                <td>
                    <p>
                        <c:if test="${order.status==1 }"><span style="color:red;">未付款</span></c:if>
                        <c:if test="${order.status==2 }"><span style="color:red;">已付款</span></c:if>
                        <c:if test="${order.status==3 }"><span style="color:green;">已发货</span></c:if>
                        <c:if test="${order.status==4 }"><span style="color:black;">已完成</span></c:if>

                    </p>
                </td>
                <td>
                    <p>

                        <c:if test="${order.paytype==1 }">微信</c:if>
                        <c:if test="${order.paytype==2 }">支付宝</c:if>
                        <c:if test="${order.paytype==3 }">货到付款</c:if>

                    </p>
                </td>
                <td><p>${order.user.username }</p></td>
                <td><p>${order.datetime }</p></td>
                <td>

                    <c:if test="${order.status==2 }">
                        <a class="btn btn-success" href="${pageContext.request.contextPath}/admin_order_statusServlet?id=${order.id }&status=3">发货</a>
                    </c:if>
                    <c:if test="${order.status==3 }">
                        <a class="btn btn-warning" href="${pageContext.request.contextPath}/admin_order_statusServlet?id=${order.id }&status=4">完成</a>
                    </c:if>

                </td>
            </tr>
        </c:forEach>


    </table>
</div>
</body>
</html>
