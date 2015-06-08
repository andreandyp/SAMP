<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAMP - Estadisticas</title>
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("/SAMP/error.jsp?error=acceso");
        %>
    </head>
    <body>
        <h1>Datos del usuario</h1>
        Usuario: <%out.println(request.getParameter("usuario"));%>
        
    </body>
</html>
