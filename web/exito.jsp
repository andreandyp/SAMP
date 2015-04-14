
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>¡Tramite exitoso!</title>
        <script type="text/javascript">
            function regresar() {
                window.history.back();
                }
        </script>
    </head>
    <body>
        <%HttpSession sesion = request.getSession(false);%>
        <h1>¡El tramite se realizo con exito!</h1>
        <input type="button" value="Click para regresar" onclick="regresar()"><br>
        <%
        out.println("<a href=\"http://localhost:8080/SAMP/"+sesion.getAttribute("Archivo")+"\">Descargar el archivo</a>");
        %>
    </body>
</html>
