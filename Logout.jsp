<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	<%
		HttpSession CurrSession = request.getSession(false);
		if(CurrSession != null){
			CurrSession.invalidate();
		}
		response.sendRedirect("index.html");
	%>
</body>
</html>