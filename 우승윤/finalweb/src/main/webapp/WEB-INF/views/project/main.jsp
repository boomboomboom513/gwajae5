<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Stock Trading</title>
<style>
#myChart {
	max-height: 100%;
}

#myChart1 {
	max-height: 100%;
}

thead.table-dark {
	background: #5B86EF;
	color: #fff;
}
 .center-button {
    display: flex;
    justify-content: center;
  }
/* .rwd-table {
    margin: auto;
    width: 95%;
    border-collapse: collapse;
}

.rwd-table tr:first-child {
    background: #5B86EF;
    color: #fff;
} */
</style>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="main">
				<div class="sidebar-brand-icon rotate-n-15"></div>
				<div class="sidebar-brand-text mx-3">Predict Trading</div>
			</a>
			<hr class="sidebar-divider my-0">
			<li class="nav-item">
			<a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> 
				<i class="fas fa-fw fa-wrench"></i> <span>주식 정보</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar" > 
					<div class="bg-white py-2 collapse-inner rounded">
					<div class="center-button">
						    <button button type="button" class="btn btn-secondary" onclick="getDataFromAPI()">stock</button>
						  </div>	
							<a class="collapse-item">수익: <span id="result">...</span></a>  
						</div>
					</div></li>

			<hr class="sidebar-divider my-0">
			<hr class="sidebar-divider d-none d-md-block">
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</ul>

		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Topbar -->
			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
				</div>

				<div style="display: flex; align-items: center;">
					<a href="https://www.lunit.io/en/careers" target="_blank"
						rel="noopener noreferrer"> <img class="h3 mb-0"
						src="img/lunit.jpg" alt="Lunit"
						style="width: 50px; height: 50px; margin-left: 10px;">
					</a>
					<h1 class="h3 mb-0 text-gray-800">
						<strong> &nbsp Lunit</strong>
					</h1>
					<h0>&nbsp&nbsp 328130</h0>
				</div>


				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop"
					class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>
			</nav>
			<p>&nbsp&nbsp 데이터는 1분마다 업데이트 됩니다.</p>

			<div class="container-fluid">
				<!-- Content Row -->
				<div class="row">

					<div class="col-xl-3 col-md-6 mb-4" id="closingPrices">
						<div class="card shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="m-0 font-weight-bold text-primary text-uppercase mb-2">종가
											(Closing Prices)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800"
											id="closingPriceValue">Loading...</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-md-6 mb-4" id="openPrice">
						<div class="card shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="m-0 font-weight-bold text-primary text-uppercase mb-2">시가
											(Open Price)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800"
											id="openPriceValue">Loading...</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-md-6 mb-4" id="lowPrice">
						<div class="card  shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="m-0 font-weight-bold text-primary text-uppercase mb-2">저가
											(Low Price)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800"
											id="lowPriceValue">Loading...</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-md-6 mb-4" id="highPrice">
						<div class="card shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="m-0 font-weight-bold text-primary text-uppercase mb-2">고가(High
											Price)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800"
											id="highPriceValue">Loading...</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 그래프 그리기  -->
					<div class="row">
						<div class="col-lg-6 md-4">
							<div class="card shadow mb-4">
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">분봉 그래프</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myChart"></canvas>
									</div>
								</div>
							</div>
							<div class="card shadow mb-4">
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">일별 그래프</h6>
								<i class="bi bi-fullscreen"></i>
								<a href="http://localhost:8090/chart" target="_blank">
								<button type="button" class="btn btn-outline-secondary"
									id="loginButton" >
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-fullscreen"
										viewBox="0 0 16 16">
									        <path
											d="M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM .5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a .5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z"></path>
									    </svg>
								</button>
								</a>
							</div>
						
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-area">
									<canvas id="myChart1"></canvas>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6 mb-4" style="float: right">
						<div class="card shadow mb-4">
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary text-right"
									style="width: auto;">NEWS</h6>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable">
										<thead>
											<tr>
												<td style="text-align: left;">날짜</td>
												<td style="text-align: left;">제목</td>

											</tr>
										</thead>
										<tbody>
											<c:forEach items="${news}" var="list">
												<tr>
													<td style="text-align: left;">${list.date}</td>
													<td style="text-align: left;">${list.title}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- 뉴스 -->
				</div>
			</div>

				<!--차트 스크립트--
					<!-- Bootstrap core JavaScript-->
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
				<script
					src="https://cdn.jsdelivr.net/npm/chartjs-adapter-luxon@1.0.0"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/chartjs-plugin-streaming@2.0.0"></script>


				<!-- 스크립트 -->
				<script src="js/demo/chart-js-real-tile.js"></script>
				<script src="js/demo/chart-js-day.js"></script>


				<script>
					function updateValues() {
						const xhr = new XMLHttpRequest();
						xhr.open('GET', 'http://localhost:8090/chart/data',
								true);
						xhr.onload = function() {
							if (xhr.status === 200) {
								const data = JSON.parse(xhr.responseText);
								document.getElementById('closingPriceValue').innerText = data[0].endprice
										+ '원';
								document.getElementById('openPriceValue').innerText = data[0].startprice
										+ '원';

								// Update the low prices value
								document.getElementById('lowPriceValue').innerText = data[0].lowprice
										+ '원';

								// Update the high prices value
								document.getElementById('highPriceValue').innerText = data[0].highprice
										+ '원';
							} else {
								console.error('Request failed. Status:',
										xhr.status);
							}
						};
						xhr.onerror = function() {
							console
									.error('Request failed. Check the URL or server settings.');
						};
						xhr.send();
					}

					// Call the function initially to load the values immediately
					updateValues();

					// Set the interval to update the values every 50 seconds
					setInterval(updateValues, 1000);
				</script>
				<!-- 수익률 -->
				<script>
	    function getDataFromAPI() {
	        var xhr = new XMLHttpRequest();
	        xhr.open("GET", "http://localhost:8090/stock/data", true);
	
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState === XMLHttpRequest.DONE) {
	                if (xhr.status === 200) {
	                    const data = JSON.parse(xhr.responseText);
	                    const stockData = data[0];

	                    document.getElementById("result").innerText = stockData.result;
	                } else {
	                    console.error("Error fetching data:", xhr.status);
	                }
	            }
	        };
	
	        xhr.send();
	    }
</script>

				
</body>
</html>