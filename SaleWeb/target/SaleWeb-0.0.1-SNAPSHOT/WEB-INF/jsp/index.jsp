<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Trang chủ &#127968;</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="javascript:void(0)">SaleWeb Online</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#mynavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(0)">Trang chủ</a></li>
					<c:forEach items="${categories}" var="category">
						<c:url value="/" var="cUrl">
							<c:param name="cateId" value="${category.id}"></c:param>
						</c:url>
						<li class="nav-item"><a class="nav-link" href="${cUrl}">${category.name}</a></li>
					</c:forEach>
				</ul>
				<c:url value="/" var="action"></c:url>
				<form action="${action}" class="d-flex">
					<input class="form-control me-2" type="text"
						placeholder="Nhập từ khóa..." name="keyword">
					<button type="submit" class="btn btn-primary" type="button">Tìm</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="container">
		<c:if test="${products.size() == 0}">
			<p>
				<em>Không có sản phẩm nào!</em>
			</p>
		</c:if>
		<div class="row">
			<c:forEach items="${products}" var="product">
				<div class="col-md-3 col-xs-12 p-2">
					<div class="card">
						<img class="card-img-top img-fluid"
							src="https://cdn.tgdd.vn/Products/Images/522/238626/ipad-pro-2021-11-inch-silver-600x600.jpg"
							alt="${product.name}">
						<div class="card-body">
							<h4 class="card-title">${product.name}</h4>
							<p class="card-text">
								<fmt:setLocale value="vi_VN" />
								<fmt:formatNumber value="${product.price}" type="currency" />
							</p>
							<a href="#" class="btn btn-primary">Xem chi tiết</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="mt-4 p-5 bg-primary text-white rounded">
		<h1>SaleWeb Online</h1>
		<p>MBN &copy; 2022</p>
	</div>
</body>
</html>