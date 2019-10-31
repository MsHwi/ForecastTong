<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".td_time").each(function(index) {
			var tdclass = $(this).text();
			$(".icon_convert").eq(index).attr({
				"id" : tdclass
			});
		});
		doInit();
		$('#table_wt').rowspan(0);
// 		$('#table_wt').colspan(4);
// 		$('#table_wt').colspan(5);
	});

	function doInit() {
		$(".icon_convert").each(function(index) {
			var time = $(this).attr('id');
			var value = $(this).text();
			if (time == "18" || time == "21" || time == "24") {
				if (value == "Clear") {
					$(this).html("<img src=\"../img/weather/Clear_N.png\"/>");
				} else if (value == "PartlyCloudy") {
					$(this).html("<img src=\"../img/weather/PartlyCloudy_N.png\"/>");
				} else if (value == "MostlyCloudy") {
					$(this).html("<img src=\"../img/weather/MostlyCloudy_N.png\"/>");
				} else if (value == "Rain") {
					$(this).html("<img src=\"../img/weather/Rain.png\"/>");
				} else if (value == "Snow") {
					$(this).html("<img src=\"../img/weather/Snow.png\"/>");
				} else if (value == "Cloudy") {
					$(this).html("<img src=\"../img/weather/Cloudy.png\"/>");
				} else if (value == "Snow/Rain") {
					$(this).html("<img src=\"../img/weather/SnowRain.png\"/>");
				}
			} else {
				if (value == "Clear") {
					$(this).html("<img src=\"../img/weather/Clear_D.png\"/>");
				} else if (value == "PartlyCloudy") {
					$(this).html("<img src=\"../img/weather/PartlyCloudy_D.png\"/>");
				} else if (value == "MostlyCloudy") {
					$(this).html("<img src=\"../img/weather/MostlyCloudy_D.png\"/>");
				} else if (value == "Rain") {
					$(this).html("<img src=\"../img/weather/Rain.png\"/>");
				} else if (value == "Snow") {
					$(this).html("<img src=\"../img/weather/Snow.png\"/>");
				} else if (value == "Cloudy") {
					$(this).html("<img src=\"../img/weather/Cloudy.png\"/>");
				} else if (value == "Snow/Rain") {
					$(this).html("<img src=\"../img/weather/SnowRain.png\"/>");
				}
			}
		});
	}

		$.fn.rowspan = function(colIdx, isStats) {       
			return this.each(function(){      
				var that;     
				$('tr', this).each(function(row) {      
					$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {	
						if ($(this).html() == $(that).html()
							&& (!isStats 
									|| isStats && $(this).prev().html() == $(that).prev().html()
									)
							) {            
							rowspan = $(that).attr("rowspan") || 1;
							rowspan = Number(rowspan)+1;

							$(that).attr("rowspan",rowspan);          
							$(this).hide();
						} else {            
							that = this;         
						}          
						that = (that == null) ? this : that;      
					});     
				});    
			});  
		}; 

// 		});
</script>
</head>
<body>
<hr/>
<label>동네예보</label>
	<div id="time_fcst" style="float:right;margin-bottom:10px;">
		<span style="background-color:#acaca2;color:white;border-radius:2px;">예보발표시각</span>
		<c:set var="doneLoop" value="false" />
		<c:forEach begin="1" end="10" varStatus="status"
			items="${weatherlist}" var="item">
			<c:if test="${not doneLoop}">
				${item.tm}<br>
				<c:if test="${status.count == 1}">
					<c:set var="doneLoop" value="true" />
				</c:if>
			</c:if>
		</c:forEach>
	</div>
	<br />
	
	<table id="table_wt" class="table table-bordered" style="text-align:center;">
	<tr style="background-color:#eff3f5;">
		<th style="text-align:center;">날짜<br/>(최저/최고℃)</th><th style="text-align:center;">시각</th><th style="text-align:center;">날씨</th><th style="text-align:center;">기온(℃)</th><th style="text-align:center;">바람<br/>(풍향,m/s)</th><th style="text-align:center;">습도(%)</th><th style="text-align:center;">강수확률</th><th style="text-align:center;">강수량</th>
	</tr>
	<c:forEach var="item" items="${weatherlist}" varStatus="status">
		<tr style="text-align:center;vertical-align:center;">
		<td style="vertical-align:middle;"><b>${item.day}<br/> (<span style='color:#0a79cb'>${item.tmn}</span>/<span style='color:#fd2400'>${item.tmx}</span>)</b></td>
		<td class="td_time"><b>${item.hour}</b></td>
		<td class="icon_convert">${item.wfEn}</td>
		<td><span style='color:#fd2400'><b>${item.temp}</b></span></td>
		<td><img src="../img/eight_dir/${item.wdEn}.gif" />&nbsp;<span style='color:#0a79cb'><b>${item.ws}</b></span></td>
		<td><span style='color:#0e9100'><b>${item.reh}</b></span></td>
		<td>${item.pop}%</td>
		<td>${item.r06}</td>
        </tr>
	</c:forEach>
	</table>
</body>
</html>