<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.gridlevel1 td {
	border: 1px solid #DBDBDB;
	width: 160px;
	height: 40px;
	font-size: 15px;
	text-align: center;
	font-weight: bold;
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	if ($("#interestarea_sel option").size() == 0) {
		$("#interestarea_sel").append(
				"<option value='0'>등록된 지역 정보가 없습니다.</option>");
	}
	
	$(document).one("ready", function() {
		$(function() {
			$.getJSON('../json/firstloc.json', function(data) {
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
	});

	$("#locContents1").click(function(e) {
		var value = e.target.getAttribute('name');
		$('#loc_stage1').val(value);
		var url = "../Selsecondstage.do?firststage="+value;	
		$('#locContents1').hide();
		$('#locContents2').load(url);  
		event.preventDefault();
		$('#locContents2').css("display","block");
		$('#loc_stage2').val("");
		$('#loc_stage3').val("");
	});
	

	$("#locContents2").click(function(e) {
		var value = $('#loc_stage1').val();
		var value2 = e.target.getAttribute('name');
		
		if(value2 == "upto") {
			$('#locContents2').hide();
			$('#locContents1').css("display","block");
			$('#loc_stage1').val("지역을");
			$('#loc_stage2').val("선택해");
			$('#loc_stage3').val("주세요.");
		} else {
			$('#loc_stage2').val(value2);
			
			var url = "../Selthirdstage.do?firststage="+value+"&secondstage="+value2;
			$('#locContents2').hide();
			$('#locContents3').load(url);  
			event.preventDefault();
			$('#locContents3').css("display","block");
		}
	});
	
	$("#locContents3").click(function(e) {
		var value = $('#loc_stage1').val();
		var value2 = e.target.getAttribute('name');
		
		if(value2 == "upto2") {
			$('#locContents3').hide();
			$('#locContents2').css("display","block");
			$('#loc_stage2').val("");
			$('#loc_stage3').val("");
		} else {
			$('#loc_stage3').val(value2);
			
		}
	});


	$('#submit_loc').click(function(e) {
		if ($('#loc_stage3').val().length <= 1 || $('#loc_stage3').val() == "주세요." || $('#loc_stage3').val() == "") {
			alert("나머지 지역을 등록하여 주세요.");
			e.preventDefault();
			return false; 
		} else {
			alert("저장되었습니다.");
			$("#iarea").attr("action", "../Addinterestarea.do");
			$("#iarea").submit();	
			$("#popup").hide();
			location.reload();
			return true; 
		} 
	});
	
	
	$('#submit_loc2').click(function(e) {
		if ($('#loc_stage3').val().length <= 1 || $('#loc_stage3').val() == "주세요." || $('#loc_stage3').val() == "") {
			alert("나머지 지역을 등록하여 주세요.");
			e.preventDefault();
			return false; 
		} else {
// 			$.removeCookie("firstage");
// 			$.removeCookie("secondage");
// 			$.removeCookie("thirdage");
			
// 			document.cookie="firstage=" + $('#loc_stage1').val();
// 			document.cookie="secondage=" + $('#loc_stage2').val();
// 			document.cookie="thirdage=" + $('#loc_stage3').val();

			alert("저장되었습니다.");
			$("#iarea").attr("action", "localfsct_main.jsp");
			$("#iarea").submit();	
			$("#popup").hide();
			return true; 
		} 
	});
</script>
</head>
<body>

		<!-- (중요) Option 부분의 띄어쓰기를 절대로 수정하지 말 것 -->

	<span style="margin-right:45px;float:left;"><label>관심지역</label></span>
	
	<span style="margin-right:5px;"><a href="../admin/lifefc_admin_index.jsp"><button type="button" class="btn btn-block btn-primary" id="locfsct_show" style="width:100px;height:30px;float:right;margin-left:10px">관리자모드</button></a></span>
	
	<span style="margin-right:5px;"><button type="button" class="btn btn-block btn-primary" id="locfsct_show" style="width:100px;height:30px;float:right;margin-left:10px" onclick="showLifeforecast()">예보보기</button></span>
	<span><a href="" data-toggle="modal" data-target="#modal-selstage"><button type="button" class="btn btn-block btn-primary" id="loc_menu" style="width:130px;height:30px;float:right;margin-bottom:10px">관심지역 설정</button></a></span>
	<select id="favLocalSelect" class="form-control" >
<!--  <optgroup label="관심지역============================"> -->
 <c:forEach var="favlocinfo" items="${lifeFCList}" varStatus="status">
<%--     <% session.setAttribute("area_nm",  "${favlocinfo.area_nm}" ) ; %> --%>
    <c:if test="${ loopCnt==0 }" >
 	  <option value="${favlocinfo.area_no}" selected="selected" > ${favlocinfo.area_no} | <c:out value="${favlocinfo.area_nm}" /></option>
    </c:if>
    <c:if test="${ loopCnt!=0 }" >
    <option value="${favlocinfo.area_no}" > ${favlocinfo.area_no} | <c:out value="${favlocinfo.area_nm}" /></option>
    </c:if>
 <c:set var="loopCnt" value="${loopCnt+1}" /> 
 </c:forEach>
<!--     </optgroup>  -->
 </select>
	
	<!-- 관심지역 설정 모달창  -->
	<div class="modal fade" id="modal-selstage">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">
						<b>관심지역 설정</b>
					</h4>
				</div>
				<div class="modal-body">
					<form id="iarea" method="post">
					<div id="popup" class="box-body" >
					<div id="popupHeader">
						<strong>&nbsp; 설정지역</strong><input type="submit" class="btn btn-primary" id="submit_loc" value="관심지역 등록" style="float:right;margin-right:3%;"/>
					</div>
					<br />
					<div id="popupContents" class="form-group">
						<fieldset class="boardTop">
								<div class="row">
									<div class="col-xs-3"><input type="text" class="form-control" id="loc_stage1"  name ="firststage" readonly="readonly" value="" /> </div>
									<div class="col-xs-3"><input type="text" class="form-control" id="loc_stage2" name ="secondstage" readonly="readonly" value=""  /> </div>
									<div class="col-xs-3"><input type="text" class="form-control" id="loc_stage3" name ="thirdstage" readonly="readonly"  value="" /> </div>
									<input type="hidden" name ="userid"  value="${sessionScope.userid}" />
									<input type="submit" class="btn btn-primary" id="submit_loc2" value="예보보기" style="width:115px"/>
								</div>
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
				<!-- /.modal-footer -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	</div>
</body>
</html>