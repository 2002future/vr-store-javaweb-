<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/17
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登陆</title>
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="./css/user_register.css">
</head>
<body>
<!--header-->
<jsp:include page="header.jsp">
    <jsp:param name="flag" value="9"></jsp:param>
</jsp:include>
<!--//header-->


<div class="container">
    <form action="user_loginServlet" method="post">

        <%--         注册成功时的跳转提示--%>
            <c:if test="${!empty msg}">
                <div class=" alert alert-danger " style="width: 1200px">${msg}</div>
            </c:if>
        <%--            如果用户名或密码错误时的提示信息--%>
            <c:if test="${!empty failMsg}">
                <div class=" alert alert-danger " style="width: 1200px">${failMsg}</div>
            </c:if>


        <div class="sum">
            <%--  左边区域--%>
            <div class="left">
                <div>没有账号？</div>
                <div>点击这里加入我们吧</div>
                <div>
                   <button> <a href="user_register.jsp">注册</a></button>
                </div>
            </div>
            <%--              右边区域--%>
            <div class="right">
                <div style="margin-top: 25%">用户登录</div>
                <div>

                    <input type="text" placeholder="请输入用户名或密码" name="aUser"></div>
                <div><input type="text" placeholder="请输入密码" name="aPassword" ></div>
                <div class="sumB"><input type="submit" value="登录"></div>
            </div>

        </div>
    </form>
</div>
<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>
<!--//footer-->
</body>
</html>
