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
/* 	#5b92cb; */
	color:white;
}

.fsnjisuview_table {
    background-color: transparent;
    border-top: 1px solid white;
/*     #0958a5; */
    border-color:  #0958a5; 
    width:100%;
}

#sment {
	text-align: left;
	padding: 5px;
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
  <br/>
<div id="todayDiv2">
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
 </div>
<br/>
    <table class="fsnjisuview_table">
    <tr>
<!-- 예보 지역명 -->
    <th>[${lifeFCDto.area_nm}] 지역정보</th>
    </tr>
    <tr> 
<!--         <td  style="width:3%;">&nbsp;&nbsp;</td>  -->
       <td><table style="border:2px  solid lightgray; width:100%;" >
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
		<table id="grade" class="fsnjisuview_table">
       <tr>
       <td align="center" id="marker1" style="width:20%;"> <c:if  test="${status_lvl_cd == '1' }" >  <img src="/img/jisu/h_marker.gif" /> </c:if> </td>	
       <td align="center" id="marker2" style="width:20%;"> <c:if  test="${status_lvl_cd == '2' }" >  <img src="/img/jisu/h_marker.gif" /> </c:if></td>	
       <td align="center" id="marker3" style="width:20%;"> <c:if  test="${status_lvl_cd == '3' }" >  <img src="/img/jisu/h_marker.gif" /> </c:if></td>	
       <td align="center"  id="marker4" style="width:20%;"> <c:if  test="${status_lvl_cd == '4' }" >  <img src="/img/jisu/h_marker.gif" /> </c:if></td>	
<%--        <td align="center"  id="marker5" style="width:20%;"> <c:if  test="${status_lvl_cd == '5' }" >  <img src="/img/jisu/h_marker.gif" /> </c:if> </td> --%>
   		</tr>  		
       <tr>
       <td style="background-color:gray;"   align="center"> 관심</td>	
       <td style="background-color:olive;"  align="center"> 주의	</td>	
       <td style="background-color:orange;" align="center"> 경고	</td>	
<!--        <td style="background-color:red;"    align="center">매우높음</td>	 -->
       <td style="background-color:red;" align="center"> 위험	</td>
   		</tr>    
   		</table>
   	  
    </td></tr> 
    <tr>
<!--       <td></td> -->
      <th>대응요령</th></tr>
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
        <div class="e_2" id="cntbox2">
            <table class="e_table2" style="border:1px  solid lightgray; width:100%;">
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
                        <td><img src='/img/jisu/coloricon/color04.png' alt='5등급아이콘'>&nbsp;위험</td>
            <td><b>86 이상</b></td>
                        <td id="sment" >▶ 식중독 발생가능성은 낮으나 식중독예방에 지속적인 관심 요망<br/>▶ 설사, 구토 등 식중독 의심 증상이 있으면 의료기관을 방문하여 의사 지시에 따름 <br/> ▶ 식중독 의심 환자는 식품 조리 참여에 즉시 중단하여야 함</td>
                    </tr>
<!--                     <tr> -->
<!--                         <th><img src='/img/jisu/coloricon/color04.png' alt='4등급아이콘'>&nbsp;매우높음</th> -->
<!--             <th>8 이상<br/>11 미만</th> -->
<!--                         <td>▶ 햇볕에 노출 시 수십 분 이내에도 피부 화상을 입을 수 있어 매우 위험함 <br/>▶ 오전 10시부터 오후 3시까지 외출을 피하고 실내나 그늘에 머물러야 함 <br/>▶ 외출 시 긴 소매 옷, 모자, 선글라스 이용<br/>▶ 자외선 차단제를 정기적으로 발라야 함</td> -->
<!--                     </tr> -->
                    <tr>
                        <td><img src='/img/jisu/coloricon/color03.png' alt='3등급아이콘'>&nbsp;경고</td>
            <td><b>71 이상<br>86 미만</b></td>
                        <td id="sment" >▶ 식중독 발생가능성이 높으므로 식중독 예방에 경계가 요망됨 <br/>▶ 조리도구는 세척, 소독 등을 거쳐 세균오염을 방지하고 유통기한, 보관방법 등을  확인하여 음식물 조리. 보관에 각별히 주의하여야 함</td>
                    </tr>
          <tr>
                        <td><img src='/img/jisu/coloricon/color02.png' alt='2등급아이콘'>&nbsp;주의</td>
            <td><b>55 이상<br>71 미만</b></td>
                        <td id="sment" >▶ 식중독 발생가능성이 중간 단계이므로 식중독예방에 주의가 요망됨 <br/>▶ 조리음식은 중심부까지 75℃(어패류 85℃)로 1분 이상 완전히 익히고 외부로 운반할 때에는 가급적 아이스박스 등을 이용하여 10℃이하에서 보관 및 운반</td>
                    </tr>
                    <tr>
                        <td><img src='/img/jisu/coloricon/color01.png' alt='1등급아이콘'>&nbsp;관심</td>
            <td><b>55 미만</b></td>
                        <td id="sment" >▶ 식중독 발생가능성은 낮으나  식중독예방에 지속적인 관심 요망<br/>▶ 화장실 사용 후, 귀가 후, 조리 전에 손 씻기를 생활화</td>
                    </tr>
                    <tr>
                    	 <td colspan="3"><img src="" alt="※ 의학자문 : 서울대학교병원운영 서울특별시 보라매병원 피부과 박현선 서울의대 교수"/></td>
                    	<tr/>
                </tbody>
            </table>
        </div><!--.e_2 -->
    </div><!--.e_contBox2 --> 
    <!-- 대응 요령 END -->