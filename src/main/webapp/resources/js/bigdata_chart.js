$(function() {	
	// 기본적인 그래프 설정
//	function setConfig(data,legend,xTitle, yTitle, shared,verA,horA) {
//		var myConfig = 
//		{
//	            "type": "line",
//	            "background-color": "#003849",
//	            "utc": true,
//	            "title": {
//	                "y": "7px",
//	                "text": title,												// 제목 변수 설정해야 함
//	                "background-color": "#003849",
//	                "font-size": "24px",
//	                "font-color": "white",
//	                "height": "25px"
//	            },
//	            "plotarea": {
//	                "margin": "20% 8% 14% 12%",
//	                "background-color": "#003849"
//	            },
//	            "legend": {
//	                "layout": "float",
//	                "background-color": "none",
//	                "border-width": 0,
//	                "shadow": 0,
//	                "width":"75%",
//	                "text-align":"middle",
//	                "x":"25%",
//	                "y":"10%",
//	                "item": {
//	                    "font-color": "#f6f7f8",
//	                    "font-size": "14px"
//	                }
//	            },
//	            "scale-x": {
//	                "min-value": 1383292800000,
//	                "shadow": 0,
//	                "step": 3600000,
//	                "line-color": "#f6f7f8",
//	                "tick": {
//	                    "line-color": "#f6f7f8"
//	                },
//	                "guide": {
//	                    "line-color": "#f6f7f8"
//	                },
//	                "item": {
//	                    "font-color": "#f6f7f8"
//	                },
//	                "transform": {
//	                    "type": "date",
//	                    "all": "%D, %d %M<br />%h:%i %A",
//	                    "guide": {
//	                        "visible": false
//	                    },
//	                    "item": {
//	                        "visible": false
//	                    }
//	                },
//	                "label": {
//	                    "visible": false
//	                },
//	                "minor-ticks": 0
//	            },
//	            "scale-y": {
//	                "values": "0:1000:250",
//	                "line-color": "#f6f7f8",
//	                "shadow": 0,
//	                "tick": {
//	                    "line-color": "#f6f7f8"
//	                },
//	                "guide": {
//	                    "line-color": "#f6f7f8",
//	                    "line-style": "dashed"
//	                },
//	                "item": {
//	                    "font-color": "#f6f7f8"
//	                },
//	                "label": {
//	                    "text": "Page Views",
//	                    "font-color": "#f6f7f8"
//	                },
//	                "minor-ticks": 0,
//	                "thousands-separator": ","
//	            },
//	            "crosshair-x": {
//	                "line-color": "#f6f7f8",
//	                "plot-label": {
//	                    "border-radius": "5px",
//	                    "border-width": "1px",
//	                    "border-color": "#f6f7f8",
//	                    "padding": "10px",
//	                    "font-weight": "bold"
//	                },
//	                "scale-label": {
//	                    "font-color": "#00baf0",
//	                    "background-color": "#f6f7f8",
//	                    "border-radius": "5px"
//	                }
//	            },
//	            "tooltip": {
//	                "visible": false
//	            },
//	            "plot": {
//	                "tooltip-text": "%t views: %v<br>%k",
//	                "shadow": 0,
//	                "line-width": "3px",
//	                "marker": {
//	                    "type": "circle",
//	                    "size": 3
//	                },
//	                "hover-marker": {
//	                    "type": "circle",
//	                    "size": 4,
//	                    "border-width": "1px"
//	                }
//	            },
//	            "series": [
//	                {
//	                    "values": [
//	                        149.2,
//	                        174.3,
//	                        187.7,
//	                        147.1,
//	                        129.6,
//	                        189.6,
//	                        230,
//	                        164.5,
//	                        171.7,
//	                        163.4,
//	                        194.5,
//	                        200.1,
//	                        193.4,
//	                        254.4,
//	                        287.8,
//	                        246,
//	                        199.9,
//	                        218.3,
//	                        244,
//	                        312.2,
//	                        284.5,
//	                        249.2,
//	                        305.2,
//	                        286.1,
//	                        347.7,
//	                        278,
//	                        240.3,
//	                        212.4,
//	                        237.1,
//	                        253.2,
//	                        186.1,
//	                        153.6,
//	                        168.5,
//	                        140.9,
//	                        86.9,
//	                        49.4,
//	                        24.7,
//	                        64.8,
//	                        114.4,
//	                        137.4
//	                    ],
//	                    "text": "Pricing",
//	                    "line-color": "#007790",
//	                    "legend-marker": {
//	                        "type": "circle",
//	                        "size": 5,
//	                        "background-color": "#007790",
//	                        "border-width": 1,
//	                        "shadow": 0,
//	                        "border-color": "#69dbf1"
//	                    },
//	                    "marker": {
//	                        "background-color": "#007790",
//	                        "border-width": 1,
//	                        "shadow": 0,
//	                        "border-color": "#69dbf1"
//	                    }
//	                },
//	                {
//	                    "values": [
//	                        714.6,
//	                        656.3,
//	                        660.6,
//	                        729.8,
//	                        731.6,
//	                        682.3,
//	                        654.6,
//	                        673.5,
//	                        700.6,
//	                        755.2,
//	                        817.8,
//	                        809.1,
//	                        815.2,
//	                        836.6,
//	                        897.3,
//	                        896.9,
//	                        866.5,
//	                        835.8,
//	                        797.9,
//	                        784.7,
//	                        802.8,
//	                        749.3,
//	                        722.1,
//	                        688.1,
//	                        730.4,
//	                        661.5,
//	                        609.7,
//	                        630.2,
//	                        633,
//	                        604.2,
//	                        558.1,
//	                        581.4,
//	                        511.5,
//	                        556.5,
//	                        542.1,
//	                        599.7,
//	                        664.8,
//	                        725.3,
//	                        694.2,
//	                        690.5
//	                    ],
//	                    "text": "Documentation",
//	                    "line-color": "#009872",
//	                    "legend-marker": {
//	                        "type": "circle",
//	                        "size": 5,
//	                        "background-color": "#009872",
//	                        "border-width": 1,
//	                        "shadow": 0,
//	                        "border-color": "#69f2d0"
//	                    },
//	                    "marker": {
//	                        "background-color": "#009872",
//	                        "border-width": 1,
//	                        "shadow": 0,
//	                        "border-color": "#69f2d0"
//	                    }
//	                },
//	                {
//	                    "values": [
//	                        536.9,
//	                        576.4,
//	                        639.3,
//	                        669.4,
//	                        708.7,
//	                        691.5,
//	                        681.7,
//	                        673,
//	                        701.8,
//	                        636.4,
//	                        637.8,
//	                        640.5,
//	                        653.1,
//	                        613.7,
//	                        583.4,
//	                        538,
//	                        506.7,
//	                        563.1,
//	                        541.4,
//	                        489.3,
//	                        434.7,
//	                        442.1,
//	                        482.3,
//	                        495.4,
//	                        556.1,
//	                        505.4,
//	                        463.8,
//	                        434.7,
//	                        377.4,
//	                        325.4,
//	                        351.7,
//	                        343.5,
//	                        333.2,
//	                        332,
//	                        378.9,
//	                        415.4,
//	                        385,
//	                        412.6,
//	                        445.9,
//	                        441.5
//	                    ],
//	                    "text": "Support",
//	                    "line-color": "#da534d",
//	                    "legend-marker": {
//	                        "type": "circle",
//	                        "size": 5,
//	                        "background-color": "#da534d",
//	                        "border-width": 1,
//	                        "shadow": 0,
//	                        "border-color": "#faa39f"
//	                    },
//	                    "marker": {
//	                        "background-color": "#da534d",
//	                        "border-width": 1,
//	                        "shadow": 0,
//	                        "border-color": "#faa39f"
//	                    }
//	                }
//	            ]
//	        };
//		return myConfig;
//	}
	
	$.ajax({
		url:"/bigdata/makeTempChart",
		success:function(responseData, textStatus, xhr) {
			
			alert("시도");
			
			var avg_temp = responseData.avg_temp;
			alert(avg_temp);
			
//			var timeLabel = [];
//			for(var i = 0; i < 24; i++) {
//				timeLabel[i] = i;
// 			}
//			var veloConCount = responseData.veloConCount;
//			
//			var data = [];
//			
//			// 2010~2016.11월까지 시간별 일평균 정체구간 수
//			var dataSeries = {
//					type:"column",
//					toolTipContent: "<strong style='\"'color: {color};'\"'>시간 : </strong> {label} <br/>" +
//							"<strong style='\"'color: {color};'\"'>일평균 정체구간 수 : </strong> {y}곳"
//			}; 
//			var dataPoints = [];
//			
//			for(var i = 0; i<timeLabel.length; i++) {
//				dataPoints.push({
//					y:veloConCount[i],
//					label:timeLabel[i]+"시"
//				});
//			}
//			dataSeries.dataPoints = dataPoints;
//			data.push(dataSeries);
//			
//			// 그래프 그리기
//			var chart = chartDraw(data,"timeTrafficStats","일평균 정체구간 수", "시간", "구간 수", false);
//			chart.render();
		},
		error:function(request,status,error){
	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	       }
	});
	
	
	
});	

//zingchart.THEME="classic";

// 
//zingchart.render({ 
//	id : 'myChart', 
//	data : myConfig, 
//	height: 500, 
//	width: 725 
//});