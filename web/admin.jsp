<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" xml:lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    
    <title>SAMP - Administración de Usuarios</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/estilos_Menu.css" />
    <link rel="stylesheet" href="css/estilos_Admin.css" />
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
    <%
        HttpSession sesion = request.getSession(false);
        if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
            response.sendRedirect("/SAMP/error.jsp?error=acceso");
    %>

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
                <li><a href="#">Casos Extraordinarios</a></li>
                <li><a href="#">Estadísticas</a></li>
                <li><a href="#" class="actual">Usuarios</a></li>
            </ul>
        </nav>

        <figure class="logo_gob">
            <img src="img/gob.jpg" alt="loguito imss">
        </figure>
    </header>

    <section class="principal">
        <section class="contenido">
            <form method="post" action="pdf?m=usuarios" method="post" onsubmit="return usuarios()">
                <input type="text" placeholder="Usuario" id="usuario" name="usuario"><br>
                <input type="submit" value="Ver permisos">
            </form>
            <h1>Crear usuario</h1>
        <form method="post" action="pdf?m=crear" method="post" onsubmit="return vacios()">
            <input type="text" placeholder="Nuevo usuario" id="usuario" name="nuevo"><br>
            <input type="password" placeholder="Clave" id="clave" name="clave"><br>
            <input type="delegacion" placeholder="Delegacion" id="delegacion" name="delegacion" onkeypress="return numero(event)" maxlength="2"><br>
            <input type="subdelegacion" placeholder="Subdelegacion" id="subdelegacion" name="subdelegacion" onkeypress="return numero(event)" maxlength="3"><br>
            <input type="submit" value="Crear">
        </form>
        </section>
    </section>

    <footer>
        <figure>
            <img src="" alt="Aquí iría el loguito SAMP si lo tuviera x'D">
        </figure>
    </footer>
</body>
</html>