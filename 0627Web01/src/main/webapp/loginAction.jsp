

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO"%>
<!--  DAO �ν��Ͻ�-->
<%@ page import="java.io.PrintWriter"%>
<!-- ��� �����ִ� ��ü -->
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

<!-- jsp ���� Ŭ������ setter �Լ��� ȣ���ѰͰ� �������� -->
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
	if (result == 1) { // �α��� ����.
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='index.jsp'");
		script.println("</script>");

	} else if (result == 0) { // �α��� ����
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��й�ȣ�� Ʋ���ϴ�.')");
		script.println("history.back()"); // �ڷΰ���
		script.println("</script>");
	} else if (result == -1) { // ���̵� ���� �� 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('���̵� �������� �ʽ��ϴ�.')");
		script.println("history.back()"); // �ڷΰ���

		script.println("</script>");
	} else if (result == -2) { // �����ͺ��̽� ����
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�����ͺ��̽��� ������ �߻��߽��ϴ�.')");
		script.println("history.back()"); // �ڷΰ���
		script.println("</script>");
	}
	
	%>


</body>
</html>