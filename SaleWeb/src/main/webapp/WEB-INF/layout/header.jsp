<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="javascript:void(0)">SaleWeb Online</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#mynavbar">
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