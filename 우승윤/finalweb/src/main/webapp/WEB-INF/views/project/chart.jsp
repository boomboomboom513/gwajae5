<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>일별 차트</title>
</head>
<body>
<button type="button" class="btn btn-outline-secondary">
   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backspace" viewBox="0 0 16 16">
  <path d="M5.83 5.146a.5.5 0 0 0 0 .708L7.975 8l-2.147 2.146a.5.5 0 0 0 .707.708l2.147-2.147 2.146 2.147a.5.5 0 0 0 .707-.708L9.39 8l2.146-2.146a.5.5 0 0 0-.707-.708L8.683 7.293 6.536 5.146a.5.5 0 0 0-.707 0z"></path>
  <path d="M13.683 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-7.08a2 2 0 0 1-1.519-.698L.241 8.65a1 1 0 0 1 0-1.302L5.084 1.7A2 2 0 0 1 6.603 1h7.08zm-7.08 1a1 1 0 0 0-.76.35L1 8l4.844 5.65a1 1 0 0 0 .759.35h7.08a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1h-7.08z"></path>
	</svg>
</button>
	<!-- Card Body -->
	<div class="card-body">
		<div class="chart-area">
			<canvas id="myChart1"></canvas>
		</div>
	</div>
	</div>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>
	<!-- Page level plugins -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="vendor/chart.js/Chart.min.js"></script>
	<!-- Page level custom scripts -->

	<!-- chart-js -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.3.2"></script>
	<script src="https://cdn.jsdelivr.net/npm/luxon@1.27.0"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-luxon@1.0.0"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chartjs-plugin-streaming@2.0.0"></script>


	<!-- 스크립트 -->
	<script src="js/demo/chart-js-real-tile.js"></script>
	<script src="js/demo/chart-js-day.js"></script>
</body>
</html>