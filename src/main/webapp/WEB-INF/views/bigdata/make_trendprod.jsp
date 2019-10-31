<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${final_product_list}" var="fpl" varStatus="status">
		<img src="${fpl.prod_image}" style="max-width: 100%;" />
		<p class="pname" style="font-size: 16px;">
			<b><c:out value="${fpl.prod_name}"/></b>
		</p>
		<div class="price_info mini">
			<span class="price_detail"> <span class="hide"></span><strong
				class="sale_price">${fpl.prod_cost}</strong>원 ~ &nbsp;&nbsp;&nbsp;&nbsp; <b><font color="red">[자료제공: 11번가]</font></b>
			</span>
		</div>
	</c:forEach>
</body>
</html>