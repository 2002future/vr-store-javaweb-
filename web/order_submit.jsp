<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>支付</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href=".css/order_submit.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/cart.js"></script>
</head>
<body>







<!--header-->
<jsp:include page="header.jsp"></jsp:include>
<!--//header-->

<div class="cart-items">
    <div class="container">
        <h2>确认收货信息</h2>

        <form class="form-horizontal" action="${pageContext.request.contextPath}/order_confirm" method="post" id="payform">
            <div class="row">
                <img src="${pageContext.request.contextPath}/image/收货人.png" alt=""  style="width: 40px;height: 40px">
                <label class="control-label col-md-1">收货人</label>
                <div class="col-md-6">
                    <input type="text"  class="form-control"  name="name" value="${user.name }" placeholder="输入收货人" required="required"><br>
                </div>
            </div>
            <div class="row">
                <img src="${pageContext.request.contextPath}/image/电话.png" alt=""  style="width: 40px;height: 40px">
                <label class="control-label col-md-1">收货电话</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" name="phone" value="${user.phone }"  placeholder="输入收货电话" required="required"><br>
                </div>
            </div>
            <div class="row">
                <img src="${pageContext.request.contextPath}/image/地址.png" alt=""  style="width: 40px;height: 40px">
                <label class="control-label col-md-1">收货地址</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" name="address" value="${user.address }"  placeholder="输入收货地址" required="required"><br>
                </div>
            </div>

            <br><hr><br>

            <h2>选择支付方式</h2>
            <h3>支付金额: ${order.total }</h3><br><br>


            <div class="col-sm-6 col-md-4 col-lg-3"  >
                <label style="margin-top: 20px">
                    <div class="thumbnail" >
                        <input type="radio" name="paytype" value="1" checked="checked" />
                        <img src="${pageContext.request.contextPath}/image/微信支付.png" alt="微信支付" style="width: 100px;height: 150px">
                        微信支付
                    </div>
                </label>

                <label  >
                    <div class="thumbnail">

                        <input type="radio" name="paytype" value="2"  />
                        <img src="${pageContext.request.contextPath}/image/支付宝支付.jpg" alt="支付宝支付" style="width: 100px;height: 150px">
                        支付宝支付
                    </div>
                </label>
            </div>
            <%--				<div class="col-sm-6 col-md-4 col-lg-3 ">
                                <label>
                                    <div class="thumbnail">
                                        <input type="radio" name="paytype" value="3"  />
                                        <img src="images/offline.jpg" alt="货到付款">
                                    </div>
                                </label>
                            </div>--%>
            <div class="clearfix"> </div>
            <div class="register-but text-center">
                <input type="submit" value="确认支付" class="btn btn-info">
<%--                formaction实现提交到不同的页面       提交到一个Servlet会报错，那个BeanUtil错误--%>
                <input type="submit" value="暂不支付" formaction="${pageContext.request.contextPath}/order_confirm1" class="btn btn-info">
                <div class="clearfix"> </div>
            </div>
        </form>
    </div>
</div>





<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>
<!--//footer-->


<script type="text/javascript">
    function dopay(paytype){
        $("#paytype").val(paytype);
        $("#payform").submit();
    }
</script>

</body>
</html>