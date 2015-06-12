<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estadisticas</title>
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("/SAMP/error.jsp?error=acceso");
        %>
    </head>
    <body>
        <h1>Ver registro de algun usuario</h1>
        <form method="post" action="resultados.jsp">
            <input type="text" placeholder="Usuario" name="victima">
            <input type="submit" value="Ver su registro">
        </form>
    </body>
</html>