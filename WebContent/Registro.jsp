<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <meta charset="utf-8">
    <title>Inicio Blimflix</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo01">

        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
          <li class="nav-item active">
            <a class="nav-link" href="index.html">Inicio<span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Iniciar Sesion</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Registro</a>
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
        </form>
      </div>
    </nav>
    
    
	<div class="card">
	  <div class="card-body col-sm-6">
	    Registro
			<form name="formulario" method="post" action="RegistroS">
			<div class="form-group">
			    <label for="exampleInputEmail1">Nombre</label>
			    <input type="text" class="form-control" id="nombre_usuario" placeholder="Nombre" maxlength="15" required>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">Apellido</label>
			    <input type="text" class="form-control" id="apellido_usuario" placeholder="Apellido" maxlength="15" required>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">Correo electrónico</label>
			    <input type="email" class="form-control" id="mail_usuario" aria-describedby="emailHelp" placeholder="Email" maxlength="30" required>
			    
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Password</label>
			    <input type="password" class="form-control" id="pass_usuario" placeholder="Password" maxlength="30" required>
			  </div>
			  <div class="form-group form-check">
			    <input type="checkbox" class="form-check-input" id="exampleCheck1">
			    <label class="form-check-label" for="exampleCheck1">He leido y acepto <a href="Terminos.html">términos y condiciones</a></label> 
			  </div>
			  <button type="submit" class="btn btn-primary">Registrarme</button>
			</form>
		</div>
	</div>
    
    <div class="alert alert-secondary" role="alert">
    Blimflix - México 2019 - ESCOM IPN
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>