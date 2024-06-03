<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크 페이지</title>
</head>
<body>
	<%
		String validMem = (String) session.getAttribute("ValidMem");
		// 자식은 부모 것을 다 받지만 부모거를 자식이 받으려면 바뀌어야함
		// 로그인에 성공한 상태면 'yes' 비로그인 null 값

		
		String name = ""; // 빈 문자열에 저장을 해서 찍는 것으로 변경 println으로 바로 할 수가 없음
		String sessionId = (String) session.getAttribute("sessionId");
		if(validMem != null) {//로그인 상태
			out.println(sessionId +"님 로그인 중"+"<br>");
			
			Enumeration enuSession = session.getAttributeNames(); // 복수임 String의 enumaration
			
			while(enuSession.hasMoreElements()) {
				name = enuSession.nextElement().toString(); // 첫번째 원소를 찍을수 있음
				out.println(name+"<br>"); // 한줄 띄우기
				String sessionVal = (String) session.getAttribute(name); 
				out.println(sessionVal+"<br>"); // 한줄 띄우기
				
			}
			
		} else
			out.println("로그인페이지로 이동하세요");
		
	%>
	<br>
	<a href="sessiontest.jsp">세션시간</a>
	<br>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>