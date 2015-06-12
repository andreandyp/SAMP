<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" xml:lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <title>SAMP - Casos extraodinarios</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/estilos_Menu.css" />
    <link rel="stylesheet" href="css/estilos_Actualizar.css" />
    <link rel="stylesheet" href="css/mediaQueries.css" />
    <link rel="stylesheet" href="fonts/fonts.css" />
    <!-- SCRIPT -->
    <script type="text/javascript" src="js/jquery/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/js_menu.js"></script>
    <script type="text/javascript" src="js/funciones.js"></script>
    <script type="text/javascript">
            function vnull(){
                <%
                    String nombrea,nombres,nss,folio,curp;
                    HttpSession sesion = request.getSession(false);
                    if(sesion.getAttribute("usuario") == null || sesion.getAttribute("clave") == null)
                        response.sendRedirect("/SAMP/error.jsp?error=acceso");
                    nombrea = request.getParameter("nombrea");
                    nombres = request.getParameter("nombres");
                    nss = request.getParameter("nss");
                    folio = request.getParameter("folio");
                    curp = request.getParameter("curp");
                    if(!nombrea.equals("null"))
                        out.println("document.getElementById('nombrea').value = '"+nombrea+"';");
                    if(!nombres.equals("null"))
                        out.println("document.getElementById('nombres').value = '"+nombres+"';");
                    if(!nss.equals("null"))
                        out.println("document.getElementById('nss').value = '"+nss+"';");
                    if(!folio.equals("null"))
                        out.println("document.getElementById('folio').value = '"+folio+"';");
                    if(!curp.equals("null"))
                        out.println("document.getElementById('curp').value = '"+curp+"';");
                %>
            }
        </script>
</head>
<body onload="vnull()">
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
            <form action="pdf?m=actualizar" method="post">
                <h1>Actualiza la información que tengas</h1>
                <input type="text" name="nombrea" placeholder="Nombre del asegurado" id="nombrea">
                <input type="text" name="nombres" placeholder="Nombre del solicitante" id="nombres">
                <input type="text" name="nss" placeholder="NSS" id="nss" onkeypress="return numero(event)" maxlength="11">
                <input type="text" name="folio" placeholder="Folio" id="folio" maxlength="8" onkeypress="return numero(eve)">
                <input type="text" name="curp" placeholder="CURP" id="curp" maxlength="18">
                <input type="submit" value="Actualizar informacion">
            </form>
        </section>
    </section>
</body>
</html>