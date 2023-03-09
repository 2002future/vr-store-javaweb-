<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/27
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户修改页面</title>
    <link rel="stylesheet" href="css/user_edit.css">
</head>
<body style="background-color: #f8f6f6">
<!--header-->
<jsp:include page="header.jsp">
    <jsp:param name="flag" value="6"></jsp:param>
    <jsp:param name="usercenter" value="2"></jsp:param>
</jsp:include>
<!--//header-->
<%--            如果用户名或密码存在时的提示信息--%>
<c:if test="${!empty msg}">
    <div class=" alert alert-danger " style="width: 1200px;margin-left: 200px">${msg}</div>
</c:if>
<c:if test="${!empty msg1}">
    <div class=" alert alert-danger " style="width: 1200px;margin-left: 200px">${msg1}</div>
</c:if>
<form action="${pageContext.request.contextPath}/user_editorServlet">
           <div class="lei">
               <div>头像<img src="${pageContext.request.contextPath}/picture/touxiang1.jpg" alt=""
                                  style="width: 80px;height: 80px"></div>
               <div>用户名 <input type="text" value="${user.username}" name="username"></div>
               <div>手机号<input type="text" value="${user.phone}" name="phone"></div>
               <div>邮箱<input type="text" value="${user.email}" name="email"></div>
               <div>密码<input type="text" value="${user.password}" name="password"></div>
               <div>收件人<input type="text" value="${user.name}" name="name"></div>
               <div>收货地址<input type="text" value="${user.address}" name="address"></div>
               <input type="submit" value="确认修改" class="btn btn-danger" style="margin-left: 200px;">
               <input type="hidden" value="${user.id}" name="user_id">
           </div>
</form>
<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>

<!--//footer-->
</body>
</html>
