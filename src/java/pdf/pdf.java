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
    String nss,ruta = "http://localhost:8080/SAMP/error.jsp";
    HttpSession sesion;
    private void altas(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        String nombrea = request.getParameter("nombrea");
        String nombres = request.getParameter("nombres");
        String curp = request.getParameter("curp");
        sesion = request.getSession(false);
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","root","Andy94");
        stm = conx.createStatement();
        } catch (ClassNotFoundException | SQLException ex) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
        }
        try{
            stm.executeQuery("call altas('"+nombrea+"','"+nombres+"','"+curp+"')");
        }
        catch (SQLException e){
            sesion.setAttribute("Error", "Error desconocido en la aplicación");
        }
        finally{
            ruta = "http://localhost:8080/SAMP/exito.jsp";
            response.sendRedirect(ruta);
        }
    }
    protected void cambios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        nss = request.getParameter("nssm");
        sesion = request.getSession(false);
        String regimen = request.getParameter("regimen");
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","root","Andy94");
        stm = conx.createStatement();
        } catch (ClassNotFoundException | SQLException ex) {
            sesion.setAttribute("Error", "Error con la conexion a la base de datos");
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
                if(rs.getString(1) != null){
                    form.setField("text_"+Integer.toString(i),rs.getString(i));
                }
                else{
                    sesion.setAttribute("Error", "NSS incorrecto");
                }
            }
        }
        form.setField("text_"+Integer.toString(13),regimen);
        form.setField("text_"+Integer.toString(14),"124802M4~!4°M464N4617201500317");
        Date now = new Date();
        DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
        form.setField("text_"+Integer.toString(15),df.format(now));
        stamper.close();
        reader.close();
        fos.close();
        conx.close();
        ruta = "http://localhost:8080/SAMP/exito.jsp";
        }
        catch (DocumentException | SQLException e){
            sesion.setAttribute("Error", "Error desconocido en la aplicación");
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
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","root","Andy94");
        stm = conx.createStatement();
        } catch (ClassNotFoundException | SQLException ex) {
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
                if(rs.getString(1) != null){
                    form.setField("text_"+Integer.toString(i),rs.getString(i));
                }
                else{
                    sesion.setAttribute("Error", "NSS incorrecto");
                }
            }
        }
        stamper.close();
        reader.close();
        fos.close();
        conx.close();
        ruta = "http://localhost:8080/SAMP/exito.jsp";
        }
        catch (DocumentException | SQLException e){
            sesion.setAttribute("Error", "Error desconocido en la aplicación");
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
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","root","Andy94");
        stm = conx.createStatement();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.getMessage());
        }
        try{
        rs = stm.executeQuery("call login('"+user+"','"+pass+"')");
        if(rs.next()){
            if(rs.getString(1) != null){
                sesion.setAttribute("usuario", rs.getString(1));
                sesion.setAttribute("clave", rs.getString(2));
                ruta = "http://localhost:8080/SAMP/menu.jsp";
                }
            else{
                    sesion.setAttribute("Error", "Usuario o clave incorrecto");
                }
            }
        }
        catch(SQLException sqle){
            System.out.println(sqle.getMessage());
        }
        finally{
            response.sendRedirect(ruta);
        }
    }
    private void salir(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        sesion = request.getSession(false);
        sesion.invalidate();
        response.sendRedirect("http://localhost:8080/SAMP/index.html");
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