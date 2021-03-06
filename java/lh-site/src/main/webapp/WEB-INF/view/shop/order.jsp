<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=1">
<meta name="renderer" content="webkit">
<title>确认订单</title>
<link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctx}/static/css/base.css">
<link rel="stylesheet" href="${ctx}/static/css/shop/cart.css">
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<div class="jumbotron">
	  <div class="container">
	  	<h1>确认订单</h1>
	  	<p>提交订单祝你购物愉快</p>
	  </div>
	</div>
	<div class="container order">			
		<table class="table">
			<thead><tr> <th>商品信息</th> <th></th> <th></th>   </tr> </thead>
			<tbody>
				<c:set var="amount" value="0"></c:set>
				<c:forEach var="course" items="${listCourse }">
					<c:set var="amount" value="${amount+course.price }"></c:set> 
					<tr>
						<td><img src="${course.cover }" width="75"></td>
						<td><p>${course.name }</p></td>
						<td>￥${course.price }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="col-md-12 text-right">
			总计: <span class="cost_price">￥${amount}</span><br>
			<a class="btn btn-primary btn-large btn-submit" href="${ctx }/shop/payment">提交订单<i class="glyphicon glyphicon-chevron-right"></i></a>
		</div>
	</div>
	<%@ include file="../common/bottom.jsp" %>
</body>
</html>