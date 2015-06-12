
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAMP - Casos extraodinarios</title>
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
                    out.println(curp);
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
        <form action="pdf?m=actualizar" method="post">
        <h1>Actualiza la informacion que tengas</h1>
        <input type="text" name="nombrea" placeholder="Nombre del asegurado" id="nombrea"><br>
        <input type="text" name="nombres" placeholder="Nombre del solicitante" id="nombres"><br>
        <input type="text" name="nss" placeholder="NSS" id="nss"><br>
        <input type="text" name="folio" placeholder="Folio" id="folio"><br>
        <input type="text" name="curp" placeholder="CURP" id="curp"><br>
        <input type="submit" value="Actualizar informacion">
        </form>
    </body>
</html>
