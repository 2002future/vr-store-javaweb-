<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/24
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品页</title>
    <link rel="stylesheet" href="./css/admin_goods_manage.css" type="text/css ">
    <link rel="stylesheet" href="./css/admin_index.css" type="text/css ">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <%--    <script type="text/javascript" src="./js/jquery-3.6.0.js"></script>--%>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <%--    <script type="text/javascript" src="./js/bootstrap.bundle.js"></script>--%>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>

</head>
<body>
<!--header-->
<jsp:include page="admin_header.jsp">
    <jsp:param name="flag" value="2"></jsp:param>
    <jsp:param name="goodsmanage" value="1"></jsp:param>
</jsp:include>

<div class="container">
<%----------------------------全部商品-------------------------------------------------%>
<div style="margin-left: 100px;margin-top: 20px">
<table class="table table-bordered table-hover">
<tr>
    <th width="5%">ID</th>
    <th width="10%">图片</th>
    <th width="10%">名称</th>
    <th width="15%">介绍</th>
    <th width="10%">价格</th>
    <th width="10%">类目</th>
    <th width="15%">售卖信息</th>
    <th width="15%">操作</th>
</tr>
<c:forEach items="${allGoods }" var="g">
    <tr>
    <td><p>${g.id }</p></td>
    <td><p><a href="/goods_detail?id=${g.id}" target="_blank"><img src="${pageContext.request.contextPath}${g.image}" width="100px" height="100px"></a></p></td>
    <td><p><a href="/goods_detail?id=${g.id}" target="_blank">${g.name}</a></p></td>
        <td><p>${g.introduce}</p></td>
    <td><p>${g.price}</p></td>
    <td><p>${g.typename}</p></td>
        <td><p>库存：${g.stock}</p>
            <p>销售量：${g.sell}</p>
            <p>发布时间：</p>
            <p>${g.date}</p>
        </td>

        <td>
            <a class="btn btn-success" href="${pageContext.request.contextPath}/goods_editShowServlet?id=${g.id }">修改</a>
            <a class="btn btn-danger" href="${pageContext.request.contextPath}/goods_deleteServlet?id=${g.id }" onclick="return confirm('确认删除?') ">删除</a>
        </td>
        </td>
    </tr>
</c:forEach>
</div>


</div>
    <!--//header-->
    </body>
    </html>
