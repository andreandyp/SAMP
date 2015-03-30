
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apartado de pensiones</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") == null){
                response.sendRedirect("http://localhost:8080/SAMP/index.html");
            }
        %>
        <h1>Escoge un apartado</h1>
        <div id="nuevo">
            <form method="post" action="pdf?m=altas">
                
            </form>
        </div>
        <div id="modificaciones">
            <h1>Modificaciones</h1>
            <form method="post" action="pdf?m=cambios">
                <input type="text" placeholder="nss" name="nssm">
                <select name="regimen">
                    <option name="IMSS/1973">IMSS/1973</option>
                    <option name="Aseguradora/1997">Aseguradora/1997</option>
                </select>
                <input type="submit" value="Enviar">
            </form>
        </div>
        <div id="informacion">
            <h1>Informacion de pensionado</h1>
            <form method="post" action="pdf?m=consultas">
                <input type="text" placeholder="nss" name="nssc">
                <input type="submit" value="Enviar">
            </form>
        </div>
        <div id="deshabilitar">
            <h1>Deshabilitar pensionado (CUIDADO)</h1>
            <form method="post" action="pdf?m=bajas">
                <input type="text" placeholder="nss" name="nssc">
                <input type="submit" value="Enviar">
            </form>
        </div>
    </body>
</html>