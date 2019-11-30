<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
		String busqueda = (String) sessionOk.getAttribute("busqueda");
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
			System.out.println("Se conecto BusquedaSimple");
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("No se conecto BusquedaSimple");
			
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
	                        <li><a class="fontnav" href="TopSeries.jsp"><font color="#f04a25">Top 10 Series</font></a></li>
	                        <li><a class="fontnav" href="BusquedaAvanzada.jsp"><font color="#f04a25">Busqueda avanzada</font></a></li>
	                        <li><a class="fontnav" href="Historial.jsp"><font color="#f04a25">Historial</font></a></li>
	                       <li><a class="fontnav" href="index.html"><font color="#f04a25">Salir</font></a></li>
	                    </ul>
	
	                    <ul class="nav navbar-nav navbar-right">
	                        <li><a class="fontnav "><font color="#f04a25"><% usuario.getNombre();%></font></a></li>
	                    </ul>
	                </div>    
	            </div>             
	        </nav>
	        <div class="container contenedor">
	
	            <font color="#fff" size=" 50px"> Buscar Serie </font>
	            <form name="formulario_busqueda" action="BusquedaSimpleS" method="post">
				<%sessionOk.setAttribute("usuario", usuario); %>
		            <input type="text" id="busquedaPelicula" name="busqueda" class="form-control">
		            <button class="btn " id="botonBuscar" type="submit">Buscar</button>
		            <!-- Al hacer clic sobre el boton buscar tenía planeado que directamente te llevará si encuentra lo que hay a la pagina de seriedatos
		                y sino pues mande un mensaje para que así lo hagas bro -->
	            </form>
	        </div>
	        <div class="container contenedor">
			<font color="#fff" size="25px">Series</font>
			</div>
<%
			busqueda = busqueda.toUpperCase();
	        String querySeries = "SELECT * FROM SERIE WHERE TITULO_SERIE = '"+busqueda+"'";
	        String querySeries1 = "SELECT * FROM SERIE WHERE TITULO_SERIE LIKE '%"+busqueda+"'";	       
	        String querySeries2 = "SELECT * FROM SERIE WHERE TITULO_SERIE LIKE '"+busqueda+"%'";
	        String querySeries3 = "SELECT * FROM SERIE WHERE TITULO_SERIE LIKE '%"+busqueda+"%'";
	        
	        String queryDesc = "SELECT * FROM SERIE WHERE SINOPSIS_SERIE ='"+busqueda+"'";
	        String queryDesc1 = "SELECT * FROM SERIE WHERE SINOPSIS_SERIE LIKE '%"+busqueda+"'";
	        String queryDesc2 = "SELECT * FROM SERIE WHERE SINOPSIS_SERIE LIKE '"+busqueda+"%'";
	        String queryDesc3 = "SELECT * FROM SERIE WHERE SINOPSIS_SERIE LIKE '%"+busqueda+"%'";

	        String titulo ="";
	        String portada="";
	        String desc="";
	        statement = connection.createStatement();
	        
	        List <ResultSet> resultSets= new ArrayList<ResultSet>();
	       	resultSets.add(resultSet = statement.executeQuery(querySeries));
	       	resultSets.add(resultSet = statement.executeQuery(querySeries1));
	       	resultSets.add(resultSet = statement.executeQuery(querySeries2));
	       	resultSets.add(resultSet = statement.executeQuery(querySeries3));
// 	       	resultSets.add(resultSet = statement.executeQuery(queryDesc1));
// 	       	resultSets.add(resultSet = statement.executeQuery(queryDesc2));
// 	       	resultSets.add(resultSet = statement.executeQuery(queryDesc3));
// 	       	resultSets.add(resultSet = statement.executeQuery(queryDesc));

	       	int cve_serie =0;
			for(ResultSet resulttSet : resultSets){
	        
	        while(resultSet.next()){
	        	titulo = resultSet.getString("TITULO_SERIE");
	        	portada = resultSet.getString("PORTADA_SERIE");
	        	desc= resultSet.getString("SINOPSIS_SERIE");
	        	cve_serie = resultSet.getInt("CVE_SERIE");
	        	%>
	        	
	        	<div class ="col-md-3">
	        		<div class="card" style="width: 19rem;">
	        			<form name="formmasinfo" action="MasInfoS" method="POST">
			  			<img src=<%=portada%> class="card-img-top" >
			  				<div class="card-body">
			   					 <h5 class="card-title"><%=titulo%></h5>
			    					<p class="card-text"><%=desc%></p>
			    					
			  
			    					
			    					
			    					<input type="hidden" name="cve12" value=<%=cve_serie%>>
			    					
			    					<input type="submit" class="btn btn-primary" value="Mas Informacion">
			    					
			    					
			  				</div>
			  				</form>
					</div>
	       		 </div>
		       <%  
	        }   
	        }%>
	        
	        
	        <div class="container contenedor">
			<font color="#fff" size="25px">Actores</font>
			</div>
			
			<%
			busqueda = busqueda.toUpperCase();
	        String queryActores = "SELECT * FROM ACTORPRINCIPAL WHERE NOMBRE_ACTOR = '"+busqueda+"'";
	        String queryActores1 = "SELECT * FROM ACTORPRINCIPAL WHERE NOMBRE_ACTOR LIKE '%"+busqueda+"'";	       
	        String queryActores2 = "SELECT * FROM ACTORPRINCIPAL WHERE NOMBRE_ACTOR LIKE '"+busqueda+"%'";
	        String queryActores3 = "SELECT * FROM ACTORPRINCIPAL WHERE NOMBRE_ACTOR LIKE '%"+busqueda+"%'";
	        

	        String nombre ="";
	        String pais="";
	        
	        statement = connection.createStatement();
	        
	        resultSets= new ArrayList<ResultSet>();
	       	resultSets.add(resultSet = statement.executeQuery(queryActores));
	       	resultSets.add(resultSet = statement.executeQuery(queryActores1));
	       	resultSets.add(resultSet = statement.executeQuery(queryActores2));
	       	resultSets.add(resultSet = statement.executeQuery(queryActores3));

	       	int cve = 0;
			for(ResultSet resulttSet : resultSets){
	        
	        while(resultSet.next()){
	        	nombre = resultSet.getString("NOMBRE_ACTOR");
	        	pais = resultSet.getString("PAIS_ACTOR");
	        	
	        	%>
	        	
	        	<div class ="col-md-3">
	        		<div class="card" style="width: 19rem;">
			  			
			  				<div class="card-body">
			   					 <h5 class="card-title"><%=nombre%></h5>
			    					<p class="card-text"><%=pais%></p>
			    					
			  				</div>
					</div>
	       		 </div>
		       <%  
	        }   
	        }%>
			
			
			 <div class="container contenedor">
			<font color="#fff" size="25px">Directores</font>
			</div>
	        			<%
			busqueda = busqueda.toUpperCase();
	        String queryDirector = "SELECT * FROM DIRECTOR WHERE NOMBRE_DIRECTOR = '"+busqueda+"'";
	        String queryDirector1 = "SELECT * FROM DIRECTOR WHERE NOMBRE_DIRECTOR LIKE '%"+busqueda+"'";	       
	        String queryDirector2 = "SELECT * FROM DIRECTOR WHERE NOMBRE_DIRECTOR LIKE '"+busqueda+"%'";
	        String queryDirector3 = "SELECT * FROM DIRECTOR WHERE NOMBRE_DIRECTOR LIKE '%"+busqueda+"%'";
	        

	         nombre ="";
	         pais="";
	        
	        statement = connection.createStatement();
	        
	        resultSets= new ArrayList<ResultSet>();
	       	resultSets.add(resultSet = statement.executeQuery(queryDirector));
	       	resultSets.add(resultSet = statement.executeQuery(queryDirector1));
	       	resultSets.add(resultSet = statement.executeQuery(queryDirector2));
	       	resultSets.add(resultSet = statement.executeQuery(queryDirector3));

	       	
			for(ResultSet resulttSet : resultSets){
	        
	        while(resultSet.next()){
	        	nombre = resultSet.getString("NOMBRE_DIRECTOR");
	        	pais = resultSet.getString("PAIS_DIRECTOR");
	        	%>
	        	
	        	<div class ="col-md-3">
	        		<div class="card" style="width: 19rem;">
			  			
			  				<div class="card-body">
			   					 <h5 class="card-title"><%=nombre%></h5>
			    					<p class="card-text"><%=pais%></p>
			    					
			  				</div>
					</div>
	       		 </div>
		       <%  
	        }   
	        }%>
	        <h3></h3>
</body>
</html>