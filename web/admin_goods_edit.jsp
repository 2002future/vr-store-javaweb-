<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/25
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品信息修改页面</title>
    <link rel="stylesheet" href="./css/admin_goods_edit.css" type="text/css ">
    <link rel="stylesheet" href="./css/admin_index.css" type="text/css ">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <%--    <script type="text/javascript" src="./js/jquery-3.6.0.js"></script>--%>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <%--    <script type="text/javascript" src="./js/bootstrap.bundle.js"></script>--%>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>

</head>
<body >
<!--header-->
<jsp:include page="admin_header.jsp">
    <jsp:param name="flag" value="2"></jsp:param>
    <jsp:param name="goodsmanage" value="3"></jsp:param>
</jsp:include>

<div class="container">
    <form action="${pageContext.request.contextPath}/goods_editServlet" method="post">
   <div class="edit">
    <div>名称<input type="text" name="name" value="${good.name}"></div>
    <div>价格<input type="text" name="price" value="${good.price}"></div>
    <div>介绍<input type="text" name="introduce" value="${good.introduce}"></div>
    <div>库存<input type="text" name="stock" value="${good.stock}"></div>
    <div>销量<input type="text" name="sell" value="${good.sell}"></div>
    <div>发布日期<input type="date" name="date" value="${good.date}"></div>
    <div>图片<img src="${pageContext.request.contextPath }${good.image}" width="100" height="85" id="picture"/>  </div>
            <%--        文件夹的导入--%>
      <div> <input type="file" name="image"  id="input_file" ></div>
       <div style="margin-left: 40px"> <span>推荐尺寸: 600 * 500 </span></div>

       <div class="form-group">
           <label for="select_topic" class="col-sm-1 control-label">类别</label>
           <div class="col-sm-6">
               <select class="form-control" id="select_topic" name="typeid">

                   <c:forEach items="${typeList1 }" var="t">
                       <option <c:if test="${t.id==good.type.id }">selected="selected"</c:if> value="${t.id }">${t.name }</option>
                   </c:forEach>

               </select>
           </div>
       </div>
    <input type="submit" value="修改" id="sub">
    </form>
</div>
</div>
</body>
</html>
