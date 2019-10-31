<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글수정</title>
<style type="text/css">
table{width: 400px;}
th,td {border: 1px solid #888; }
th{background: black; color: white;}
/* id가 btnArea인 것을 찾아서 안에 있는 글을 가운데 정렬한다. */
#btnArea{text-align: center;}
#title,#content,#writer{width: 98%;}
#content{height: 120px;}
</style>
</head>
<body>
<h2>게시판 글수정</h2>
	<!-- 글쓰기 DB처리로 가기  데이터를 주소뒤에 모두 붙이는것은 get방식 <보안에 취약>-->
	<form action="update.jsp" method="post">
		<table>
			<!-- 글번호/제목/내용/작성자 -->
			<tr>
				<th>글번호</th>
				<td><input type="text" name="no"  id="no" readonly="readonly" 
				           value="23"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" maxlength="100" id="title" 
				     value="JAVA JJANG" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content">자바를 잘해야지 다른것도 잘 할 수 있겠지??
 이후의 수업이 재미있을려면 열씸히 해야겠지!!!</textarea></td>
			</tr>
			<tr>
				<th>작성자</th>
				<!-- 			name의 writer는 데이터를 받을때 사용하는 이름, id는 데이터를 컨트롤할때 사용 -->
				<td><input type="text" name="writer" maxlength="30" id="writer" 
				 value="조양희"/></td>
			</tr>
			<tr>
				<td colspan="2" id="btnArea">
				<button type="submit">수정</button> <!-- 데이터 전송 Defualt는 submit(자체적으로 동작함)임.  -->
				<button type="reset">새로입력</button> <!-- reset 은 처음으로  데이터를 세팅한다. -->
				<a href="view.jsp"><button type="button">취소</button></a> <!-- button 타입은 버튼으로만 동작을하고 아무것도 실행되지 않는다. 실행하려는 것은 js 프로그램으로 작성한다.  -->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>