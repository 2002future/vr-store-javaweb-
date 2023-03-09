<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/18
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情页面</title>
    <link rel="stylesheet" href="./css/goods_detail.css">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="js/cart.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>
<body>
<!--header-->
<jsp:include page="/header.jsp"></jsp:include>
<!--//header-->
<div class="container">
    <%--    图片区域--%>
    <div class="amM">
        <div class="container1">
            <div><img src="${pageContext.request.contextPath}${g.image}" alt=""></div>
        </div>
        <%--        信息区域--%>
        <div class="msg">
            <div>类型：${g.type.name}</div>
            <div>发布时间：${g.date}</div>
            <div>销量：${g.sell}件</div>
            <div>库存：${g.stock}件</div>
        </div>
    </div>
    <%--    内容区域--%>
    <div class="contain">
        <div>${g.name}</div>
        <div>${g.introduce}</div>
        <div>￥${g.price}</div>

        <div> <button ><a href="#"  onclick="buy(${g.id})" >加入购物车</a> </button></div>
          <div id="msg"></div>
    </div>
</div>


<!--footer-->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
