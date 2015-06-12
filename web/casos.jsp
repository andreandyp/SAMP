<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAMP - Casos Extraordinarios</title>
        <script type="text/javascript" src="js/funciones.js"></script>
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("/SAMP/error.jsp?error=acceso");
        %>
    </head>
    <body>
        <form action="pdf?m=extras" method="post">
        <h1>Escoge una opción</h1>
        <select name="info" id="info" onchange="casos()">
            <option value="hue" selected>Escoge</option>
            <option value="nombrea">Nombre del asegurado</option>
            <option value="nombres">Nombre del solicitante</option>
            <option value="nss">NSS</option>
            <option value="folio">Folio</option>
            <option value="curp">CURP</option>
        </select>
        <input type="text" name="nombrea" placeholder="Nombre del asegurado" id="nombrea" style="display: none;">
        <input type="text" name="nombres" placeholder="Nombre del solicitante" id="nombres" style="display: none;">
        <input type="text" name="nss" placeholder="NSS" id="nss" maxlength="11" onkeypress="return numeros(event)" style="display: none;">
        <input type="text" name="folio" placeholder="Folio" id="folio" maxlength="8" onkeypress="return numeros(evet)" style="display: none;">
        <input type="text" name="curp" placeholder="CURP" id="curp" maxlength="18" style="display: none;">
        <br><input type="submit" value="Solicitar informacion">
    </body>
    </form>
</html>