<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/26
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>用户添加页面</title>
  <link rel="stylesheet" href="./css/admin_goods_edit.css" type="text/css ">
</head>

<body>
<jsp:include page="admin_header.jsp">
  <jsp:param name="flag" value="3"></jsp:param>
  <jsp:param name="usersmanage" value="2"></jsp:param>
</jsp:include>
<div class="container">
  <%--            如果用户名或密码存在时的提示信息--%>
  <c:if test="${!empty msg2}">
    <div class=" alert alert-danger " style="width: 1200px">${msg2}</div>
  </c:if>
  <form action="${pageContext.request.contextPath}/users_addServlet" method="post">
    <div class="edit">
      <div>用户名<input type="text" name="username" ></div>
      <div>邮箱<input type="text" name="email" ></div>
      <div>密码<input type="text" name="password"  style="width: 250px;height: 45px"></div>
      <div>收货人<input type="text" name="name"></div>
      <div>手机号<input type="text" name="phone" ></div>
      <div>收货地址<input type="text" name="address"></div>
      <input type="submit" value="添加" id="sub">
    </div>
  </form>
</div>
</body>
</html>
