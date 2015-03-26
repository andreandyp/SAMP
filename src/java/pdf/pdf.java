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
@WebServlet(name = "pdf", urlPatterns = {"/pdf"})
public class pdf extends HttpServlet {
    Connection conx;
    Statement stm;
    ResultSet rs;
    String nss;
    protected void cambios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AcroFields form = null;
        PdfReader reader = null;
        PdfStamper stamper = null;
        nss = request.getParameter("nssm");
        String regimen = request.getParameter("regimen");
        String ruta = "http://localhost:8084/SAMP/impcamb.html";
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","root","Andy94");
        stm = conx.createStatement();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("hue");
        }
        try{
        for(int i = 1; i <=12; ++i){
            rs = stm.executeQuery("call modificaciones('"+nss+"')");
            if(rs.next()){
                if(rs.getString(1) != null){
                    String doc = getServletConfig().getServletContext().getRealPath ("/");
                    reader = new PdfReader(doc+"\\vaciomodificaciones.pdf");
                    stamper = new PdfStamper(reader, new FileOutputStream(doc+"\\modificaciones.pdf"));
                    form = stamper.getAcroFields();
                    form.setField("text_"+Integer.toString(i),rs.getString(i));
                }
                else
                    ruta = "http://localhost:8084/SAMP/error.html";
            }
        }
                    form.setField("text_"+Integer.toString(13),regimen);
                    form.setField("text_"+Integer.toString(14),"124802M4~!4°M464N4617201500317");
                    Date now = new Date();
                    DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
                    form.setField("text_"+Integer.toString(15),df.format(now));
        stamper.close();
        reader.close();
        conx.close();
        response.sendRedirect(ruta);
        }
        catch (DocumentException | SQLException e){
            System.out.println(e.getMessage());
        }
    }
    protected void consultas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nss = request.getParameter("nssc");
        int i = 1;
        String ruta = "http://localhost:8080/SAMP/impcons.html";
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conx = DriverManager.getConnection("jdbc:mysql://localhost/samp","root","n0m3l0");
        stm = conx.createStatement();
        rs = stm.executeQuery("call consultas('"+nss+"')");
        if(rs.next()){
            if(rs.getString(1) == null)
                ruta = "http://localhost:8080/SAMP/error.html";  
        }
        conx.close();
        response.sendRedirect(ruta);
        }
        catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
    }
    protected void inicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String ruta = "http://localhost:8080/SAMP/menu.html";
        if(!user.equals("IMSS") && !pass.equals("556")){
            ruta = "http://localhost:8080/SAMP/index.html";
        }
        response.sendRedirect(ruta);
    }
    // <editor-fold defaultstate="collapsed" desc="Metodos">
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String m = request.getParameter("m");
        switch(m){
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
        }   
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}