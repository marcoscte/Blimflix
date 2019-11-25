<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="mx.resources.java.Usuario"%>
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
			String query = "SELECT * FROM USUARIO";
			resultSet = statement.executeQuery(query);
			System.out.println("Se conecto IndexUsuario");
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
	                        <li><a class="fontnav" href="http://localhost/Proyecto1/topSeries.html"><font color="#f04a25">Top Series</font></a></li>
	                        <li><a class="fontnav" href="BusquedaAvanzada.jsp"><font color="#f04a25">Busqueda avanzada</font></a></li>
	                    </ul>
	
	                    <ul class="nav navbar-nav navbar-right">
	                    <%String nombre = usuario.getNombre(); %>
	                        <li><a class="fontnav "><font color="#f04a25"><%=nombre%></font></a></li>
	                    </ul>
	                </div>    
	            </div>             
	        </nav>
	        <div class="container contenedor">
	
	            <font color="#fff" size=" 50px"> Buscar Serie </font>
	            <form name="formulario_busqueda" action="BusquedaSimpleS" method="post">
	            <%sessionOk.setAttribute("usuario", usuario); %>
	            <input type="hidden" name="usuario" value=<%=usuario%>>
	            
		            <input type="text" id="busquedaPelicula" name="busqueda" class="form-control">
		            <button class="btn " id="botonBuscar" type="submit">Buscar</button>
		            <!-- Al hacer clic sobre el boton buscar tenía planeado que directamente te llevará si encuentra lo que hay a la pagina de seriedatos
		                y sino pues mande un mensaje para que así lo hagas bro -->
	            </form>
	        </div>
	        
	         <%
	        String querySeries = "SELECT * FROM SERIE";
	        String titulo ="";
	        String portada="";
	        String desc="";
	        statement = connection.createStatement();
	        resultSet = statement.executeQuery(querySeries);
	        
	        while(resultSet.next()){
	        	titulo = resultSet.getString("TITULO_SERIE");
	        	portada = resultSet.getString("PORTADA_SERIE");
	        	desc= resultSet.getString("SINOPSIS_SERIE");
	        	%>
	        	
	        	<div class ="col-md-3">
	        		<div class="card" style="width: 18rem;">
			  			<img src=<%=portada%> class="card-img-top" height ="200" width ="250">
			  				<div class="card-body">
			   					 <h5 class="card-title"><%=titulo%></h5>
			    					<p class="card-text"><%=desc%></p>
			    					<a href="#" class="btn btn-primary">Más información</a>
			  				</div>
					</div>
	       		 </div>
		       <%  }%>
	        
	        
	        
		</body>
</html>