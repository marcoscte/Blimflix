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
		List<Serie> serieList = new ArrayList<>();
		Serie serie = new Serie();
		Usuario usuario = new Usuario();
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		HttpSession sessionOk = request.getSession(true);
		int cve = (int)sessionOk.getAttribute("cve");
		System.out.println("claveeee:  "+ cve);
		serieList = (List) sessionOk.getAttribute("ListaSeries");
		usuario = (Usuario) sessionOk.getAttribute("usuario");
		serie=(Serie) sessionOk.getAttribute("serie");
		
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
			System.out.println("Se conecto MasInfo");
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("No se conecto MasInfo");
			
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
	        
	        
	        <%
// 	        int cve = serie.getId();
// 	        String titulo = serie.getTitulo();
// 	        System.out.println(titulo + cve);
	        
// 	        String queryInfo = "Select SERIE.TITULO_SERIE,SERIE.ANIO_SERIE,SERIE.TEMPORADAS,"
// 				        		+"SERIE.PAIS_SERIE,SERIE.PORTADA_SERIE,SERIE.SINOPSIS_SERIE,"
// 				        		+"ACTORPRINCIPAL.NOMBRE_ACTOR, GENERO.DESCRIPCION_GENERO," 
// 				        		+"DIRECTOR.NOMBRE_DIRECTOR from SERIE "
// 				        		+"INNER JOIN GENERO ON GENERO.CVE_GENERO = SERIE.CVE_GENERO "
// 				        		+"INNER JOIN DIRECTOR ON DIRECTOR.CVE_DIRECTOR = SERIE.CVE_DIRECTOR "
// 				        		+"INNER JOIN ACTORPRINCIPAL ON ACTORPRINCIPAL.CVE_ACTOR = SERIE.CVE_ACTOR "
// 				        		+"WHERE SERIE.CVE_SERIE ="+cve
// 				        		+" AND SERIE.TITULO_SERIE='"+titulo+"'";
// 			statement = connection.createStatement();	        		
// 	        resultSet = statement.executeQuery(queryInfo);
// 	        while(resultSet.next()){
	        	
// 	        }
	        %>
	        <div class="card" style="width: 18rem;">
			  <img src="..." class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			  <ul class="list-group list-group-flush">
			    <li class="list-group-item">Cras justo odio</li>
			    <li class="list-group-item">Dapibus ac facilisis in</li>
			    <li class="list-group-item">Vestibulum at eros</li>
			  </ul>
			  <div class="card-body">
			    <a href="#" class="card-link">Card link</a>
			    <a href="#" class="card-link">Another link</a>
			  </div>
			</div>
	        
	        
	        
	        
	</body>
</html>