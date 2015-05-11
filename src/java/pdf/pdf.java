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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "pdf", urlPatterns = {"/pdf"})
public class pdf extends HttpServlet {
    Connection conx;
    Statement stm;
    ResultSet rs;
    String nss,ruta = "/SAMP/error.jsp";
    HttpSession sesion;
    private void altas(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        String nombrea = request.getParameter("nombrea");
        String nombres = request.getParameter("nombres");
        String curp = request.getParameter("curp");
        sesion = request.getSession(false);
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","IMSS","ClaveSecreta127");
        stm = conx.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try{
            stm.executeQuery("call altas('"+nombrea+"','"+nombres+"','"+curp+"')");
        }
        catch (SQLException e){
            sesion.setAttribute("Error", "Error desconocido en la aplicación");
            sesion.setAttribute("log", e.getMessage());
        }
        finally{
            ruta = "/SAMP/exito.jsp";
            response.sendRedirect(ruta);
        }
    }
    protected void cambios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String regimen;
        nss = request.getParameter("nssm");
        sesion = request.getSession(false);
        regimen = request.getParameter("regimen");
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","IMSS","ClaveSecreta127");
        stm = conx.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try{
        String doc = getServletConfig().getServletContext().getRealPath ("/");
        FileOutputStream fos = new FileOutputStream(doc+"modificaciones.pdf");
        PdfReader reader = new PdfReader(doc+"vaciomodificaciones.pdf");
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
        form.setField("text_"+Integer.toString(14),usuario.cifrado());
        Date now = new Date();
        DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
        form.setField("text_"+Integer.toString(15),df.format(now));
        stamper.close();
        reader.close();
        fos.close();
        conx.close();
        ruta = "/SAMP/exito.jsp";
        sesion.setAttribute("Archivo", "modificaciones.pdf");
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
    protected void consultas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        nss = request.getParameter("nssc");
        sesion = request.getSession(false);
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","IMSS","ClaveSecreta127");
        stm = conx.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("log", e.getMessage());
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
        }
        try{
        String doc = getServletConfig().getServletContext().getRealPath ("/");
        FileOutputStream fos = new FileOutputStream(doc+"consultas.pdf");
        PdfReader reader = new PdfReader(doc+"vacioconsultas.pdf");
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
        conx.close();
        ruta = "/SAMP/exito.jsp";
        sesion.setAttribute("Archivo", "consultas.pdf");
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
    protected void inicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        sesion = request.getSession(true);
        sesion.setMaxInactiveInterval(60*60*24);
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","IMSS","ClaveSecreta127");
        stm = conx.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try{
        rs = stm.executeQuery("call login('"+user+"','"+pass+"')");
        if(rs.next()){
            if(rs.getString(1) != null){
                sesion.setAttribute("usuario", rs.getString(1));
                sesion.setAttribute("clave", rs.getString(2));
                sesion.setMaxInactiveInterval(1*24*60*60);
                ruta = "/SAMP/menu.jsp";
                }
            else{
                    sesion.setAttribute("Error", "Usuario o clave incorrecto");
                }
            }
        }
        catch(SQLException e){
            sesion.setAttribute("log", e.getMessage());
        }
        finally{
            
            response.sendRedirect(ruta);
        }
    }
    private void salir(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        sesion = request.getSession(false);
        sesion.removeAttribute("usuario");
        sesion.removeAttribute("clave");
        sesion.invalidate();
        response.sendRedirect("/SAMP/");
    }
    private void bajas(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        nss = request.getParameter("nsse");
        sesion = request.getSession(false);
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","IMSS","ClaveSecreta127");
        stm = conx.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
            sesion.setAttribute("log", e.getMessage());
        }
        try {
            stm.executeQuery("call bajas('"+nss+"')");
            sesion.setAttribute("Archivo",null);
        } catch (SQLException e) {
            sesion.setAttribute("Error", "Error desconocido en la aplicacion");
            sesion.setAttribute("log", e.getMessage());
        }
        finally{
            ruta = "/SAMP/exito.jsp";
            response.sendRedirect(ruta);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="Metodos">
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String m = request.getParameter("m");
        switch(m){
            case "altas":
                altas(request,response);
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
            case "inicio":
                inicio(request,response);
                break;
            case "salir":
                salir(request,response);
                break;
        }   
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}