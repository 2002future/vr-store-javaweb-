<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/19
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品搜索页面</title>
    <link rel="stylesheet" href="./css/index.css" type="text/css ">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
</head>
<body>
<!--菜单栏区域-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="5"></jsp:param>
</jsp:include>


<%-----____________________________________查询结果________________________________________________________--%>
<div class="container1" >
    <div id="news">查询结果如下：</div>
    <c:forEach var="good2" items="${searchGoods}">
        <div class="row">
            <div class="col-md-3 gallery-grid">
                <div class="moBan" >
                    <div class="moBan1" >
                        <div><img class="imgA" src="${pageContext.request.contextPath}${good2.image}" alt=""/></div>
                        <div class="nameA"><a href="${pageContext.request.contextPath}/goods_detailServlet?id=${good2.id}">${good2.name}</a></div>
                        <div class="pri">￥${good2.price}</div>
                    </div>
                    <div class="fun">
                        <div class="sell">已售：${good2.sell}</div>
                    </div>
                </div>
            </div>
        </div>+
    </c:forEach>
</div>
<!--footer-->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
