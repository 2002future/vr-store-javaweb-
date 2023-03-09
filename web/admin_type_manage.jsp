<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 秋晨未已
  Date: 2022/6/26
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品管理页面</title>
    <link rel="stylesheet" href="./css/admin_goods_manage.css" type="text/css ">
    <link rel="stylesheet" href="./css/admin_index.css" type="text/css ">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <%--    <script type="text/javascript" src="./js/jquery-3.6.0.js"></script>--%>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <%--    <script type="text/javascript" src="./js/bootstrap.bundle.js"></script>--%>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="admin_header.jsp">
    <jsp:param name="flag" value="4"></jsp:param>
    <jsp:param name="typesmanage" value="1"></jsp:param>
</jsp:include>
<div class="container">
<%--    添加类型功能————————————————————————————--%>
    <br>
    <div style="margin-left: 300px">
        <form class="form-inline" method="post" action="${pageContext.request.contextPath}/admin_type_addServlet">
            <input type="text" class="form-control" id="input_name" name="Aname" placeholder="输入类目名称" required="required"
                   style="width: 500px" value="${searchName}">
            <input type="submit" class="btn btn-warning" value="添加类目"/>
        </form>
    </div>
    <br/>
<%--——————————————————————————————————————————————--%>
    <div style="margin-top: 20px;">
        <table class="table table-bordered table-hover">
            <tr>
                <th width="10%">ID</th>
                <th width="10%">类别名称</th>
                <th width="10%">操作</th>
            </tr>
<%--            利用status.index判断修改的是第几个   本来想传一个参数status.index获取下标，从而再次比对，当再次循环的时候通过比对是否相同从而点击修改的时候将text变成input
 成功了，不知道为什么有时候代码部署后，页面不刷新，有点小烦
--%>
            <c:forEach items="${typeList}" var="type" varStatus="status">
            <tr>
                <td><p>${type.id }</p></td>
                <c:if test="${indexs!=status.index}">
                <td><p>${type.name}</p></td>
                    <td>
                        <a class="btn btn-success"
                           href="${pageContext.request.contextPath}/admin_type_manageServlet?editTypeId=${type.id}&indexs=${status.index}">修改名称</a>
                        <a class="btn btn-danger"
                           href="${pageContext.request.contextPath}/type_deleteServlet?id=${type.id }"
                           onclick="return confirm('确认删除?') ">删除</a>
                    </td>

            </c:if>
<%--            ---------------做一个隐藏域获取type,id，typename通过submit提交的时候可获取---------------------------------------%>
            <c:if test="${indexs==status.index}">
                <form action="${pageContext.request.contextPath}/admin_type_editServlet">
                <td><p><input type="text" value="${type.name}" name="typeName"></p></td>
                <td>
                    <a class="btn btn-info" style="float: right"
                       href="${pageContext.request.contextPath}/admin_type_manageServlet">取消</a>
                    <input type="submit" value="确认修改" class="btn btn-danger" style="float: right">
                </td>
                    <input type="hidden" value="${type.id}" name="typeId">
                </form>
            </tr>
            </c:if>
            </c:forEach>
    </div>

</div>
</div>
</body>
</html>
