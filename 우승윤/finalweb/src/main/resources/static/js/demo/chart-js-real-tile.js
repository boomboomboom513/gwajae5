// realtime-chart.js 파일
// 차트를 초기화하는 설정입니다.
const config = {
  type: 'line',
  data: {
    datasets: [
      {
        label: 'endprice',
        data: [], // Empty array for the endprice dataset
        backgroundColor: 'rgba(54, 162, 235, 0.5)',
        borderColor: 'rgba(54, 162, 235, 1)',
        pointBorderWidth: 0,
        pointStyle: false,
        pointBackgroundColor: 'rgba(54, 162, 235, 0)',
      },
      {
        label: 'startprice',
        data: [], // Empty array for the startprice dataset
        backgroundColor: 'rgba(255, 99, 132, 0.5)',
        borderColor: 'rgba(255, 99, 132, 1)',
        pointBorderWidth: 0,
        pointStyle: false,
        pointBackgroundColor: 'rgba(255, 99, 132, 0)',
      },
      {
        label: 'highprice',
        data: [], // Empty array for the highprice dataset
        backgroundColor: 'rgba(75, 192, 192, 0.5)',
        borderColor: 'rgba(75, 192, 192, 1)',
        pointBorderWidth: 0,
        pointStyle: false,
        pointBackgroundColor: 'rgba(75, 192, 192, 0)',
      },
      {
        label: 'lowprice',
        data: [], // Empty array for the lowprice dataset
        backgroundColor: 'rgba(255, 206, 86, 0.5)',
        borderColor: 'rgba(255, 206, 86, 1)',
        pointBorderWidth: 0,
        pointStyle: false,
        pointBackgroundColor: 'rgba(255, 206, 86, 0)',
      },
    ],
  },
  options: {
    plugins: {
      streaming: {
        duration: 60000, // 1 minute duration
      },
    },
    scales: {
      x: {
        type: 'realtime',
        realtime: {
          duration: 3600000, // 1 minute duration
          onRefresh: async (chart) => {
            // 웹소켓을 통해 데이터를 수신할 예정입니다.
            // 서버로부터 데이터를 받으면 아래의 코드가 실행됩니다.
            // 받은 데이터를 chart에 추가하는 로직을 작성하세요.
          },
        },
      },
    },
  },
};

// 'myChart'라는 ID를 가진 요소에 config 설정으로 차트 생성
const myChart = new Chart(document.getElementById('myChart'), config);

// 실시간 데이터를 위한 WebSocket 연결
const socket = new WebSocket('ws://localhost:8090/websocket'); // 실제 서버 주소에 맞게 변경해야 합니다.

socket.onopen = () => {
  console.log('WebSocket 연결이 열렸습니다.');
};

socket.onmessage = (event) => {
  const receivedData = JSON.parse(event.data); // 서버에서 받은 데이터를 JSON 형식으로 파싱

  // 서버로부터 받은 데이터를 차트에 추가
  const timestamp = Date.now();
  myChart.data.datasets[0].data.push({
    x: timestamp,
    y: receivedData[0].endprice,
  });
  myChart.data.datasets[1].data.push({
    x: timestamp,
    y: receivedData[0].startprice,
  });
  myChart.data.datasets[2].data.push({
    x: timestamp,
    y: receivedData[0].highprice,
  });
  myChart.data.datasets[3].data.push({
    x: timestamp,
    y: receivedData[0].lowprice,
  });

  // 새로운 데이터 지점으로 차트 업데이트
  myChart.update();
};

socket.onclose = () => {
  console.log('WebSocket 연결이 닫혔습니다.');
};
