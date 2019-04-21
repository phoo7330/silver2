<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html><head><meta charset="utf-8">
<title>원 그래프</title>

<!-- // 자바스크립트 라이브러리를 읽어들임.
// 가장 먼저 읽어들이는 것은 Google의 JSAPI이다. 이 API를 읽어들임으로써 load 메소드 사용 가능  -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">

	// 어떤 그래프를 사용할지 지정 : Google Visualization 라이브러리 로드 
	google.load('visualization', '1.0', {'packages':['corechart']});

	// 그래프 API 로드가 완료되면 실행할 수 있도록 이벤트 지정 
	google.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = new google.visualization.DataTable();

		data.addColumn('string', '인물');
		data.addColumn('number', '취득표');

		data.addRows([
				['티모', 51],
				['베인', 34],
				['문도', 20],
				['이즈리얼', 11],
				['아리', 8],
				['애쉬', 4],
		]);

		// 그래프의 옵션을 지정 
		var opt = {
			'title': '인기 투표',
			'width': 600,
			'height': 400,
			pieSliceText: 'label',
			legend: 'none'
		};

		var chart = new google.visualization.PieChart(
				document.getElementById('chart_div'));
		chart.draw(data, opt);

	}
</script>
</head><body>
	<div id="chart_div"></div>
</body></html>
	