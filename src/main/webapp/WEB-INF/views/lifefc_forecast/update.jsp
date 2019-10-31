<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 이곳은 자바 부분입니다. 서버에 올리는 부분
System.out.println("수정 완료!!");
// 제목만 콘솔에 출력
System.out.println("<update.jsp>  content : " + request.getParameter("content"));
// 자동으로 게시판 리스트로 이동시킨다. 
response.sendRedirect("view.jsp");
%>