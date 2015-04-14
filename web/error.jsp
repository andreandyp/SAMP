<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <script type="text/javascript">
            function regresar() {
                window.history.back();
                }
        </script>
    </head>
    <body>
        <h1>Ha ocurrido un error :(</h1>
        <input type="button" value="Regresar" onclick="regresar()"><br><br>
        <%
            HttpSession sesion = request.getSession(false);
            if(request.getParameter("error") != null)
                out.println("Ya te vi. ¿Qué estas tramando? No eres un hacker, llegale");
            else{
                out.println("Posible causa:");
                out.println(sesion.getAttribute("Error"));
                out.println("<br>Error exacto:");
                out.println(sesion.getAttribute("log"));
            }
        %>
    </body>
</html>