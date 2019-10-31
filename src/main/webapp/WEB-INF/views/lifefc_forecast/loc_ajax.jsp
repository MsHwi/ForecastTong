<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설정지역</title>
<style type="text/css">
#popup {
	border: 3px solid black;
	padding: 10px 10px 10px 10px;
	width: 470px;
	height: 600px;
	background-color: white;
}

#locContents1 {
	display: block;
}

#locContents2, #locContents3 {
	display: none;
}

.gridlevel1 td {
	border: 1px solid gray;
	width: 110px;
	font-size: 15px;
	text-align: center;
}

#tempdiv {
	display: none;
}

#loc_stage1, #loc_stage2, #loc_stage3 {
	width: 75px;
}

#userid {
	display: none;
}

#submit_loc{
	width: 100px;
	margin-right: 5px;
}


</style>
<% 
  String backjuso = request.getParameter("backjuso");
%>
<script type="text/javascript" src="./js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
<%-- //alert("loc_ajax.jsp > backjuso1 : " + "<%=backjuso%>"); --%>
var v_backjuso = "<%=backjuso%>";
//alert("v_backjuso 2: " + v_backjuso);

$('#backjuso1').val(v_backjuso);
    $("#backjuso1").text(v_backjuso);
    
    //alert("backjuso3 > " + $("#backjuso").val());
	function popupClose() {
		$("#popup").hide();
	}

	//$(function(){
	$(document).one("ready", function() {
		//alert("backjuso4 > " + $("#backjuso").val());
		//var calljsp = opner.regForm.calljsp.value;
	
		//alert("loc_ajax.jsp > 임시 : calljsp - " + calljsp);
		
		$(function() {
			$.getJSON('./json/firstloc.json', function(data) {
				$.each(data, function(index) {
					if (index % 4 == 0) {
						$(".gridlevel1").append(
							"<tr>" + "<td id=\"code"+ this.code+ "\" name=\"" + this.value +"\">"+ this.value + "</td>");
					} else if (index % 4 == 3) {
						$(".gridlevel1 > tbody > tr:last").append(
							"<td id=\"code"+ this.code +"\" name=\"" + this.value +"\">"+ this.value + "</td>" + "</tr>");
					} else {
						$(".gridlevel1 > tbody > tr:last ").append(
							"<td id=\"code"+ this.code +"\" name=\"" + this.value +"\">" + this.value + "</td>");
					}});
			});
		});
		$('#loc_stage1').val("지역을");
		$('#loc_stage2').val("선택해");
		$('#loc_stage3').val("주세요.");
		 
		$('#backjuso').val(v_backjuso);
		//alert("backjuso5 > " + $("#backjuso").val());
	});

	$("#locContents1").click(function(e) {
		// alert("backjuso7 > " + $("#backjuso").val());
		//$('#backjuso').val(v_backjuso);
	
		var value = e.target.getAttribute('name');
		$('#loc_stage1').val(value);
		var url = "./selsecondstageLF.do?firststage="+value;	
		
		 //alert("loc_ajax.jsp(selsecondstageLF.do [in]firststage) <locContents1.click>>> URL : " + url);
		$('#locContents1').hide();
		$('#locContents2').load(url);  
		event.preventDefault();
		$('#locContents2').css("display","block");
		$('#loc_stage2').val("");
		$('#loc_stage3').val("");
		
		$('#backjuso').val(v_backjuso);
		

	});
	

	$("#locContents2").click(function(e) {
		 //alert("backjuso8 > " + $("#backjuso").val());
		//$('#backjuso').val(v_backjuso);
	 
		var value = $('#loc_stage1').val();
		var value2 = e.target.getAttribute('name');
		
		if(value2 == "upto") {
			$('#locContents2').hide();
			$('#locContents1').css("display","block");
			$('#loc_stage1').val("지역을");
			$('#loc_stage2').val("선택해");
			$('#loc_stage3').val("주세요.");
			
			$('#backjuso').val(v_backjuso);
		} else {
			$('#loc_stage2').val(value2);
			//alert("value2 : " + value2)
			var url = "./selthirdstageLF.do?firststage="+value+"&secondstage="+value2;
			//alert("loc_ajax.jsp(selthirdstageLF.do [in]firststage, secondstage) >> URL : " + url);
			$('#locContents2').hide();
			$('#locContents3').load(url);  
			event.preventDefault();
			$('#locContents3').css("display","block");
			
			$('#backjuso').val(v_backjuso);
		}
	});
	
	$("#locContents3").click(function(e) {
		 //alert("backjuso9 > " + v_backjuso);
		//$('#backjuso1').val(v_backjuso);
	
		var value = $('#loc_stage1').val();
		var value2 = e.target.getAttribute('name');
		
		if(value2 == "upto2") {
			$('#locContents3').hide();
			$('#locContents2').css("display","block");
			$('#loc_stage2').val("");
			$('#loc_stage3').val("");
		} else {
			//alert("loc_ajax.jsp(#locContents3.click) >> value2 : " + value2)
			$('#loc_stage3').val(value2);
			
		}
		//$('#backjuso1').val(v_backjuso);
	});


	$('#submit_loc').click(function(e) {

		if ($('#loc_stage3').val().length <= 1 || $('#loc_stage3').val() == "주세요." || $('#loc_stage3').val() == "") {
			alert("나머지 지역을 등록하여 주세요.");
			e.preventDefault();
			return false; 
		} else {
			alert("저장되었습니다. ");
			 
  			 //alert("backjuso1 > " + $("#backjuso1").val());
 
			var url = "./addinterestareaLF.do?firststage="+$("#loc_stage1").val() 
					                       + "&secondstage=" + $("#loc_stage2").val() 
					                       + "&thirdstage=" + $("#loc_stage3").val()
					                       + "&backjuso1=" + $("#backjuso1").val()
					                       + "&userid=" + $("#userid").val()
					                       ;
					                                
			// alert("url > " + url);
			$("#iarea").attr("action", url);//"./addinterestareaLF.do");
			$("#iarea").submit();	
			$("#popup").hide();
			location.reload();
			return true; 
		} 
	});
	
	// 예보보기
	$('#submit_loc2').click(function(e) {
		if ($('#loc_stage3').val().length <= 1 || $('#loc_stage3').val() == "주세요." || $('#loc_stage3').val() == "") {
			alert("나머지 지역을 등록하여 주세요.");
			e.preventDefault();
			return false; 
		} else {
			//alert("저장되었습니다.");
			$("#iarea").attr("action", "./local/localmain.jsp");
			$("#iarea").submit();	
			$("#popup").hide();
			return true; 
		} 
	});
	
	
</script>
</head>
<body>

	<div id="popup">
		<div id="popupHeader">
			<strong>&nbsp; 설정지역</strong> <span style="float: right"><input
				type="button" id="popupExit" value="닫기"
				onclick="javascript:popupClose();" /> </span>
		</div>
		<br />
		<div id="popupContents">
			<fieldset class="boardTop">
				<form id="iarea" method="get">
					<input type="text" id="loc_stage1"  name ="firststage" readonly="readonly" value="" /> 
					<input type="text" id="loc_stage2" name ="secondstage" readonly="readonly" value="" /> 
					<input type="text" id="loc_stage3" name ="thirdstage" readonly="readonly"  value=""/>
					<input type="text" id="userid" name ="userid" value="5"/>
					<input type="hidden" id="backjuso1" name ="backjuso1" readonly="readonly"  value="" />					
					<input type="submit" id="submit_loc" value="관심지역 등록" />
<!-- 					<input type="hidden" id="submit_loc2" value="예보보기" /> -->
				</form>
			</fieldset>
			<br />
			<div id="locContents1">
				<table class="gridlevel1">
				</table>
			</div>
			<div id="locContents2">
			</div>
			<div id="locContents3">
			</div>
			<div id="tempdiv">
				<span id="tempspan"> </span>
			</div>
		</div>
	</div>
</body>
</html>