<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="text-center text-info mt-2">CHI TIẾT SẢN PHẨM</h1>

<div class="container-fuild p-4">
	<div class="row">
		<div class="col-md-5">
			<img alt="${product.name}" src="${product.image}" class="img-fluid">
		</div>
		<div class="col-md-7">
			<h1>${product.name}</h1>
			<h2>
				<fmt:setLocale value="vi_VN" />
				<fmt:formatNumber type="currency" value="${product.price}"></fmt:formatNumber>
			</h2>
		</div>
	</div>
</div>

<c:url value="/api/products/${product.id}/comments" var="endpoint" />

<p class="mx-3 fw-bold">Bình luận:</p>
<div class="list-group mt-2" id="comment"></div>

<div class="container-fluid">
	<div class="form-group my-4">
		<textarea class="form-control" placeholder="Nhập nội dung bình luận"
			id="content"></textarea>
	</div>
	<div class="form-group">
		<button class="btn btn-success"
			onclick="addComment('${endpoint}', ${product.id})">Thêm bình
			luận</button>
	</div>
</div>

<script src="<c:url value="/js/comments.js"/>"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script>
	window.onload = function() {
		loadComments("${endpoint}", ${product.id});
	}
</script>