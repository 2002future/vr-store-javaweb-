<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/19
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品分类页面</title>
    <link rel="stylesheet" href="./css/index.css" type="text/css ">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
</head>
<body style="background-color: #f8f6f6">
<!--菜单栏区域-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="4"></jsp:param>
</jsp:include>
<%-----____________________________________新品推荐_________________________________________________________--%>
<div class="container1" style="border-top:none;">
    <div id="news">
        <c:choose><c:when test="${!empty msg1}">全部商品</c:when><c:otherwise> ${goodsList[0].typename}</c:otherwise>
        </c:choose>
        <span class="lookMore"><a href="${pageContext.request.contextPath}/goods_FenLeiServlet">查看更多>></a></span>
    </div>

    <c:forEach var="good" items="${goodsList}">
        <div class="row">
            <div class="col-md-3 gallery-grid">
                <div class="moBan">
                    <div class="moBan1">
                        <div><img class="imgA" src="${pageContext.request.contextPath}${good.image}" alt=""/></div>
                        <div class="nameA"><a
                                href="${pageContext.request.contextPath}/goods_detailServlet?id=${good.id}">${good.name}</a>
                        </div>
                        <div class="pri">￥${good.price}</div>
                    </div>

                </div>
            </div>
        </div>
    </c:forEach>
</div>
</div>
<!--footer-->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
