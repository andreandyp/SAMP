
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu principal</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("http://localhost:8080/SAMP/error.jsp?error=acceso");
        %>
        <h1>Bienvenido <%out.println(sesion.getAttribute("usuario"));%></h1>
        <a href="http://localhost:8080/SAMP/pensiones.jsp">Pensiones</a><br>
        <a href="http://localhost:8080/SAMP/casos.jsp">Casos especiales</a><br>
        <a href="http://localhost:8080/SAMP/estadisticas.jsp">Estadisticas</a><br>
        <a href="http://localhost:8080/SAMP/admin.jsp">Administracion de usuarios</a>
        <br><br>
        <form method="post" action="pdf?m=salir">
            <input type="submit" value="Salir">
        </form>
    </body>
</html>
