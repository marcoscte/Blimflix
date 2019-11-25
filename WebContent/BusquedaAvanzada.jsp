<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="mx.resources.java.Usuario"%>
    
<!DOCTYPE html>
<html lang="es">

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
			System.out.println("Se conecto BusquedaSimple");
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("No se conecto BusquedaSimple");
			
		}
		
		%>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link  rel="stylesheet" href="https://fonts.googleapis.com/css?family=Ultra&display=swap"> 
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/busquedaavanzada.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <title>topSeries</title>
    </head>
    <body background="img/fondoindex.jpg">
        <nav class="navbar navbar-default navbar-static-top">

            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Este botón despliega la barra de navación</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="http://localhost/Proyecto1/index.html"><font color="#f04a25" size="30px">BlimFix</font></a>
                </div>                
                <div id="navbar" class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">

                        <li><a href="http://localhost/Proyecto1/index.html"><font color="#f04a25">Inicio</font></a></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="fontnav " href=""><font color="#f04a25">Mi info</font></a></li>
                    </ul>
                </div>    
            </div>             
        </nav>




        <div class="container">


            <div class="row">
                <div class="col-md-8 ">
                    <form>
                        <div class="form-group">
                            <label for="nomSerie" class="lbl1">Nombre de Serie</label>
                            <input type="text" class="form-control" id="nomSerie">
                        </div>
                        <div class="form-group">
                            <label for="nomAutor" class="lbl1">Actor Principal</label>
                            <input type="text" class="form-control" id="nomAutor">
                        </div>
                        <div class="form-group">
                            <label for="nomDirector" class="lbl1">Director</label>
                            <input type="text" class="form-control" id="nomDirector">
                        </div>
                        <div class="form-group">
                            <label for="numTemporadas" class="lbl1">Temporadas</label>
                            <select class="form-control" id="numTemporadas">
                            <%int tmps = 0;
                            		String queryTemps = "SELECT MAX(TEMPORADAS) AS TEMPORADAS FROM SERIE";
                            		resultSet = statement.executeQuery(queryTemps);
                            		while(resultSet.next()){
                            			tmps = resultSet.getInt("TEMPORADAS");
                            		}
                            		
                            		for(int i=1; i<= tmps; i++){
                            		%>
                                <option><%=i%></option>
<%} %>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlSelect1" class="lbl1">Pais de origen</label>
                            <select class="form-control" id="paisOrigen">
                            <% 
                            String queryPais = "SELECT DISTINCT PAIS_SERIE FROM SERIE";
                            		String pais ="";
                            		resultSet = statement.executeQuery(queryPais);
                            		while(resultSet.next()){
                            			pais = resultSet.getString("PAIS_SERIE");
                            			%>
                            			<option><%=pais%></option>
                            		<%}%>
                            
                                
                            </select>
                        </div>
                     <button class="btn " id="botonBuscarAvanzado">Buscar</button>
                        
                    </form>
                </div>




                <div class="col-md-4">
                    <div class="img-thumbnail">
                        <a href="#">
                            
                            <!-- Imagen solo de ejemplo para que ahi aparezca la busqueda -->
                            <img src="img/1s.jpg" alt="imagen top3" style="width:100%">

                        </a>
                    </div>
                    <textarea name="textarea" rows="200" cols="60" readonly id="textAreaBusquedaAvanzada" ></textarea>
                </div>

            </div>
        </div>





        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>


   

</html>