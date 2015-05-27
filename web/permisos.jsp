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
            out.println(sesion.getAttribute("permisos1"));
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
        <!--<form name="checks" action="pdf" method="post">-->
            Permiso 1<input type="checkbox" value="1" id="c1"><br>
            Permiso 2<input type="checkbox" value="2" id="c2"><br>
            Permiso 3<input type="checkbox" value="3" id="c3"><br>
            Permiso 4<input type="checkbox" value="4" id="c4"><br>
            Permiso 5<input type="checkbox" value="5" id="c5"><br>
            Permiso 6<input type="checkbox" value="6" id="c6"><br>
            Permiso 7<input type="checkbox" value="7" id="c7"><br>
            Permiso 8<input type="checkbox" value="8" id="c8"><br>
        <!--</form>-->
    </body>
</html>
