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
                if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                    response.sendRedirect("/SAMP/error.jsp?error=acceso");
                String prm = sesion.getAttribute("permisos").toString();
                if(prm.indexOf('1') == -1 && prm.indexOf('2') == -1 && prm.indexOf('3') == -1)
                    out.println("document.getElementById('pensiones').style.display = \"none\";");
                if(prm.indexOf('4') == -1 && prm.indexOf('5') == -1)
                    out.println("document.getElementById('casos').style.display = \"none\";");
                if(prm.indexOf('6') == -1 && prm.indexOf('8') == -1 && prm.indexOf('9') == -1)
                    out.println("document.getElementById('admin').style.display = \"none\";");
                if(prm.indexOf('0') == -1)
                    out.println("document.getElementById('estadisticas').style.display = \"none\";");
            %>
                }
        </script>
    </head>
    <body onload="ocultar()">
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