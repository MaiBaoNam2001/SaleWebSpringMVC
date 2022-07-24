<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="text-center text-info p-2">QUẢN LÝ SẢN PHẨM</h1>
<div class="container">
	<div class="spinner-border text-info" id="spinner"></div>
	<table class="table">
		<thead>
			<tr>
				<th></th>
				<th>Tên sản phẩm</th>
				<th>Giá</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="productList"></tbody>
	</table>
</div>
<script src="<c:url value="/js/products.js"/>"></script>
<script>
	<c:url value="/api/products" var="endpoint"/>
	window.onload = function() {
		loadAdminProduct("${endpoint}");
	}
</script>