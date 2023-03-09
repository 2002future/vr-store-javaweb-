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
    <title>管理员首页</title>
    <link rel="stylesheet" href="./css/index.css" type="text/css ">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <%--    <script type="text/javascript" src="./js/jquery-3.6.0.js"></script>--%>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <%--    <script type="text/javascript" src="./js/bootstrap.bundle.js"></script>--%>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>

</head>
<body>
<!--header-->
<jsp:include page="admin_header.jsp">
    <jsp:param name="flag" value="1"></jsp:param>
</jsp:include>

<div class="alert alert-success" role="alert">恭喜你! 登录成功了</div>

<!--//header-->
</body>
</html>
