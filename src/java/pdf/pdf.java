package pdf;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "pdf", urlPatterns = {"/pdf"})
public class pdf extends HttpServlet{
    Connection conx;
    Statement stm;
    ResultSet rs;
    String nss,ruta,usuario,delegacion,subdelegacion,u;
    HttpSession sesion;
    usuario usu;
    Date date;
    private void conexion() throws SQLException,ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","IMSS","ClaveSecreta127");
        stm = conx.createStatement();
    }
    private void inicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        sesion = request.getSession(true);
        sesion.setMaxInactiveInterval(60*60*24);
        try{conexion();}
        catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try{
        rs = stm.executeQuery("call sesion('"+user+"','"+pass+"')");
        if(rs.next()){
            if(rs.getString(1) != null){
                sesion.setAttribute("usuario", rs.getString(1));
                sesion.setAttribute("clave", rs.getString(2));
                sesion.setAttribute("delegacion", rs.getString(3));
                sesion.setAttribute("subdelegacion", rs.getString(4));
                sesion.setAttribute("permisos", rs.getString(5));
                sesion.setMaxInactiveInterval(1*24*60*60);
                }
            else{
                    sesion.setAttribute("Error", "Usuario o clave incorrecto");
                }
            }
        conx.close();
        ruta = "/SAMP/menu.jsp";
        }
        catch(SQLException e){
            sesion.setAttribute("log", e.getMessage());
            ruta = "/SAMP/error.jsp";
        }
        finally{
            response.sendRedirect(ruta);
        }
    }
    private void salir(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        sesion = request.getSession(false);
        sesion.removeAttribute("usuario");
        sesion.removeAttribute("clave");
        sesion.invalidate();
        response.sendRedirect("/SAMP/");
    }
    private void cambios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String regimen,d,s,clave;
        nss = request.getParameter("nss");
        sesion = request.getSession(false);
        regimen = request.getParameter("regimen");
        u = sesion.getAttribute("usuario").toString();
        d = sesion.getAttribute("delegacion").toString();
        s = sesion.getAttribute("subdelegacion").toString();
        try{conexion();}
        catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try{
        usu = new usuario();
        clave = usu.cifrado(u,s,d);
        String doc = getServletConfig().getServletContext().getRealPath ("/");
        sesion.setAttribute("ruta",clave+"-modif.pdf");
        FileOutputStream fos = new FileOutputStream(doc+"extras/"+clave+"-modif.pdf");
        PdfReader reader = new PdfReader(doc+"extras/vaciomodificaciones.pdf");
        PdfReader.unethicalreading = true;
        PdfStamper stamper = new PdfStamper(reader, fos);
        AcroFields form = stamper.getAcroFields();
        for(int i = 1; i <=12; ++i){
            rs = stm.executeQuery("call modificaciones('"+nss+"','"+regimen+"')");
            if(rs.next()){
                if(rs.getString(1) != null)
                    form.setField("text_"+Integer.toString(i),rs.getObject(i).toString());
            }
        }
        form.setField("text_"+Integer.toString(13),regimen);
        form.setField("text_"+Integer.toString(14),clave);
        Date now = new Date();
        DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
        form.setField("text_"+Integer.toString(15),df.format(now));
        stamper.close();
        reader.close();
        fos.close();
        date = new Date();
        DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        stm.executeQuery("call registro('"+u+"','Pensiones','"+hourdateFormat.format(date)+"')");
        conx.close();
        ruta = "/SAMP/exito.jsp";
        }
        catch (DocumentException | SQLException e){
            sesion.setAttribute("log", e.getMessage());
            sesion.setAttribute("Error", "NSS incorrecto o usuario inexistente");
            ruta = "/SAMP/error.jsp";
        }
        finally{
            response.sendRedirect(ruta);
        }
    }
    private void consultas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        u = sesion.getAttribute("usuario").toString();
        nss = request.getParameter("nss");
        sesion = request.getSession(false);
        try{conexion();}
        catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try{
        String doc = getServletConfig().getServletContext().getRealPath ("/");
        sesion.setAttribute("ruta", "consultas");
        FileOutputStream fos = new FileOutputStream(doc+"extras/consultas.pdf");
        PdfReader reader = new PdfReader(doc+"extras/vacioconsultas.pdf");
        PdfReader.unethicalreading = true;
        PdfStamper stamper = new PdfStamper(reader, fos);
        AcroFields form = stamper.getAcroFields();

        for(int i = 1; i <=10; ++i){
            rs = stm.executeQuery("call consultas('"+nss+"')");
            if(rs.next()){
                if(rs.getString(1) != null)
                    form.setField("text_"+Integer.toString(i),rs.getObject(i).toString());
            }
        }
        stamper.close();
        reader.close();
        fos.close();
        date = new Date();
        DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        stm.executeQuery("call registro('"+u+"','Pensiones','"+hourdateFormat.format(date)+"')");
        conx.close();
        ruta = "/SAMP/exito.jsp";
        }
        catch (DocumentException | SQLException e){
            sesion.setAttribute("log", e.getMessage());
            sesion.setAttribute("Error", "NSS incorrecto o usuario deshabilitado");
            ruta = "/SAMP/error.jsp";
        }
        finally{
            response.sendRedirect(ruta);
        }
    }
    private void bajas(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        u = sesion.getAttribute("usuario").toString();
        nss = request.getParameter("nss");
        sesion = request.getSession(false);
        try{conexion();}
        catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try{
            stm.executeQuery("call bajas('"+nss+"')");
            sesion.setAttribute("Archivo",null);
            ruta = "/SAMP/exito.jsp";
            date = new Date();
            DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            stm.executeQuery("call registro('"+u+"','Pensiones','"+hourdateFormat.format(date)+"')");
            conx.close();
        } catch (SQLException e) {
            sesion.setAttribute("Error", "Error desconocido en la aplicacion");
            sesion.setAttribute("log", e.getMessage());
            ruta = "/SAMP/error.jsp";
        }
        finally{
            response.sendRedirect(ruta);
        }
    }
    private void crear(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        String clave = request.getParameter("clave");
        sesion = request.getSession(false);
        usuario = request.getParameter("nuevo");
        delegacion = request.getParameter("delegacion");
        System.out.println(delegacion);
        subdelegacion = request.getParameter("subdelegacion");
        try{conexion();}
        catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try{
            stm.executeQuery("call crear('"+usuario+"','"+clave+"','"+delegacion+"','"+subdelegacion+"','7')");
            ruta = "/SAMP/permisos.jsp?permisos=7&usuario="+usuario+"";
        }
        catch(SQLException sqlex){
            sesion.setAttribute("log", sqlex.getMessage());
            sesion.setAttribute("Error", "Error desconocido con la aplicacion");
            ruta = "/SAMP/error.jsp";
        }
        finally{
            response.sendRedirect(ruta);
        }
    }
    private void usuarios(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        String user = request.getParameter("usuario");
        sesion = request.getSession(false);
        try{conexion();}
        catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try{
        rs = stm.executeQuery("call permisos1('"+user+"')");
        if(rs.next()){
            if(rs.getString(1) != null)
                ruta = "/SAMP/permisos.jsp?permisos="+rs.getString(1)+"&usuario="+rs.getString(2);
            else
                sesion.setAttribute("Error", "El usuario no existe");
            }
        conx.close();
        }
        catch(SQLException e){
            sesion.setAttribute("log", e.getMessage());
            ruta = "/SAMP/error.jsp";
        }
        finally{
            response.sendRedirect(ruta);
        }
    }
    private void permisos(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        u = sesion.getAttribute("usuario").toString();
        sesion = request.getSession(false);
        String [] permiso = request.getParameterValues("permiso");
        String per = "";
        String usu = request.getParameter("cosa");
        for(int i = 0; i < permiso.length; i++){
            per = per.concat(permiso[i]);
        }
        try{conexion();}
        catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try{
            rs = stm.executeQuery("call permisos2('"+usu+"','"+per+"')");
            if(usu.equals(sesion.getAttribute("usuario").toString()))
                sesion.setAttribute("permisos", per);
            ruta = "/SAMP/exito.jsp";
            date = new Date();
            DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            stm.executeQuery("call registro('"+u+"','Permisos','"+hourdateFormat.format(date)+"')");
            conx.close();
        }
        catch(SQLException e){
            sesion.setAttribute("Error", "Error desconocido en la aplicacion");
            sesion.setAttribute("log", e.getMessage());
            ruta = "/SAMP/error.jsp";
        }
        finally{
            response.sendRedirect(ruta);
        }
    }
    private void borrar(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        u = sesion.getAttribute("usuario").toString();
        sesion = request.getSession(false);
        String usu = request.getParameter("cosa2");
        try{conexion();}
        catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try{
            rs = stm.executeQuery("call eliminar('"+usu+"')");
            ruta = "/SAMP/exito.jsp";
            date = new Date();
            DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            stm.executeQuery("call registro('"+u+"','Permisos','"+hourdateFormat.format(date)+"')");
            conx.close();
        }
        catch(SQLException e){
            sesion.setAttribute("Error", "Error desconocido en la aplicacion");
            sesion.setAttribute("log", e.getMessage());
            ruta = "/SAMP/error.jsp";
        }
        finally{
            response.sendRedirect(ruta);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="Metodos">
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String m = request.getParameter("m");
        switch(m){
            case "inicio":
                inicio(request,response);
                break;
            case "salir":
                salir(request,response);
                break;
            case "cambios":
                cambios(request,response);
                break;
            case "consultas":
                consultas(request,response);
                break;
            case "bajas":
                bajas(request,response);
                break;
            case "extras":
                //extras(request,response);
                break;
            case "crear":
                crear(request,response);
                break;
            case "usuarios":
                usuarios(request,response);
                break;
            case "permisos":
                permisos(request,response);
                break;
            case "agregar":
                //agregar(request,response);
            case "borrar":
                borrar(request,response);
                break;
        }   
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}