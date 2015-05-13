
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apartado de pensiones</title>
        <script type="text/javascript">
            
        </script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("/SAMP/error.jsp?error=acceso");
        %>
        <h1>Escoge un apartado</h1>
        <div id="nuevo">
            <h1>Nuevo pensionado</h1>
            <form method="post" action="pdf?m=altas">
                <input type="text" placeholder="Nombre del afiliado" name="nombrea"><br>
                <input type="text" placeholder="Nombre del solicitante" name="nombres"><br>
                <input type="text" placeholder="C.U.R.P" name="curp"><br>
                <input type="submit" value="Enviar">
            </form>
        </div>
        <div id="modificaciones">
            <h1>Modificaciones</h1>
            <form method="post" action="pdf?m=cambios" onsubmit="return validar(document.getElementById('nssm').value);">
                <input type="text" placeholder="NSS" id="nssm" name="nssm" maxlength="10" onkeyup="digito()">
                <input type="text" placeholder="digito" id="digito" maxlength="1"><br>
                <select name="regimen">
                    <option value="1973">1973/IMSS</option>
                    <option value="1997">1997/Aseguradora</option>
                </select><br>
                <input type="submit" value="Enviar">
            </form>
        </div>
        <div id="informacion">
            <h1>Informacion de pensionado</h1>
            <form method="post" action="pdf?m=consultas" onsubmit="return validar(document.getElementById('nssc').value);">
                <input type="text" placeholder="NSS" id="nssc" name="nssc" maxlength="10" onkeyup="digito()">
                <input type="text" placeholder="digito" id="digito" maxlength="1"><br>
                <input type="submit" value="Enviar">
            </form>
        </div>
        <div id="deshabilitar">
            <h1>Deshabilitar pensionado (CUIDADO)</h1>
            <form method="post" action="pdf?m=bajas" onsubmit="return validar(document.getElementById('nsse').value);">
                <input type="text" placeholder="NSS" id="nsse" name="nsse" maxlength="10" onkeyup="digito()">
                <input type="text" placeholder="digito" id="digito" maxlength="1"><br>
                <input type="submit" value="Enviar">
            </form>
        </div>
    </body>
</html>