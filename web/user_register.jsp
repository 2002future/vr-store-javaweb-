<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/15
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="./css/user_register.css">

</head>
<body>



<!--header-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="10"></jsp:param>
</jsp:include>

<div class="container">
    <form action="user_registerServlet" method="post">
        <%--            如果用户名或密码存在时的提示信息--%>
        <c:if test="${!empty msg}">
            <div class=" alert alert-danger " style="width: 1200px">${msg}</div>
        </c:if>
        <div class="sum">

            <%--              左边区域--%>
            <div class="left">
                <div>已有账号？</div>
                <div>点击这里登陆吧</div>
                <div>
                 <button>  <a href="user_login.jsp">登录</a></button>
                </div>
            </div>
            <%--  右边区域--%>
            <div class="right">
                <div>注册</div>
                <div><input type="text" placeholder="请输入用户名" name="username"></div>
                <div><input type="text" placeholder="请输入邮箱" name="email"></div>
                <div><input type="text" placeholder="请输入密码" name="password"></div>
                <div><input type="text" placeholder="收货人" name="name"></div>
                <div><input type="text" placeholder="收货电话" name="phone"></div>
                <div><input type="text" placeholder="收货地址" name="address"></div>
                <div class="sumB"><input type="submit" value="提交"></div>

            </div>
        </div>
    </form>
</div>
<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>
<!--//footer-->
</body>
</html>
