<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/25
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息修改页面</title>
    <link rel="stylesheet" href="./css/admin_goods_edit.css" type="text/css ">
    <link rel="stylesheet" href="./css/admin_index.css" type="text/css ">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <%--    <script type="text/javascript" src="./js/jquery-3.6.0.js"></script>--%>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <%--    <script type="text/javascript" src="./js/bootstrap.bundle.js"></script>--%>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>

</head>
<body >
<!--header-->
<jsp:include page="admin_header.jsp">
    <jsp:param name="flag" value="3"></jsp:param>
    <jsp:param name="usersmanage" value="3"></jsp:param>
</jsp:include>

<div class="container">
    <%--            如果用户名或密码存在时的提示信息--%>
    <c:if test="${!empty msg}">
        <div class=" alert alert-danger " style="width: 1200px">${msg}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/admin_user_editorServlet" method="post">
        <div class="edit">

            <div>用户名<input type="text" name="username" value="${user.username}"></div>
            <div>邮箱<input type="text" name="email" value="${user.email}"></div>
            <div>收件人<input type="text" name="name" value="${user.name}" style="width: 250px"></div>
            <div>收货电话<input type="text" name="phone" value="${user.phone}"></div>
            <div>收货地址<input type="text" name="address" value="${user.address}"></div>
            <div>密码<input type="text" name="password" value="${user.password}"></div>
            <div><input type="hidden" value="${user.id}" name="user_id"></div>

            <div>   <input type="submit" value="修改" id="sub" style="margin-left: 150px;"></div>
            </div>

    </form>
</div>
</div>
</body>
</html>
