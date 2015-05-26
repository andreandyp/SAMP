<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administracion de usuarios</title>
        <script type="text/javascript" src="funciones.js"></script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("/SAMP/error.jsp?error=acceso");
        %>
        <form method="post" action="pdf?m=usuarios" onsubmit="return usuario()">
            <input type="text" placeholder="Usuario" id="usuario" name="usuario"><br>
            <input type="submit" value="Ver permisos">
        </form>
    </body>
</html>
