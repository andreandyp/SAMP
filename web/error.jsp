<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error!!</title>
        <script type="text/javascript">
            function regresar() {
                window.history.back();
                }
        </script>
    </head>
    <body>
        <h1>Ha ocurrido un error :(</h1>
        <%
            out.println("Posible causa:");
            HttpSession sesion = request.getSession(false);
            out.println(sesion.getAttribute("Error"));
        %>
        <h1>Vuelve a intentarlo mas tarde o pulsa el boton para regresar</h1>
        <input type="button" value="Regresar" onclick="regresar()">
    </body>
</html>
