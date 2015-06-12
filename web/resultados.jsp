<!-- <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="es" xml:lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    
    <title>SAMP - Estadisticas</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/estilos_Menu.css" />
    <link rel="stylesheet" href="css/estilos_Resultados.css" />
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
            Connection conx;
    Statement stm = null;
    ResultSet rs;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","IMSS","ClaveSecreta127");
        stm = conx.createStatement();
        }
        catch(SQLException sqle){
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", sqle.getMessage());
        }
        catch(ClassNotFoundException e){}
        %>
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
                <li><a href="#">Pensiones</a></li>
                <li><a href="#">Casos Extraordinarios</a></li>
                <li><a href="#" class="actual">Estadísticas</a></li>
                <li><a href="#">Usuarios</a></li>
            </ul>
        </nav>
        <figure class="logo_gob">
            <img src="img/gob.jpg" alt="loguito imss">
        </figure>
    </header>
    <section class="principal">
        <section class="contenido">
            <h1>Datos del usuario</h1>

            <p><b>Usuario:</b> <%out.println(request.getParameter("victima"));%></p>

            <table style="text-align: center;">
                <tr>
                    <td class="columna1"><h3>Trámite</h3></td>
                    <td class="columna2"><h3>Fecha y hora</h3></td>
                </tr>
                    <%
                        try{
                rs = stm.executeQuery("call log('"+request.getParameter("victima")+"')");
                while(rs.next()){
                    out.println("<tr><td>"+rs.getString(1)+"</td>");
                    out.println("<td>"+rs.getString(2)+"</td></tr>");
                }
            }
            catch(SQLException se){
                sesion.setAttribute("Error", "Error desconocido en la aplicacion");
                sesion.setAttribute("log", se.getMessage());
            }
                    %>
            </table>
        </section>
    </section>
</body>
</html>