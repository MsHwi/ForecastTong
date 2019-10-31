<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 날씨 정보</title>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {

		// 실시간  데이터 
		var grib = $('#grib').val();
// 		alert(grib);
		var jsongrib= $.parseJSON('[' + grib + ']');
		var gribTime = jsongrib[0].response.body.items.item[0].baseTime;
		$("#time").append("<td>" + gribTime + "</td>");
		
		var baseDate = jsongrib[0].response.body.items.item[0].baseDate;						
		var baseTime = jsongrib[0].response.body.items.item[0].baseTime;
		
		$("#fcst_time").text(baseDate+" "+ baseTime+"시 발표");
		
		var windir_Value = jsongrib[0].response.body.items.item[7].obsrValue;
		var windpow_Value = jsongrib[0].response.body.items.item[9].obsrValue;
								if (windir_Value == 0 || windir_Value == 360) {
									var windir_Value = "북";
								} else if (windir_Value > 0 && windir_Value < 90) {
									var windir_Value = "북동";
								} else if (windir_Value == 90) {
									var windir_Value = "동";
								} else if (windir_Value > 90 && windir_Value < 180) {
									var windir_Value = "남동";
								} else if (windir_Value == 180) {
									var windir_Value = "남";
								} else if (windir_Value > 180 && windir_Value < 270) {
									var windir_Value = "남서";
								} else if (windir_Value == 270) {
									var windir_Value = "서";
								} else if (windir_Value > 270 && windir_Value < 360) {
									var windir_Value = "북서";
								}
		$("#winddir").append(
				"<td style='text-align:left'>" + "<b>풍향: </b>" + windir_Value +"풍</td>");
		$("#windpow").append(
				"<td style='text-align:left;'>" + "<b>풍속: </b>" + windpow_Value +"m/s</td>");
		var humidity_Value = jsongrib[0].response.body.items.item[2].obsrValue;
		$("#humid").append(
				"<td style='text-align:left;'>" + "<b>습도: </b>" + humidity_Value + "%</td>");
		var rain_Value = jsongrib[0].response.body.items.item[3].obsrValue;
		$("#1h").append(
				"<td style='text-align:left;'>" + "<b>1시간 강수량: </b>" + rain_Value + "mm</td>");
		var sky_Value = jsongrib[0].response.body.items.item[4].obsrValue;
			switch (sky_Value) {
								case 1:
									var sky_Value = "맑음";
									break;
								case 2:
									var sky_Value = "구름조금";
									break;
								case 3:
									var sky_Value = "구름많음";
									break;
								case 4:
									var sky_Value = "흐림";
									break;
			
								}
		$("#sky").append("<td style='text-align:left;'><b>날씨: </b>"  + sky_Value +"</td>");
		var temp_Value = jsongrib[0].response.body.items.item[5].obsrValue;
		$("#temper").append("<td style='text-align:left;'><b>온도: </b>"  + temp_Value +"℃</td>");
			
		// 단기예보 데이터 
		
						var forcast = $('#forcast').val();
// 						alert(forcast);
							
						var jsonobj = $.parseJSON('[' + forcast + ']');
						//  데이터 토탈 갯수에 따라 카테고리 갯수 자동 조정
						var total = jsonobj[0].response.body.totalCount;	
						for (var i = 0; i < total; i++) {
							// 이부분에서 잘 안되서 변수를 욕으로 지정했음.
							var wtf = jsonobj[0].response.body.items.item[i].category;
							var wth = jsonobj[0].response.body.items.item[i].fcstValue;
													
							if (wtf == "SKY" ) {
								var sky = wth;
								// 			alert("날씨"+ sky);
								switch (sky) {
								case 1:
									var sky = "맑음";
									break;
								case 2:
									var sky = "구름조금";
									break;
								case 3:
									var sky = "구름많음";
									break;
								case 4:
									var sky = "흐림";
									break;	
								}
								// 지정된 sky 값이 해당 ul 태그에  li태그로 자동 추가 됨.
								$("#sky").append("<td>" + sky + "</td>");
							} else if (wtf == "REH") {
								var humidity = wth;
								$("#humid").append("<td>" + humidity + "%</td>");
							} else if (wtf == "RN1") {
								var rain = wth;	
								$("#1h").append("<td>" + rain + "mm</td>");
							} else if (wtf == "T1H") {
								var temp = wth;
								$("#temper").append("<td>" + temp + "℃</td>");
							} else if (wtf == "VEC") {
								var windir = wth;
								if (windir == 0 || windir == 360) {
									var windir = "북";
								} else if (windir > 0 && windir < 90) {
									var windir = "북동";
								} else if (windir == 90) {
									var windir = "동";
								} else if (windir > 90 && windir < 180) {
									var windir = "남동";
								} else if (windir == 180) {
									var windir = "남";
								} else if (windir > 180 && windir < 270) {
									var windir = "남서";
								} else if (windir == 270) {
									var windir = "서";
								} else if (windir > 270 && windir < 360) {
									var windir = "북서";
								}
								$("#winddir").append("<td>" + windir+ "풍</td>");
							} else if (wtf == "WSD") {
								var windpow = wth;
								$("#windpow").append("<td>" + windpow+ "m/s</td>");
							}
							
							}
						
							// 데이터  totalCount /10 = 데이터 fcstTime count	- 예보시간 자동 조정		
					for(var i=0; i<(total/10); i++){
						var baseTime = jsonobj[0].response.body.items.item[0].baseTime;						
						var fcstTime = jsonobj[0].response.body.items.item[i].fcstTime;	
						// 발표시간에서 예보시간(1시간,2시간,3시간 4시간 후 )차이를 이용해서 fcstTime 값 설정 , fcstTime==0000 은 상황변수로 정각일때, 0000로 계산 불가, 해당 예보시간이 0000일때 무조건 true 
						if(fcstTime==(baseTime+70)||fcstTime==(baseTime+100)||fcstTime==0000){
							   var fcstTime = "1시간 후";
							   $("#hour").append("<th style='background-color:#f4f4f4;color:#448ccb;text-align:center;'>" + fcstTime + "</th>");

						} else if(fcstTime==(baseTime+170)||fcstTime==(baseTime+200)||fcstTime==0000){
								 var fcstTime = "2시간 후";
								 $("#hour").append("<th style='background-color:#f4f4f4;color:#448ccb;text-align:center;'>" + fcstTime + "</th>");

						} else if(fcstTime==(baseTime+270)||fcstTime==(baseTime+300)||fcstTime==0000){
								 var fcstTime = "3시간 후";  
							   $("#hour").append("<th style='background-color:#f4f4f4;color:#448ccb;text-align:center;'>" + fcstTime + "</th>");
					
						} else if(fcstTime==(baseTime+370)||fcstTime==(baseTime+400)||fcstTime==0000){
								 var fcstTime = "4시간 후";  
							   $("#hour").append("<th style='background-color:#f4f4f4;color:#448ccb;text-align:center;'>" + fcstTime + "</th>");
						}	
					}
							
				
		
// 		$(".td_griptime").each(function(index) {
// 			var tdclass = $(this).text();
// 			$(".td_gripwt").eq(index).attr({
// 				"id" : tdclass
// 			});
// 		});
// 		grib_iconize();
	});
	
// 	function grib_iconize() {
// 		$(".td_gripwt").each(function(index) {
// 			var time = $(this).attr('id');
// 			time *= 1;
// 			var value = $(this).text();
// 			if (time >= 18 && time <= 24) {
// 				if (value == "맑음") {
// 					$(this).html("<img src=\"../img/weather/Clear_N.png\"/>");
// 				} else if (value == "구름조금") {
// 					$(this).html("<img src=\"../img/weather/PartlyCloudy_N.png\"/>");
// 				} else if (value == "구름많음") {
// 					$(this).html("<img src=\"../img/weather/MostlyCloudy_N.png\"/>");
// 				} else if (value == "비") {
// 					$(this).html("<img src=\"../img/weather/Rain.png\"/>");
// 				} else if (value == "눈") {
// 					$(this).html("<img src=\"../img/weather/Snow.png\"/>");
// 				} else if (value == "흐림") {
// 					$(this).html("<img src=\"../img/weather/Cloudy.png\"/>");
// 				} else if (value == "눈/비") {
// 					$(this).html("<img src=\"../img/weather/SnowRain.png\"/>");
// 				} 

// 			} else {
// 				if (value == "맑음") {
// 					$(this).html("<img src=\"../img/weather/Clear_D.png\"/>");
// 				} else if (value == "구름조금") {
// 					$(this).html("<img src=\"../img/weather/PartlyCloudy_D.png\"/>");
// 				} else if (value == "구름많음") {
// 					$(this).html("<img src=\"../img/weather/MostlyCloudy_D.png\"/>");
// 				} else if (value == "비") {
// 					$(this).html("<img src=\"../img/weather/Rain.png\"/>");
// 				} else if (value == "눈") {
// 					$(this).html("<img src=\"../img/weather/Snow.png\"/>");
// 				} else if (value == "흐림") {
// 					$(this).html("<img src=\"../img/weather/Cloudy.png\"/>");
// 				} else if (value == "눈/비") {
// 					$(this).html("<img src=\"../img/weather/SnowRain.png\"/>");
// 				} 
// 			}
// 		});
// 	}
	
</script>
</head>
<body>
<hr/>
<label>실시간/초단기예보</label>

<div style="float:right;margin-bottom:10px;">
	<span style="background-color:#acaca2;color:white;border-radius:2px;">예보발표시각</span>&nbsp;<span id="fcst_time"></span>
</div>

<table class="table table-bordered" style="text-align:center;" id="gribtable">
	<tr id="hour"><th style="text-align:center;background-color:#f4f4f4;color:#448ccb;">현재날씨</th></tr>
	<tr id="sky"></tr>
	<tr id="temper"></tr>
	<tr id="winddir" ></tr>
	<tr id="windpow" ></tr>
	<tr id="humid"></tr>
	<tr id="1h" ></tr>
</table>
<input id="grib" type="hidden" name="grib" value=${gribcontent}>
<input id="forcast" type="hidden" name="forcast" value=${forcastcontent}>
</body>
</html>