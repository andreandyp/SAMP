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
                //document.getElementById('coinciden').value = "";
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
                        out.println("document.getElementById('c9').disabled = true;");
                        out.println("document.getElementById('c0').disabled = true;");
                        //out.println("document.getElementById('vieja').style.display = \"none\";");
                        //out.println("document.getElementById('nueva').style.display = \"none\";");
                        //out.println("document.getElementById('nueva2').style.display = \"none\";");
                        //out.println("document.getElementById('coinciden').style.display = \"none\";");
                        out.println("document.getElementById('aceptar').style.display = \"none\";");
                        out.println("document.getElementById('regresar').style.display = \"block\";");
                    }
                    if(prm.indexOf('9') != -1)
                        out.println("document.getElementById('borrar').style.display = \"block\";");
                %>
            }
        </script>
        <script type="text/javascript" src="js/funciones.js"></script>
    </head>
    <body onload="cuadritos()">
        <%
                    if(request.getParameter("error") != null)
                        out.println("Clave incorrecta");
        %>
        <form name="checks" action="pdf?m=permisos" method="post" onsubmit="return cambioclave()">
            <p>Usuario: <%out.println(request.getParameter("usuario"));%></p>
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
            Modificar usuario<input type="checkbox" value="7" id="c7" name="permiso"><br>
            Crear usuario<input type="checkbox" value="8" id="c8" name="permiso"><br>
            Borrar usuario<input type="checkbox" value="9" id="c9" name="permiso"><br>
            <h3>Estadisticas</h3>
            Ver estadisticas<input type="checkbox" value="0" id="c0" name="permiso"><br>
            <!--<h3 id="tclave">Nueva clave</h3>
            <input type="password" placeholder="Clave antigua" id="vieja" name="vieja"><br>
            <input type="password" placeholder="Clave nueva" id="nueva" name="nueva"><br>
            <input type="password" placeholder="Repetir clave" id="nueva2" onkeyup="repetir()"><br>
            <input type="text" value="" id="coinciden" disabled><br>-->
            <input type="submit" id="aceptar" value="Asignar permisos">
            <input type="button" id="regresar" value="Click para regresar"
                   style="display: none;" onclick="javascript:window.location.href='/SAMP/menu.jsp';">
        </form>
        <div id="borrar" style="display: none;">
            <form action="pdf?m=borrar" method="post">
                <input type="text" value="<%out.println(request.getParameter("usuario"));%>" name="cosa2" hidden>
                <input type="submit" value="Eliminar usuario">
            </form>
        </div>
    </body>
</html>
