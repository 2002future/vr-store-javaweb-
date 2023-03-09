<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/18
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>热销产品</title>
    <link rel="stylesheet" href="./css/index.css" type="text/css ">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
</head>
<body style="background-color: #f8f6f6">
<!--菜单栏区域-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="2"></jsp:param>
</jsp:include>

<div class="container1" style="border-top:none;" >
    <div id="news">热销产品</div>
    <c:forEach var="good1" items="${allSellGoods}">
        <div class="row">
            <div class="col-md-3 gallery-grid">
                <div class="moBan" >
                    <div class="moBan1" >
                        <div><img class="imgA" src="${pageContext.request.contextPath}${good1.image}" alt=""/></div>
                        <div class="nameA"><a href="${pageContext.request.contextPath}/goods_detailServlet?id=${good1.id}">${good1.name}</a></div>
                        <div class="pri">￥${good1.price}</div>
                    </div>
                    <div class="fun">
                        <div class="sell">已售：${good1.sell}</div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<!--footer-->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
