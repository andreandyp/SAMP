<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" xml:lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    
    <title>SAMP - Error</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/estilos_Menu.css" />
    <link rel="stylesheet" href="css/estilos_Error.css" />
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
            <h1>Ha ocurrido un error :(</h1>

            <input type="button" value="Regresar" onclick="javascript: window.history.back();"><br><br>

            <%
                HttpSession sesion = request.getSession(false);
                if(request.getParameter("error") != null)
                    out.println("Ya te vi. ¿Qué estas tramando? No eres un hacker, llegale");
                else{
                    out.println("<br>Error exacto:");
                    out.println(sesion.getAttribute("log"));
                }
            %>
        </section>
    </section>
</body>
</html>