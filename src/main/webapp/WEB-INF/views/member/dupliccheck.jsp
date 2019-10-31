<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${chekedEmail eq 'YES'}">
		[해당 이메일을 사용할 수 있습니다.  회원가입을 진행해 주세요.]
	</c:when>
	<c:otherwise> 
		[동일한 이메일이 존재합니다.  다른 이메일을 입력해 주세요.[]
    </c:otherwise>
</c:choose>
