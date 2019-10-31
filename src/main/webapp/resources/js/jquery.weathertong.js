$(function() {	
	$(window).load(function() {    
     	$('#loading').hide();  
    });

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires="
						+ exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
	$(document).ready(function() {
		$.get("/member/usercount", function(data) {
			var usercount = data;
			$("#usercount").text(usercount);
		});
		var uemail = getCookie("uemail");
		if (uemail) {
			$("#keep_login").attr("checked", true);
			$("#loginEmail").val(uemail);
		}
		$("#keep_login").change(function() {
			if ($("#keep_login").is(":checked")) {
				var temp = $("#loginEmail").val();
				setCookie("uemail", temp, 7);
			} else {
				deleteCookie("uemail");
			}
		});
		
		$("#weather_wc").click(function(argE){
			
			var maskHeight = $(document).height(); 
			var maskWidth = $(window).width();

			$('#mask').css({'width':maskWidth,'height':maskHeight});
			$('#mask').fadeTo("slow",0.8); 	
			
	        $('#pop_up_banner').css({position:'absolute'}).css({
	            'left': ($(window).width() - $('#pop_up_banner').outerWidth())/2,
	            'top': ($(window).height() - $('#pop_up_banner').outerHeight())/2,
	            'position': 'absolute'
	        }).show();
        });
		
//			$.ajax({
//	            type: "POST",
//	            url: "/overallfc/makemapjson",
//	            cache: false,
//	            dataType: "text",
//	            error: function(xhr, textStatus, errorThrown) {
//// 	                alert("전송에 실패했습니다.");
//	            }
//			});  

		$.ajax({
			type : "GET",
			url : "/bigdata/make_trendprod",
			dataType : "html",
			success : function(data) {
				var lay_pop4 = $("#prod_div");
				lay_pop4.show();
				lay_pop4.html(data);
			},
			error : function(request, status) {
				alert("데이터 처리 중 오류가 발생했습니다.\n관리자에게 문의하세요.");
			}
		});

	})
})