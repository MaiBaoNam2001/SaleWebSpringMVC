<%@page import="com.mbn.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

				<sec:authorize access="!isAuthenticated()">
					<li class="nav-item"><a class="nav-link text-danger"
						href="<c:url value="/login"/>">Đăng nhập</a></li>
					<li class="nav-item"><a class="nav-link text-danger"
						href="<c:url value="/register"/>">Đăng ký</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item"><a class="nav-link text-danger"
						href="<c:url value="/"/>"> <%
 User currentUser = (User) session.getAttribute("currentUser");
 if (currentUser != null) {
 	out.print(String.format("%s %s", currentUser.getFirstName(), currentUser.getLastName()));
 }
 %> (<sec:authentication property="principal.username" />)
					</a></li>
					<li class="nav-item"><a class="nav-link text-danger"
						href="<c:url value="/logout"/>">Đăng xuất</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item"><a class="nav-link text-danger"
						href="<c:url value="/admin/products"/>">Quản lý sản phẩm</a></li>
				</sec:authorize>
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