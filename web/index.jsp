<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAMP | Inicio de Sesión</title>
        <link rel="stylesheet" type="text/css" href="estilos.css">
	<link rel ="shortcut icon" href="logosamp.png">
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") != null || sesion.getAttribute("clave") != null)
                response.sendRedirect("http://localhost:8080/SAMP/menu.jsp");
        %>
        <header class="header2">
            <div class="wrapper">
                <div class="logo">				
                    <img src="logosamp.png" style="height: 100px; position: absolute;">	
                    <img src="logoimsst.png" style="height: 100px; position: absolute; right: 200px;">
                </div>
            </div>
        </header>
        <section class="Contenido wrapper">
            <div class="formulario">
                <form name="login" id="login" action="pdf?m=inicio" method="post">
                    <input type="text" name="user" id="user" class="campoTexto" placeholder="Usuario" required /><br>                             
                    <input type="password" name="pass" id="pass" class="campoTexto"  placeholder="Contraseña" required /><br>
                    <input type="submit" name="Entrar" value="Entrar">
                </form>
            </div>
        </section>
    </body>
</html>
