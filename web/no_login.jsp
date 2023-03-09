<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/27
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>暂未登陆</title>
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
</head>
<body>
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="1"></jsp:param>
</jsp:include>
<%--         注册成功时的跳转提示--%>
<c:if test="${!empty failMsg1}">
    <div class=" alert alert-danger " style="width: 100%">${failMsg1}</div>
</c:if>
  <div > <img src="${pageContext.request.contextPath}/image/nologin.jpg" alt=""  style="height: 600px;width: 1519px" ></div>
<div style="font-size: 14px;color: red;margin-left: 500px">您还未登录，请点击这里登录<a href="${pageContext.request.contextPath}/user_login.jsp" class="btn btn-info">登录</a></div>

</body>
</html>
