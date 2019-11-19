<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<% 
HttpSession sessionOk = request.getSession(true);
String nombre = (String) sessionOk.getAttribute("nombre");
int tipo = (int) sessionOk.getAttribute("tipo");
if(nombre.equals(null)){
	response.sendRedirect("index.html");
}else if(!nombre.equals(null) && tipo == 1){
	response.sendRedirect("IndexUsuario.jsp");
}
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=nombre%> <%=tipo%>
</body>
</html>