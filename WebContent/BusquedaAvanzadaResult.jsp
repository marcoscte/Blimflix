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
		
		Serie serie = new Serie();
		Usuario usuario = new Usuario();
		Connection connection = null;
		Statement statement = null;
		ResultSet rs = null;
		HttpSession sessionOk = request.getSession(true);
		int cve = (int)sessionOk.getAttribute("cve");
		
		
		usuario = (Usuario) sessionOk.getAttribute("usuario");
		serie = (Serie) sessionOk.getAttribute("serie");
		System.out.println(serie);
		if(usuario == null){
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
			rs = statement.executeQuery(query);
			System.out.println("Se conecto BusquedaAvanzadar");
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("No se conecto BusquedaAvanzadar");
			
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
	                   
	                         <li><a class="fontnav " href="#"><font color="#f04a25"><%=usuario.getNombre() %></font></a></li>
	                    </ul>
	                </div>    
	            </div>             
	        </nav>
	        
	        
	        <%


			String titulo="";
	        int anio = 0;
	        int temporadas = 0;
	        String pais="";
	        String portada="";
	        String sinopsis="";
	        String actor ="";
	        String director="";
	        String genero="";
	        System.out.println(serie.getDirector().toUpperCase());
	        String queryInfo = "Select SERIE.TITULO_SERIE,SERIE.ANIO_SERIE,SERIE.TEMPORADAS,"
				        		+"SERIE.PAIS_SERIE,SERIE.PORTADA_SERIE,SERIE.SINOPSIS_SERIE,"
				        		+"ACTORPRINCIPAL.NOMBRE_ACTOR, GENERO.DESCRIPCION_GENERO," 
				        		+"DIRECTOR.NOMBRE_DIRECTOR from SERIE "
				        		+"INNER JOIN GENERO ON GENERO.CVE_GENERO = SERIE.CVE_GENERO "
				        		+"INNER JOIN DIRECTOR ON DIRECTOR.CVE_DIRECTOR = SERIE.CVE_DIRECTOR "
				        		+"INNER JOIN ACTORPRINCIPAL ON ACTORPRINCIPAL.CVE_ACTOR = SERIE.CVE_ACTOR "
				        		+"WHERE SERIE.TITULO_SERIE = '"+serie.getTitulo().toUpperCase()+"' "
				        		+"AND SERIE.PAIS_SERIE ='"+serie.getPais().toUpperCase()+"' "
				        		+"AND ACTORPRINCIPAL.NOMBRE_ACTOR = '"+serie.getActor().toUpperCase()+"' "
				        		+"AND DIRECTOR.NOMBRE_DIRECTOR = '"+serie.getDirector().toUpperCase()+"' "
				        		+"AND SERIE.TEMPORADAS = "+serie.getTemporadas();
			statement = connection.createStatement();	        		
	        rs = statement.executeQuery(queryInfo);
	        int i = 0;
	        
	        while(rs.next()){
	        	titulo = rs.getString("TITULO_SERIE");
	        	anio = rs.getInt("ANIO_SERIE");
	        	temporadas = rs.getInt("TEMPORADAS");
	        	pais = rs.getString("PAIS_SERIE");
	        	portada = rs.getString("PORTADA_SERIE");
	        	sinopsis = rs.getString("SINOPSIS_SERIE");
	        	actor = rs.getString("NOMBRE_ACTOR");
	        	genero = rs.getString("DESCRIPCION_GENERO");
	        	director = rs.getString("NOMBRE_DIRECTOR");
	        	i++;
	        	%>
	        	<div class="card" style="width: 45rem;">
			  <img src=<%=portada %> class="card-img-top" alt=<%=portada %>>
			  <div class="card-body">
			    <h5 class="card-title"><%=titulo %></h5>
			    <p class="card-text"><%=sinopsis %></p>
			  </div>
			  <ul class="list-group list-group-flush">
			    <li class="list-group-item">Temporadas: <%=temporadas %></li>
			    <li class="list-group-item">Año: <%=anio %></li>
			    <li class="list-group-item">País: <%=pais %></li>
			    <li class="list-group-item">Actor principal: <%=actor %></li>
			    <li class="list-group-item">Director: <%=director %></li>
			    <li class="list-group-item">Genero: <%=genero %></li>
			  </ul>
			  <div class="card-body">
			    <a href="BusquedaAvanzada.jsp" class="card-link">Regresar</a>
			  </div>
			</div>
	        	
	        	
	        	
	        	
	      <%   	
	        } if(i==0){
	        
	        
	       // else {%>
	        	<div class="alert alert-danger" role = "alert">
	        		No se encontraron coincidencias de búsqueda
	        	</div>
	        <% }
	        
	        
	        %>
	        
			<%sessionOk.setAttribute("usuario", usuario); %>
	        
	        
	        
	        
	</body>
</html>