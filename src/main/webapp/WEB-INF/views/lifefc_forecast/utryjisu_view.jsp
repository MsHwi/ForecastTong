<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    trimDirectiveWhitespaces="true"
%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Calendar, java.util.Date, java.util.Map, java.util.Set, java.text.SimpleDateFormat" %>

<style type="text/css">

#anno_time {
	font-size: 12px;
}

#tempcss {
	background-color:#acaca2;
	color:white;
	border-radius:2px;
	font-size: 12px;
	font-weight: bold;
}

#setsize {
	font-size: medium;
}

th, td {
	text-align: center;
	padding: 3px 3px 3px 3px; 
	border: 1px solid white;
/* 	#5b92cb; */
	font-size:12px;
}

th {
	white-space: nowrap;
	background-color: #5b92cb;
	color:white;
}

#sment {
	text-align: left;
	padding: 5px;
}

.utryjisuview_table1 {
    background-color: transparent;
    border-top: 1px solid white;
    border-color:  #0958a5; 
/*     #0958a5; */
    width:100%;
}

.utryjisuview_table2 {
    background-color: transparent;
    border-top: 1px solid white;
/*     #0958a5; */
    width:100%;
}

</style>
<script type="text/javascript" src="/js/jquery-1.12.4.min.js">
</script>

<script type="text/javascript"> 
$(function(){ // jquery는 많은 기능을 함수로 만들어 놓은 것이므로  함수를 사용함을 의미
});
// $(document).one("ready", function() {
$(document).ready(function(){
	 //발표시간
    var annotime = $("#notitime").val();	
	//var frm_notitime = get_frm_notitime(annotime);
 
   
    //발표시간 입력
    // $("#anno_time").html();
     //alert("anno_time : " + anno_time);
    //$("#viewTime").text( anno_time);
    
//     alert( "tabno : " + "${tabno}");
});//$(document).ready(function()... end
	
	 function day_title_click(tabno){

	        var memarray = new Array();
	        var i = 0;
	        $('td[id="daytd"]').each(function(){  //html 요소중 id값이 TYPE 데이터 모두 가져오기
	            memarray[i] = $(this).removeClass('on'); //class 요소중 'on' 이라는 요소 삭제
	            i++;
	        }); 
	        //memarray[indata].addClass('on');
			 
	    }
	     
</script>
<div id="todayDiv3" >
<c:set var="tabNo" value="${tabno}" />
<c:set var="imageSrc" value="${image_src}" />
 
 <%!
 // tabno에 따른 오늘/내일/모레일자(월일) 값을 반환한다.
 //tabno : 클릭한 탭번호 (오늘/내일/모레탭)
public String getStateDay(int tabno)  {
	int total=0;

	Calendar calendar = Calendar.getInstance();
	 
	int month = calendar.get(Calendar.MONTH )+1;
	int date = calendar.get(Calendar.DATE )+(tabno-1);
	
	System.out.println("======= getStateDay()... >  " + (month+" 월" + date +"일"));
	return month+" 월" + date +"일";
}
 
%> 

<c:choose>
<c:when test="${tabNo == '1' }">
<c:set var="fcstStage" value="${lifeFCDto.today_fcstStage}(지수 : ${lifeFCDto.today_fcst})" />
<c:set var="fcstStatusNm" value="${lifeFCDto.today_fcstStage}" />
<c:set var="state_date" value="<%=getStateDay(1)%>" />  
 
</c:when>
<c:when test="${tabNo == '2' }">
<c:set var="fcstStage" value="${lifeFCDto.tomrw_fcstStage}(지수 : ${lifeFCDto.tomrw_fcst})" />
<c:set var="fcstStatusNm" value="${lifeFCDto.tomrw_fcstStage}" />
<c:set var="state_date" value="<%=getStateDay(2)%>" />  

</c:when>
<c:otherwise> 
<c:set var="fcstStage" value="${lifeFCDto.aft_tomrw_fcstStage}(지수 : ${lifeFCDto.aft_tomrw_fcst})" />
<c:set var="fcstStatusNm" value="${lifeFCDto.aft_tomrw_fcstStage}" />
<c:set var="state_date" value="<%=getStateDay(3)%>" />  

</c:otherwise>
</c:choose>
<!-- span id="viewTime" 값셋팅은 ajax<utryjisu_view.jsp>에서 불러오는 js -->
<!-- load시에 출력 -->
<div align="right">
<span><font id="tempcss" >예보발표시각</font>&nbsp;<font id="anno_time">${formatted_notitime} 발표</font></span>
</div>
<br/>
    <table class="utryjisuview_table1">
    <tr>
<!-- 예보 지역명 -->
		<th>[${lifeFCDto.area_nm}] 지역정보</th>
    </tr>
    <tr> 
<!--         <td  style="width:3%;">&nbsp;&nbsp;</td>  -->
       <td><table  style="border:2px  solid lightgray; width:100%;" >
       <tr>
<!--        예보 상태 -->
       <td align="center" style="color:red;"><b>${fcstStage}</b></td>
<!--        예보 상태 이미지 -->
		<td rowspan="2"><div id="bigImageDiv">  
		    <img src="${imageSrc}" width="130px" height="80px" />   
   		</div>
   		</td>
   		</tr>   
   		<tr><td align="center">
<!-- 예보 일자 -->
<span  id="state_date" style="color:blue;"><b>${state_date}</b></span>
   		</td></tr> 
   		</table>
    </td> </tr>
<!--   지도(map)과 오른쪽 content 중간 공백  -->    
    <tr> 
         <td>
		<table id="grade"  style="width:100%;">
       <tr>
       <td align="center" id="marker1" style="width:20%;"> <c:if  test="${status_lvl_cd == '1' }" >  <img src="/img/jisu/h_marker.gif" /> </c:if> </td>	
       <td align="center" id="marker2" style="width:20%;"> <c:if  test="${status_lvl_cd == '2' }" >  <img src="/img/jisu/h_marker.gif" /> </c:if></td>	
       <td align="center" id="marker3" style="width:20%;"> <c:if  test="${status_lvl_cd == '3' }" >  <img src="/img/jisu/h_marker.gif" /> </c:if></td>	
       <td align="center"  id="marker4" style="width:20%;"> <c:if  test="${status_lvl_cd == '4' }" >  <img src="/img/jisu/h_marker.gif" /> </c:if></td>	
       <td align="center"  id="marker5" style="width:20%;"> <c:if  test="${status_lvl_cd == '5' }" >  <img src="/img/jisu/h_marker.gif" /> </c:if> </td>
   		</tr>  		
       <tr>
       <td style="background-color:gray;"   align="center"> 낮음</td>	
       <td style="background-color:olive;"  align="center"> 보통	</td>	
       <td style="background-color:orange;" align="center"> 높음	</td>	
       <td style="background-color:red;"    align="center">매우높음</td>	
       <td style="background-color:magenta;" align="center"> 위험	</td>
   		</tr>    
   		</table>
   	  
    </td></tr> 
    <tr><th>대응요령</td></tr>
    <tr>
<!--     <td></td> -->
<!-- 대응요령 멘트 -->
       <td id="sment"  >
			<c:forEach var="sment" items="${status_lvl_ment}" varStatus="status">
			<img src="/img/jisu/info_icon_04.png" />${sment}  <br/>
			</c:forEach>       
       </td></tr>
    </table> 
    <input type="hidden"  name="notitime" id="notitime" value="${lifeFCDto.noti_time}"/>

<br/>
   	<!-- 대응요령 -->
   <div class="e_contBox2" >
        <div class="e_1"><img src="/img/jisu/cau_icon.png" alt="아이콘" style="width:15px; margin-right:10px; padding-left:5px;"/><b>단계별 대응요령</b></div><br/>
        <div class="e_2" >
            <table class="utryjisuview_table2"  style="border:1px  solid lightgray; width:100%;">
                <colgroup>
                    <col width="15%" />
          <col width="15%" />
                    <col width="70%" />
                </colgroup>
                <thead  style="border:1px solid;" >
                    <tr>
                    <th>단계</th>
                    <th>지수범위</th>
                    <th>대응요령</th>
                    </tr>
                </thead>
                <tbody id="long_ment"  style="border:1px solid;" >
                    <tr>
                        <th><img src='/img/jisu/ultry_coloricon/color05.png' alt='5등급아이콘'>&nbsp;위험</th>
            <td><b>11 이상</b></td>
                        <td id="sment" >▶ 햇볕에 노출 시 수십 분 이내에도 피부 화상을 입을 수 있어 가장 위험함<br/>▶ 가능한 실내에 머물러야 함<br/> ▶ 외출 시 긴 소매 옷, 모자, 선글라스 이용<br/>▶ 자외선 차단제를 정기적으로 발라야 함</td>
                    </tr>
                    <tr>
                        <th><img src='/img/jisu/ultry_coloricon/color04.png' alt='4등급아이콘'>&nbsp;매우높음</th>
            <td><b>8 이상<br/>11 미만</b></td>
                        <td id="sment" >▶ 햇볕에 노출 시 수십 분 이내에도 피부 화상을 입을 수 있어 매우 위험함 <br/>▶ 오전 10시부터 오후 3시까지 외출을 피하고 실내나 그늘에 머물러야 함 <br/>▶ 외출 시 긴 소매 옷, 모자, 선글라스 이용<br/>▶ 자외선 차단제를 정기적으로 발라야 함</td>
                    </tr>
                    <tr>
                        <th><img src='/img/jisu/ultry_coloricon/color03.png' alt='3등급아이콘'>&nbsp;높음</th>
            <td><b>6 이상<br>8 미만</b></td>
                        <td id="sment" >▶ 햇볕에 노출 시 1～2시간 내에도 피부 화상을 입을 수 있어 위험함<br/>▶ 한낮에는 그늘에 머물러야 함<br/>▶ 외출 시 긴 소매 옷, 모자, 선글라스 이용<br/>▶ 자외선 차단제를 정기적으로 발라야 함</td>
                    </tr>
          <tr>
                        <th><img src='/img/jisu/ultry_coloricon/color02.png' alt='2등급아이콘'>&nbsp;보통</th>
            <td><b>3 이상<br>6 미만</b></td>
                        <td id="sment" >▶ 2～3시간 내에도 햇볕에 노출 시에 피부 화상을 입을 수 있음 <br/>▶ 모자, 선글라스 이용 <br/>▶ 자외선 차단제를 발라야 함</td>
                    </tr>
                    <tr>
                        <th><img src='/img/jisu/ultry_coloricon/color01.png' alt='1등급아이콘'>&nbsp;낮음</th>
            <td><b>3 미만</b></td>
                        <td id="sment" >▶ 햇볕 노출에 대한 보호조치가 필요하지 않음 <br/>▶ 그러나 햇볕에 민감한 피부를 가진 분은 자외선 차단제를 발라야 함</td>
                    </tr>
                    <tr>
                    	 <td colspan="3"><img src="" alt="※ 의학자문 : 서울대학교병원운영 서울특별시 보라매병원 피부과 박현선 서울의대 교수"/></td>
                    	<tr/>
                </tbody>
            </table>
        </div><!--.e_2 -->
    </div><!--.e_contBox2 --> 
    </div>
    <!-- 대응 요령 END -->