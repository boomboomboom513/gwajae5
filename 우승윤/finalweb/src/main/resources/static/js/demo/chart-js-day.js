(function() {
	const config = {
		type: 'line',
		data: {
			labels: [],
			datasets: [
				{
					label: 'endprice',
					data: [],
					backgroundColor: 'rgba(54, 162, 235, 0.5)',
					borderColor: 'rgba(54, 162, 235, 1)',
					fill: 'start',
					pointBorderWidth: 0,
					pointStyle: false
				},
				{
					label: 'startprice',
					data: [],
					backgroundColor: 'rgba(255, 99, 132, 0.5)',
					borderColor: 'rgba(255, 99, 132, 1)',
					fill: 'start',
					pointBorderWidth: 0,
					pointStyle: false
				},
				{
					label: 'highprice',
					data: [],
					backgroundColor: 'rgba(255, 205, 86, 0.5)',
					borderColor: 'rgba(255, 205, 86, 1)',
					fill: 'start',
					pointBorderWidth: 0,
					pointStyle: false
				},
				{
					label: 'lowprice',
					data: [],
					backgroundColor: 'rgba(75, 192, 192, 0.5)',
					borderColor: 'rgba(75, 192, 192, 1)',
					fill: 'start',
					pointBorderWidth: 0,
					pointStyle: false
				}
			]
		},
		options: {
			scales: {
				x: {
					type: 'time',
					time: {
						unit: 'day',
						displayFormats: {
							day: 'DD'
						}
					}
				},
				y: {
					position: 'left'
				}
			}
		}
	};

	const myChart1 = new Chart(
		document.getElementById('myChart1'),
		config
	);

	async function fetchData() {
		const response = await fetch('/main/data');
		const dataFromDB = await response.json();

		const labels = dataFromDB.map((data) => data.date);
		const dataset1 = dataFromDB.map((data) => data.endprice);
		const dataset2 = dataFromDB.map((data) => data.startprice);
		const dataset3 = dataFromDB.map((data) => data.highprice);
		const dataset4 = dataFromDB.map((data) => data.lowprice); // Added lowprice dataset

		myChart1.data.labels = labels;
		myChart1.data.datasets[0].data = dataset1;
		myChart1.data.datasets[1].data = dataset2;
		myChart1.data.datasets[2].data = dataset3;
		myChart1.data.datasets[3].data = dataset4; // Assigning lowprice dataset

		myChart1.update();
	}

	fetchData(); // Initial data fetch

	// Update data at desired time interval
	setInterval(fetchData, 5000); // For example, update data every 5 seconds
})();
