<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="mx.resources.java.Usuario"%>
<%@page import="mx.resources.java.Serie"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<% 
		Usuario usuario = new Usuario();
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		HttpSession sessionOk = request.getSession(true);
		usuario = (Usuario) sessionOk.getAttribute("usuario");
		
		
		if(usuario.equals(null)){
			response.sendRedirect("index.html");
		}
		String URL = "jdbc:postgresql://localhost:5432/proyectoBD";
		String password = "root123";
		String username = "root";
		try{
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(URL, username, password);
			statement = connection.createStatement();
			//System.out.println(usuario.getEmail());
			//String query = "SELECT * FROM USUARIO";
			String query = "SELECT CVE_USUARIO FROM USUARIO WHERE EMAIL_USUARIO = '"+usuario.getEmail()+"'";
			resultSet = statement.executeQuery(query);
			while(resultSet.next()){
				usuario.setId(resultSet.getInt("CVE_USUARIO"));
			}
			System.out.println("Se conecto IndexUsuario: "+ usuario.getId());
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("No se conecto IndexUsuario");
			
		}
		
		%>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Blog</title>
		
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!--<link href="css/estilos.css" rel="stylesheet">-->
		<!-- <link rel="stylesheet" href="estilosLogin.css">-->
		<link  href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
		<link  href="css/usuario.css" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Prompt:300,400,500&display=swap" rel="stylesheet"> 
		<link href="https://fonts.googleapis.com/css?family=Ultra&display=swap" rel="stylesheet"> 
		</head>
		<body background="bg.jpg">

	        <nav class="navbar navbar-default navbar-static-top">
			
	            <div class="container">
	                <div class="navbar-header">
	                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	                        <span class="sr-only">Este botón despliega la barra de navación</span>
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                    </button>
	                    <a class="navbar-brand" href="IndexUsuario.jsp"><font color="#f04a25" size="30px">BlimFix</font></a>
	                </div>                
	                <div id="navbar" class="navbar-collapse collapse ">
	                    <ul class="nav navbar-nav">
	                        <ul class="nav navbar-nav">
	                        <li><a class="fontnav" href="TopSeries.jsp"><font color="#f04a25">Top 10 Series</font></a></li>
	                        <li><a class="fontnav" href="BusquedaAvanzada.jsp"><font color="#f04a25">Busqueda avanzada</font></a></li>
	                        <li><a class="fontnav" href="Historial.jsp"><font color="#f04a25">Historial</font></a></li>
<li><a class="fontnav" href="index.html"><font color="#f04a25">Salir</font></a></li>	                    </ul>
	                    </ul>
	
	                    <ul class="nav navbar-nav navbar-right">
	                    <%String nombre = usuario.getNombre(); %>
	                        <li><a class="fontnav "><font color="#f04a25"><%=nombre%></font></a></li>
	                    </ul>
	                </div>    
	            </div>             
	        </nav>
	        
	        <h1 style="color: white;">Historial: </h1>
	        <%
	        String queryHistorial = "SELECT HISTORIAL FROM HISTORIAL_USUARIO WHERE CVE_USUARIO = "+usuario.getId();
	        resultSet = statement.executeQuery(queryHistorial);
	        
	        while(resultSet.next()){
	        String historial = resultSet.getString("HISTORIAL");%>
	       <div class="card" style="width: 19rem;">
  			<div class="card-body">
			  Busqueda: <%=historial %>
			</div>
			</div>
			
			<%} %>
	        

</body>
</html>