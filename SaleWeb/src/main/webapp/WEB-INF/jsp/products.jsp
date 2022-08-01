<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<h1 class="text-center text-info p-2">QUẢN LÝ SẢN PHẨM</h1>
<div class="container">
	<form:form method="POST" action="" modelAttribute="product">
		<form:errors path="*" element="div" cssClass="alert alert-danger"></form:errors>
		<div class="form-floating mb-3 mt-3">
			<input type="text" class="form-control" path="name" id="name"
				placeholder="Nhập tên sản phẩm" name="name"> <label
				for="name">Tên sản phẩm</label>
		</div>
		<div class="form-floating mb-3 mt-3">
			<input type="number" class="form-control" path="price" id="price"
				placeholder="Nhập giá sản phẩm" name="price" value="0"> <label
				for="price">Giá sản phẩm</label>
		</div>
		<div class="form-floating">
			<select class="form-select" path="category" id="category"
				name="category">

				<c:forEach items="${categories}" var="category">
					<option value="${category.id}">${category.name}</option>
				</c:forEach>
			</select> <label for="category" class="form-label">Chọn sản phẩm</label>
		</div>
		<div class="mt-4">
			<input type="submit" value="Thêm sản phẩm" class="btn btn-success">
		</div>
	</form:form>
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