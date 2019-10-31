<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    trimDirectiveWhitespaces="true"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%
request.setCharacterEncoding("UTF-8");
%>    
<c:set var="loopCnt" value="0" />
<select id="favLocalSelect" size="10" >
 <optgroup label="관심지역============================">
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
    </optgroup> 
 </select>
