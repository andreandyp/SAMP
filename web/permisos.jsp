<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Permisos disponibles</title>
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("/SAMP/error.jsp?error=acceso");
        %>
        <script type="text/javascript">
            function cuadritos(){
                var permisos = <%out.println(request.getParameter("permisos"));%>;
                permisos = permisos.toString();
                for(var i = 0; i < permisos.length; ++i){
                    document.getElementById('c'+permisos.charAt(i)).checked = true;
                }
                <%
                    String prm = sesion.getAttribute("permisos").toString();
                    if(prm.indexOf('7') == -1){
                        out.println("document.getElementById('c1').disabled = true;");
                        out.println("document.getElementById('c2').disabled = true;");
                        out.println("document.getElementById('c3').disabled = true;");
                        out.println("document.getElementById('c4').disabled = true;");
                        out.println("document.getElementById('c5').disabled = true;");
                        out.println("document.getElementById('c6').disabled = true;");
                        out.println("document.getElementById('c7').disabled = true;");
                        out.println("document.getElementById('c8').disabled = true;");
                        out.println("document.getElementById('aceptar').style.display = \"none\";");
                        out.println("document.getElementById('regresar').style.display = \"block\";");
                    }    
                %>
            }
        </script>
    </head>
    <body onload="cuadritos()">
        <form name="checks" action="pdf?m=permisos" method="post">
            <p><%out.println(request.getParameter("usuario"));%></p>
            <input type="text" value="<%out.println(request.getParameter("usuario"));%>" name="cosa" hidden>
            <h3>Pensiones</h3>
            Modificar<input type="checkbox" value="1" id="c1" name="permiso"><br>
            Consultar<input type="checkbox" value="2" id="c2" name="permiso"><br>
            Deshabilitar<input type="checkbox" value="3" id="c3" name="permiso"><br>
            <h3>Casos especiales</h3>
            Ver información disponible<input type="checkbox" value="4" id="c4" name="permiso"><br>
            Completar información<input type="checkbox" value="5" id="c5" name="permiso"><br>
            <h3>Administración de usuarios</h3>
            Ver permisos<input type="checkbox" value="6" id="c6" name="permiso"><br>
            Modificar permisos<input type="checkbox" value="7" id="c7" name="permiso"><br>
            <h3>Estadisticas</h3>
            Ver estadisticas<input type="checkbox" value="8" id="c8" name="permiso"><br>
            <input type="submit" id="aceptar" value="Asignar permisos">
            <input type="button" id="regresar" value="Click para regresar"
                   style="display: none;" onclick="javascript:window.location.href='/SAMP/menu.jsp';">
        </form>
    </body>
</html>
