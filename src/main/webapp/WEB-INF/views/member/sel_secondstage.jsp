<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#bodylv2 {
	margin-left: 3px;
}

#bigtemp > div {
	border: 1px solid #DBDBDB;
	width: 137px;
	height: 40px;
	font-size: 15px;
	text-align: center;
	float: left;
	line-height: 3em;
	font-weight:bold;
}

#bigtemp > span {
	border: 1px solid #DBDBDB;
	width: 137px;
	height: 40px;
	font-size: 15px;
	text-align: center;
	float: left;
	line-height: 3em;
		font-weight:bold;
}

</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

	$(document).one("ready", function() {
		$("#bigtemp > div").each(function forEach() {
			var divclass = $(this).text();			
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
<body id=bodylv2>
	<div id="bigtemp">
			<span name="upto">상위로</span>
		<c:forEach var="list" items="${secondlist}" varStatus="status">
			<div>${list.getA_SCND_STAGE()}</div>
		</c:forEach>
	</div>
</body>
</html>