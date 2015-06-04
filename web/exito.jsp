
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>¡Tramite exitoso!</title>
        <script type="text/javascript"></script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("/SAMP/error.jsp?error=acceso");
        %>
        <h1>¡El tramite se realizo con exito!</h1>
        <input type="button" value="Click para regresar" onclick="javascript:window.location.href='/SAMP/menu.jsp';"><br>
        <%
            String hue;
            if(sesion.getAttribute("ruta") != null){
                hue = sesion.getAttribute("ruta").toString();
                if(hue.equals("consultas"))
                    out.println("<a href=/SAMP/extras/consultas.pdf>Descargar el archivo</a>");
                else
                    out.println("<a href=/SAMP/extras/"+hue+">Descargar el archivo</a>");
                sesion.removeAttribute("ruta");
            }
        %>
    </body>
</html>
