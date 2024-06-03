<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보 테스트</title>
</head>
<body>
	<%
		int sessionTime = session.getMaxInactiveInterval();
		out.println("세션의 기본 유효시간 : " + sessionTime + "<br>");
		session.setMaxInactiveInterval(600);
        sessionTime = session.getMaxInactiveInterval(); // 변경된 유효 시간 가져오기
		out.println("세션의 변경 유효시간 : " + sessionTime + "<br>");
	%>
	<hr>
	<%
		long firstTime =session.getCreationTime();
		long lastTime = session.getLastAccessedTime();	
		
        long keepTimeInSeconds = (lastTime - firstTime) / 1000;

        long keepTimeInMinutes = keepTimeInSeconds / 60;
		String session_id = session.getId(); 
		out.println("세션 고유 아이디 : " + session_id);
	%>
	<p>세션 생성 시간: <%= new java.util.Date(firstTime) %></p>
    <p>마지막 접근 시간: <%= new java.util.Date(lastTime) %></p>
    <p>세션 유지 시간: <%= keepTimeInMinutes %> 분</p>
    <hr>
    <a href="loginCheck.jsp">로그인 확인페이지로 가기</a>
	
</body>
</html>