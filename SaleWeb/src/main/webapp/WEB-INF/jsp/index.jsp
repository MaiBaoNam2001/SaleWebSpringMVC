<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<a href="<c:url value="/products/${product.id}"/>"
							class="btn btn-primary">Xem chi tiết</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<ul class="pagination justify-content-center pt-2">
	<c:forEach begin="1" end="${Math.ceil(productCounter/pageSize)}"
		var="index">
		<c:url value="/" var="url">
			<c:param name="page" value="${index}"></c:param>
		</c:url>
		<li class="page-item"><a class="page-link" href="${url}">${index}</a></li>
	</c:forEach>
</ul>