<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/5/28
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--行热部署添加到images上面，然后重启IEAD,然后out的信息也编译了，这样图片就显示出来了-  在tomcat里部署picture，不然要重启才能显示
择完文件所在目录之后如下图所示，application context 选项配置文件/图片的路径，我的图片/文件路径是以/files/项目名称/图片名字/id，如：/files/xxx/asdfsdaf.jpg/.png--%>
<html>
<head>
    <title>VR设备商城首页</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./css/index.css" type="text/css ">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
<%--    <script type="text/javascript" src="./js/jquery-3.6.0.js"></script>--%>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
<%--    <script type="text/javascript" src="./js/bootstrap.bundle.js"></script>--%>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>


</head>

<body style="background-color: #f8f6f6">

<!--菜单栏区域-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="1"></jsp:param>
</jsp:include>
<%--  打开的时候先Servlet 随便用一个吧--%>
<c:if test="${empty newsGoods}">
    <c:redirect url="/indexServlet"></c:redirect>
</c:if>
<%--   轮播图层--%>
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active" ></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1" >></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2" >></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="3">></li>
    </ol>
    <div class="carousel-inner ">
        <div class="carousel-item active" data-interval="3000">

            <a href="${pageContext.request.contextPath}/goods_detailServlet?id=${scrollGood[0].id}">
                <img src="${pageContext.request.contextPath}${scrollGood[0].scroll}" class="d-block w-100"   alt="..." style="width: 800px;height: 400px">
            </a>
        </div>
        <c:forEach  var="scroll"  items="${scrollGood}" begin="1">
            <div class="carousel-item " data-interval="3000">
                <a href="${pageContext.request.contextPath}/goods_detailServlet?id=${scroll.id}">
                <img  src="${pageContext.request.contextPath}${scroll.scroll}" class="d-block w-100"  alt="..." style="width: 800px;height: 400px">
                </a>
            </div>
        </c:forEach>
    </div>
    <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </button>
</div>
<%-----____________________________________新品推荐_________________________________________________________--%>
<div class="container1" style="border-top:none;">
    <div id="news">新品推荐 <span class="lookMore"><a href="${pageContext.request.contextPath}/goods_NewsServlet">查看更多>></a></span></div>
    <c:forEach var="good" items="${newsGoods}">
        <div class="row">
            <div class="col-md-3 gallery-grid">
                <div class="moBan" >
                    <div class="moBan1" >
                        <div><img class="imgA" src="${pageContext.request.contextPath}${good.image}" alt=""/></div>
                        <div class="nameA"><a href="${pageContext.request.contextPath}/goods_detailServlet?id=${good.id}">${good.name}</a></div>
                        <div class="pri">￥${good.price}</div>
                    </div>
                    <div class="fun">
                        <div class="sell">${good.date}</div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
    <%-----____________________________________热销产品_________________________________________________________--%>
<div class="container1" >
    <div id="news">热销产品 <span class="lookMore"><a href="${pageContext.request.contextPath}/goods_hotSellServlet">查看更多>></a></span></div>
    <c:forEach var="good1" items="${sellGoods}">
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
