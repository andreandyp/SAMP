
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu principal</title>
        <script type="text/javascript">
            function ocultar(){
            <%
                HttpSession sesion = request.getSession(false);
                String prm = sesion.getAttribute("permisos").toString();
                if(prm.indexOf('1') == -1 && prm.indexOf('2') == -1 && prm.indexOf('3') == -1)
                    out.println("document.getElementById('pensiones').hidden = true;");
                if(prm.indexOf('4') == -1 && prm.indexOf('5') == -1)
                    out.println("document.getElementById('casos').hidden = true;");
                if(prm.indexOf('6') == -1 && prm.indexOf('7') == -1)
                    out.println("document.getElementById('admin').hidden = true;");
                if(prm.indexOf('8') == -1)
                    out.println("document.getElementById('estadisticas').hidden = true;");
            %>
                }
        </script>
    </head>
    <body onload="ocultar()">
        <%
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("/SAMP/error.jsp?error=acceso");
        %>
        <h1>Bienvenido <%out.println(sesion.getAttribute("usuario"));%></h1>
        <a href="/SAMP/pensiones.jsp" id="pensiones">Pensiones</a><br>
        <a href="/SAMP/casos.jsp" id="casos">Casos especiales</a><br>
        <a href="/SAMP/admin.jsp" id="admin">Administracion de usuarios</a><br>
        <a href="/SAMP/estadisticas.jsp" id="estadisticas">Estadisticas</a><br>
        <br>
        <form method="post" action="pdf?m=salir">
            <input type="submit" value="Salir">
        </form>
    </body>
</html>
