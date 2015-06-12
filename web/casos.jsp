<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" xml:lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <title>SAMP - Casos Extraordinarios</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/estilos_Menu.css" />
    <link rel="stylesheet" href="css/estilos_Casos.css" />
    <link rel="stylesheet" href="css/mediaQueries.css" />
    <link rel="stylesheet" href="fonts/fonts.css" />
    <!-- SCRIPT -->
    <script type="text/javascript" src="js/jquery/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/js_menu.js"></script>
    <script type="text/javascript" src="js/funciones.js"></script>
    <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("/SAMP/error.jsp?error=acceso");
        %>
</head>
<body onload="casos()">
    <header>
        <div>
            <a href="#" class="btn_menu"><span class="icon-menu3"></span></a>       
        </div>
        <figure class="logo_imss">
            <img src="img/imss.jpg" alt="loguito imss">
        </figure>
        <nav>
            <ul>
                <li><a href="#">Pensiones</a></li>
                <li><a href="#" class="actual">Casos Extraordinarios</a></li>
                <li><a href="#">Estadísticas</a></li>
                <li><a href="#">Usuarios</a></li>
            </ul>
        </nav>
        <figure class="logo_gob">
            <img src="img/gob.jpg" alt="loguito imss">
        </figure>
    </header>
    <section class="principal">
        <section class="contenido">
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
                <input type="submit" value="Solicitar informacion">
            </form>
        </section>
    </section>
</body>
</html>