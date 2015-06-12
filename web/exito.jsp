<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" xml:lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <title>SAMP - Trámite exitoso</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/estilos_Menu.css" />
    <link rel="stylesheet" href="css/estilos_Exito.css" />
    <link rel="stylesheet" href="css/mediaQueries.css" />
    <link rel="stylesheet" href="fonts/fonts.css" />
    <!-- SCRIPT -->
    <script type="text/javascript" src="js/jquery/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/js_menu.js"></script>
    <script type="text/javascript" src="js/funciones.js"></script>
</head>
<body>
    <header>
        <div>
            <a href="#" class="btn_menu"><span class="icon-menu3"></span></a>       
        </div>
        <figure class="logo_imss">
            <img src="img/imss.jpg" alt="loguito imss">
        </figure>
        <nav>
            <ul>
                <li><a href="#" class="actual">Pensiones</a></li>
                <li><a href="#">Casos Extraordinarios</a></li>
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
            <h1>¡El trámite se realizó con éxito!</h1>
            <input type="button" value="Click para regresar" onclick="javascript:window.location.href='/SAMP/menu.jsp';">
        </section>
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                response.sendRedirect("/SAMP/error.jsp?error=acceso");
            String hue;
            if(sesion.getAttribute("ruta") != null){
                hue = sesion.getAttribute("ruta").toString();
                if(hue.equals("consultas"))
                    out.println("<a href=/SAMP/extras/consultas.pdf>Descargar el archivo</a>");
                else
                    out.println("<a href=/SAMP/extras/"+hue+">Descargar el archivo</a>");
                sesion.removeAttribute("ruta");
            }
        %>
    </section>
    <footer>
        <figure>
            <img src="" alt="Aquí iría el loguito SAMP si lo tuviera x'D">
        </figure>
    </footer>
</body>
</html>