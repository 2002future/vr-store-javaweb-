<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/26
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理页面</title>
    <link rel="stylesheet" href="./css/admin_goods_manage.css" type="text/css ">
    <link rel="stylesheet" href="./css/admin_index.css" type="text/css ">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <%--    <script type="text/javascript" src="./js/jquery-3.6.0.js"></script>--%>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <%--    <script type="text/javascript" src="./js/bootstrap.bundle.js"></script>--%>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="admin_header.jsp">
    <jsp:param name="flag" value="3"></jsp:param>
    <jsp:param name="usersmanage" value="1"></jsp:param>
</jsp:include>
<div style="margin-left: 250px;margin-top: 20px;margin-right: 100px">
    <table class="table table-bordered table-hover">
        <tr>
            <th width="3%">ID</th>
            <th width="5%">用户名</th>
            <th width="15%">email</th>
            <th width="5%">收件人</th>
            <th width="15%">电话</th>
            <th width="15%">地址</th>
            <th width="18%">操作</th>
        </tr>
        <c:forEach items="${users}" var="user">
        <tr>
            <td><p>${user.id }</p></td>
            <td><p>${user.username}</p></td>
            <td><p>${user.email}</p></td>
            <td><p>${user.name}</p></td>
            <td><p>${user.phone}</p></td>
            <td><p>${user.address}</p></td>
            <td>

                <a class="btn btn-success" href="${pageContext.request.contextPath}/user_editShowServlet?id=${user.id }">修改</a>
                <a class="btn btn-danger" href="${pageContext.request.contextPath}/user_deleteServlet?id=${user.id }" onclick="return confirm('确认删除?') ">删除</a>
            </td>
            </td>
        </tr>
        </c:forEach>
</div>


</div>
</body>
</html>
