<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Blog</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilos.css" rel="stylesheet">
        <link rel="stylesheet" href="css/estilosLogin.css">
        <link href="https://fonts.googleapis.com/css?family=Prompt:300,400,500&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Ultra&display=swap" rel="stylesheet"> 
    </head>    
    <body background="bg.jpg">
       
        <nav class="navbar navbar-default navbar-static-top colornav">

            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Este botón despliega la barra de navación</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><font color="#f04a25" size="30px">BlimFix</font></a>
                </div>                
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a class="fontnav" href="http://localhost/Proyecto1/topSeries.html"><font color="#f04a25">Top Series</font></a></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="fontnav " href="Registro.jsp"><font color="#f04a25">Registrarse</font></a></li>
                    </ul>
                </div>    
            </div>             
        </nav>

       	
        <div class="form-content">
        <div class="login-box">
        <form name="FormLogin" action="LoginS" method="post">
        <div class="alert alert-danger" role="alert">
  		Usuario y o Contraseña incorrectos
		</div>
            <h1>Login</h1>
            <div class="textbox">
                <i class="fas fa-user"></i>
                <input type="text" name="email" placeholder="Email">
            </div>

            <div class="textbox">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Password">
            </div>

            <input type="submit" class="btn" value="Iniciar Sesión">
            </form>
        </div>
        </div>    

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </body>

</html>