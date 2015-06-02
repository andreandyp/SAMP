<!-- <%@page contentType="text/html" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="es" xml:lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    
    <title>SAMP - Pensiones</title>

    <!-- CSS -->
    <link rel="stylesheet" href="../css/estilos_Menu.css" />
    <link rel="stylesheet" href="../css/estilos_Pensiones.css" />
    <link rel="stylesheet" href="../css/mediaQueries.css" />
    <link rel="stylesheet" href="../fonts/fonts.css" />

    <!-- SCRIPT -->
    <script type="text/javascript" src="../js/jquery/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="../js/jquery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../js/jquery/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="../js/js_menu.js"></script>
    <script type="text/javascript" src="../js/funciones.js"></script>
</head>
<body>
    <!-- <%
        HttpSession sesion = request.getSession(false);
        if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
            response.sendRedirect("/SAMP/error.jsp?error=acceso");
    %> -->

    <header>
        <div>
            <a href="#" class="btn_menu"><span class="icon-menu3"></span></a>       
        </div>

        <figure class="logo_imss">
            <img src="../img/imss.jpg" alt="loguito imss">
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
            <img src="../img/gob.jpg" alt="loguito imss">
        </figure>
    </header>

    <section class="principal">
        <section class="contenido">
            <form method="post" action="pdf" onsubmit="return valida()">
                <input type="text" placeholder="NSS" id="nss" name="nss" maxlength="10" onkeyup="verificar()" onkeypress="return numero(event)">

                <input type="text" placeholder="Dígito" id="digito" maxlength="1" disabled>

                <select name="m" id="m" onchange="combo()">
                    <option value="nada" selected>Escoge una opcion</option>
                    <option value="cambios">Modificaciones</option>
                    <option value="consultas">Consultas</option>
                    <option value="bajas">Deshabilitar</option>
                </select>

                <select name="regimen" id="regimen" style="display: none;">
                    <option value="1973">1973/IMSS</option>
                    <option value="1997">1997/Aseguradora</option>
                </select>

                <input type="submit" value="Enviar">
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