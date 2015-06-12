<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAMP - Estadisticas</title>
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
        <h1>Datos del usuario</h1>
        Usuario: <%out.println(request.getParameter("victima"));%>
        <table style="text-align: justify;">
            <tr>
                <td><h3>Tramite</h3></td>
                <td><h3>Fecha y hora</h3></td>
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
    </body>
</html>