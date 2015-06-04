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
        <h1>Administrar permisos de usuario</h1>
        <form method="post" action="pdf?m=usuarios" method="post" onsubmit="return usuarios()">
            <input type="text" placeholder="Usuario" id="usuario" name="usuario"><br>
            <input type="submit" value="Administrar">
        </form>
        <h1>Crear usuario</h1>
        <form method="post" action="pdf?m=crear" method="post" onsubmit="return vacios()">
            <input type="text" placeholder="Nuevo usuario" id="usuario" name="nuevo"><br>
            <input type="password" placeholder="Clave" id="clave" name="clave"><br>
            <input type="delegacion" placeholder="Delegacion" id="delegacion" name="delegacion" onkeypress="return numero(event)" maxlength="2"><br>
            <input type="subdelegacion" placeholder="Subdelegacion" id="subdelegacion" name="subdelegacion" onkeypress="return numero(event)" maxlength="3"><br>
            <input type="submit" value="Crear">
        </form>
    </body>
</html>
