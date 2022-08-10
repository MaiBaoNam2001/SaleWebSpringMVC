<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h1 class="text-center text-info mt-2">THỐNG KÊ SẢN PHẨM THEO DANH
	MỤC</h1>

<div class="row">
	<div class="col-md-5">
		<table class="table">
			<tr>
				<th>Id</th>
				<th>Tên danh mục</th>
				<th>Số sản phẩm</th>
			</tr>
			<c:forEach items="${stats}" var="stat">
				<tr>
					<td>${stat[0]}</td>
					<td>${stat[1]}</td>
					<td>${stat[2]}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="col-md-7">
		<canvas id="myChart"></canvas>
	</div>
</div>

<div class="row">
	<div class="col-md-5">
		<table class="table">
			<tr>
				<th>Id</th>
				<th>Tên sản phẩm</th>
				<th>Tổng doanh thu</th>
			</tr>
			<c:forEach items="${stats2}" var="stat2">
				<tr>
					<td>${stat2[0]}</td>
					<td>${stat2[1]}</td>
					<td><fmt:formatNumber type="number" value="${stat2[2]}"
							maxFractionDigits="3"></fmt:formatNumber> VND</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="col-md-7">
		<canvas id="myChart2"></canvas>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src='<c:url value="/js/categoryStats.js"/>'></script>
<script>
	window.onload = function() {
		let labels = [];
		let data = [];
		<c:forEach items="${stats}" var="stat">
		labels.push("${stat[1]}")
		data.push(${stat[2]})
		</c:forEach>
		categoryStats(labels, data);
		
		let labels2 = [];
		let data2 = [];
		<c:forEach items="${stats2}" var="stat2">
		labels2.push("${stat2[1]}");
		data2.push(${stat2[2]})
		</c:forEach>
		revenueStats(labels2, data2);
	}
</script>