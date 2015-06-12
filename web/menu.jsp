<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" xml:lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />

    <title>SAMP - Menú</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/estilos_Menu.css" />
    <link rel="stylesheet" href="css/estilos_Menu2.css" />
    <link rel="stylesheet" href="css/mediaQueries.css" />
    <link rel="stylesheet" href="fonts/fonts.css" />

    <!-- SCRIPT -->
    <script type="text/javascript" src="js/jquery/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/js_menu.js"></script>

    <script type="text/javascript">
            function ocultar(){
            <%
                HttpSession sesion = request.getSession(false);
                if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                    response.sendRedirect("/SAMP/error.jsp?error=acceso");
                String prm = sesion.getAttribute("permisos").toString();
                if(prm.indexOf('1') == -1 && prm.indexOf('2') == -1 && prm.indexOf('3') == -1)
                    out.println("document.getElementById('pensiones').style.display = \"none\";");
                if(prm.indexOf('4') == -1 && prm.indexOf('5') == -1)
                    out.println("document.getElementById('casos').style.display = \"none\";");
                if(prm.indexOf('6') == -1 && prm.indexOf('8') == -1 && prm.indexOf('9') == -1)
                    out.println("document.getElementById('admin').style.display = \"none\";");
                if(prm.indexOf('0') == -1)
                    out.println("document.getElementById('estadisticas').style.display = \"none\";");
            %>
                }
        </script>
</head>
<body onload="ocultar()">
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
                <li><a href="#">Usuarios</a></li>
            </ul>
        </nav>

        <figure class="logo_gob">
            <img src="img/gob.jpg" alt="loguito imss">
        </figure>
    </header>

    <section class="principal">
        <section class="contenido">
            <h1>Bienvenido <%out.println(sesion.getAttribute("usuario"));%></h1>
            <a href="/SAMP/pensiones.jsp" id="pensiones">Pensiones</a><br>
            <a href="/SAMP/casos.jsp" id="casos">Casos especiales</a><br>
            <a href="/SAMP/admin.jsp" id="admin">Administracion de usuarios</a><br>
            <a href="/SAMP/estadisticas.jsp" id="estadisticas">Estadisticas</a><br>
            <br>
            <form method="post" action="pdf?m=salir">
                <input type="submit" value="Salir">
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