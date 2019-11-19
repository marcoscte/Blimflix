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
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		HttpSession sessionOk = request.getSession(true);
		String mail = (String) sessionOk.getAttribute("mail");
		String busqueda = (String) sessionOk.getAttribute("busqueda");
		
// 		if(nombre.equals(null)){
// 			response.sendRedirect("index.html");
// 		}
		String URL = "jdbc:postgresql://localhost:5432/proyectoBD";
		String password = "root123";
		String username = "root";
		try{
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(URL, username, password);
			statement = connection.createStatement();
			String query = "SELECT * FROM USUARIO";
			resultSet = statement.executeQuery(query);
			System.out.println("Se conecto BusquedaSimple");
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("No se conecto BusquedaSimple");
			
		}
		
		%>

<meta charset="UTF-8">
<title>Resultado</title>
</head>
<body>

</body>
</html>