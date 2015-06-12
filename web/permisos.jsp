<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" xml:lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    
    <title>SAMP - Permisos</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/estilos_Menu.css" />
    <link rel="stylesheet" href="css/estilos_Permisos.css" />
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

    <script type="text/javascript">
            function cuadritos(){
                var permisos = <%out.println(request.getParameter("permisos"));%>;
                permisos = permisos.toString();
                for(var i = 0; i < permisos.length; ++i){
                    document.getElementById('c'+permisos.charAt(i)).checked = true;
                }
                <%
                    String prm = sesion.getAttribute("permisos").toString();
                    if(prm.indexOf('7') == -1){
                        out.println("document.getElementById('c1').disabled = true;");
                        out.println("document.getElementById('c2').disabled = true;");
                        out.println("document.getElementById('c3').disabled = true;");
                        out.println("document.getElementById('c4').disabled = true;");
                        out.println("document.getElementById('c5').disabled = true;");
                        out.println("document.getElementById('c6').disabled = true;");
                        out.println("document.getElementById('c7').disabled = true;");
                        out.println("document.getElementById('c8').disabled = true;");
                        out.println("document.getElementById('c9').disabled = true;");
                        out.println("document.getElementById('c0').disabled = true;");
                        out.println("document.getElementById('aceptar').style.display = \"none\";");
                        out.println("document.getElementById('regresar').style.display = \"block\";");
                    }
                    if(prm.indexOf('9') != -1)
                        out.println("document.getElementById('borrar').style.display = \"block\";");
                %>
            }
        </script>
</head>
<body onload="cuadritos()">
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
            <img src="img/gob.jpg" alt="loguito gob">
        </figure>
    </header>

    <section class="principal">
        <section class="contenido">
            <form name="checks" action="pdf?m=permisos" method="post" onsubmit="return cambioclave()">
                <p>Usuario: <%out.println(request.getParameter("usuario"));%></p>
                <input type="text" value="<%out.println(request.getParameter("usuario"));%>" name="cosa" hidden>

                <h3>Pensiones</h3>

                <div><p>Modificar</p><input type="checkbox" value="1" id="c1" name="permiso"></div>
                <div><p>Consultar</p><input type="checkbox" value="2" id="c2" name="permiso"></div>
                <div><p>Deshabilitar</p><input type="checkbox" value="3" id="c3" name="permiso"></div>



                <h3>Casos especiales</h3>

                <div><p>Ver información disponible</p><input type="checkbox" value="4" id="c4" name="permiso"></div>
                <div><p>Completar información</p><input type="checkbox" value="5" id="c5" name="permiso"></div>



                <h3>Administración de usuarios</h3>

                <div><p>Ver permisos</p><input type="checkbox" value="6" id="c6" name="permiso"></div>
                <div><p>Modificar usuario</p><input type="checkbox" value="7" id="c7" name="permiso"></div>
                <div><p>Crear usuario</p><input type="checkbox" value="8" id="c8" name="permiso"></div>
                <div><p>Borrar usuario</p><input type="checkbox" value="9" id="c9" name="permiso"></div>



                <h3>Estadísticas</h3>

                <div><p>Ver estadísticas</p><input type="checkbox" value="0" id="c0" name="permiso"></div>
                <input type="submit" id="aceptar" value="Asignar permisos">
                <input type="button" id="regresar" value="Click para regresar"
                   style="display: block;" onclick="javascript:window.location.href='/SAMP/menu.jsp';">
            </form>

            <div id="borrar">
                <form action="pdf?m=borrar" method="post">
                    <input type="text" value="<%out.println(request.getParameter("usuario"));%>" name="cosa2" style="display: none;">
                    <input type="submit" value="Eliminar usuario">
                </form>
            </div>
        </section>
    </section>
</body>
</html>