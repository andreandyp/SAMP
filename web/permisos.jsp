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
                var permisos = <%=sesion.getAttribute("permisos1")%>;
                permisos = permisos.toString();
                for(var i = 0; i <= permisos.length; ++i){
                    document.getElementById('c'+permisos.charAt(i)).checked = true;
                }
            }
        </script>
    </head>
    <body onload="cuadritos()">
        <form name="checks" action="pdf" method="post">
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
            <input type="submit" value="Asignar permisos">
        </form>
    </body>
</html>
