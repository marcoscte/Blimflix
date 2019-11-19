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
        <link rel="stylesheet" href="css/estilosreg.css">
        <link href="https://fonts.googleapis.com/css?family=Prompt:300,400,500&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Ultra&display=swap" rel="stylesheet"> 
    </head>    
    <body background="bg.jpg">
        
        
        <nav class="navbar navbar-default navbar-fixed-top colornav">

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
                        <li><a class="fontnav " href="Login.jsp"><font color="#f04a25">Iniciar sesión</font></a></li>
                    </ul>
                </div>    
            </div>             
        </nav>
        
        
       
        <div class="cod-container">
        <div class="form-header">
            <img src="img/Logo.png" alt="ESCOM LOGO">
            <h1>Blim<span>Fix</span></h1>
        </div>

         <div class="form-content">
            <form name="formulario" action="RegistroS" class="cod-form" method="POST">
                <div class="form-title">
                    <h3>Regístrate Gratis</h3>
                </div>
                <div class="input-group">
                    <input type="email" class="form-input" name="mail" id="reg-correo">
                    <label class="label" for="reg-correo">Correo</label>
                </div>
                 <div class="input-group">
                    <input type="text" class="form-input" name="name" id="reg-nombre">
                    <label class="label" for="reg-nombre">Nombre</label>
                </div>
                 <div class="input-group">
                    <input type="text" class="form-input" name="lastname" id="reg-apellido">
                    <label class="label" for="reg-apellido">Apellido</label>
                </div>

                <div class="input-group">
                    <input type="password" class="form-input" name="password" id="reg-pass">
                    <label class="label" for="reg-pass">Contraseña</label>
                </div>

                <div class="input-group">
                    <input type="password" class="form-input" name="password1" id="reg-rep-pass">
                    <label class="label" for="reg-rep-pass">Repetir Contraseña</label>
                </div>

                <div class="input-group">
                    <input type="submit" class="form-input" value="Registrate">
                    <p>Ya tienes cuenta? <a href="login.html" class="alt-form">Ingresa aquí</a></p>
                </div>
               
            </form>
        </div>
    </div>


        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </body>

</html>
