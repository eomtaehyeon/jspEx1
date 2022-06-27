

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO"%>
<!--  DAO 인스턴스-->
<%@ page import="java.io.PrintWriter"%>
<!-- 출력 도와주는 객체 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

<!-- jsp 에서 클래스의 setter 함수를 호출한것과 마찬가지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID(), user.getUserPassword());

	// 
	if (result == 1) { // 로그인 성공.
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='index.jsp'");
		script.println("</script>");

	} else if (result == 0) { // 로그인 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()"); // 뒤로가기
		script.println("</script>");
	} else if (result == -1) { // 아이디가 없을 시 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 존재하지 않습니다.')");
		script.println("history.back()"); // 뒤로가기

		script.println("</script>");
	} else if (result == -2) { // 데이터베이스 오류
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스에 문제가 발생했습니다.')");
		script.println("history.back()"); // 뒤로가기
		script.println("</script>");
	}
	
	%>


</body>
</html>