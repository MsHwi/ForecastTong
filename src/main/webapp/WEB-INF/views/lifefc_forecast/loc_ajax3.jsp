<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#bodylv3 {
	margin-left: 3px;
}

#bigtemp2> div {
	border: 1px solid gray;
	width: 113px;
	height: 42px;
	font-size: 15px;
	text-align: center;
	float: left;
	margin: 1px 1px 1px 1px;
	line-height: 3em;
}

#bigtemp2> span {
	border: 1px solid gray;
	width: 113px;
	height: 42px;
	font-size: 15px;
	text-align: center;
	float: left;
	margin: 1px 1px 1px 1px;
	line-height: 3em;
}

</style>
<script type="text/javascript" src="./js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

	$(document).one("ready", function() {
		//alert("loc_ajax3.jsp");
		$("#bigtemp2 > div").each(function forEach() {
			
			var divclass = $(this).text();
			//alert("loc_ajax3.jsp > divclass : " + divclass);
			if(divclass!="null") {
				$(this).attr({"name" : divclass})
			} else {
				$(this).attr({"id" : "dummy"})
			}
		});	
		$("#dummy").remove();
	});

</script>
</head>
<body id=bodylv3>
	<div id="bigtemp2">
			<span name="upto2">상위로</span>
		<c:forEach var="list2" items="${thirdlist}" varStatus="status">
			<div>${list2.getA_SCND_STAGE()}</div>
		</c:forEach>
	</div>
</body>
</html>