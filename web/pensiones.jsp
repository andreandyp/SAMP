<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apartado de pensiones</title>
        <script type="text/javascript" src="funciones.js"></script>
        <script type="text/javascript">
            function eliminar(){
                var opcion = document.getElementById('m');
                <%
                    HttpSession sesion = request.getSession(false);
                    String prm = sesion.getAttribute("permisos").toString();
                    if(prm.indexOf('3') == -1)
                        out.println("opcion.remove(3);");
                    if(prm.indexOf('2') == -1)
                        out.println("opcion.remove(2);");
                    if(prm.indexOf('1') == -1)
                        out.println("opcion.remove(1);");
                %>
            }
        </script>
    </head>
    <body onload="eliminar()">
        <%
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("/SAMP/error.jsp?error=acceso");
        %>
        <div id="Pensiones">
            <h1>Pensiones</h1>
            <form method="post" action="pdf" onsubmit="return valida()">
                <input type="text" placeholder="NSS" id="nss" name="nss" maxlength="10" onkeyup="verificar()" onkeypress="return numero(event)">
                <input type="text" placeholder="digito" id="digito" maxlength="1" disabled><br>
                <select name="m" id="m" onchange="combo()">
                    <option value="nada" selected>Escoge una opcion</option>
                    <option value="cambios">Modificaciones</option>
                    <option value="consultas">Consultas</option>
                    <option value="bajas">Deshabilitar</option>
                </select><br>
                <select name="regimen" id="regimen" style="display: none;">
                    <option value="1973">1973/IMSS</option>
                    <option value="1997">1997/Aseguradora</option>
                </select><br>
                <input type="submit" value="Enviar">
            </form>
        </div>
    </body>
</html>