<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký tài khoản</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1 class="text-center text-info mt-2">ĐĂNG KÝ TÀI KHOẢN</h1>
	<div class="container">
		<form:form method="POST" action="" modelAttribute="user">
			<form:errors path="*" element="div" cssClass="alert alert-danger"></form:errors>
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" path="firstName"
					id="firstName" placeholder="Nhập tên" name="firstName"> <label
					for="firstName">Tên</label>
			</div>
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" path="lastName"
					id="lastName" placeholder="Nhập họ" name="lastName"> <label
					for="lastName">Họ</label>
			</div>
			<div class="form-floating mb-3 mt-3">
				<input type="email" class="form-control" path="email" id="email"
					placeholder="Nhập email" name="email"> <label for="email">Email</label>
			</div>
			<div class="form-floating mb-3 mt-3">
				<input type="tel" class="form-control" path="phone" id="phone"
					placeholder="Nhập số điện thoại" name="phone"> <label
					for="phone">Số điện thoại</label>
			</div>
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" path="username"
					id="username" placeholder="Nhập tên người dùng" name="username">
				<label for="username">Tên người dùng</label>
			</div>
			<div class="form-floating mb-3 mt-3">
				<input type="password" class="form-control" path="password"
					id="password" placeholder="Nhập mật khẩu" name="password">
				<label for="password">Mật khẩu</label>
			</div>
			<div class="mt-4">
				<button type="submit" class="btn btn-success">Đăng ký</button>
			</div>
		</form:form>
	</div>
</body>
</html>