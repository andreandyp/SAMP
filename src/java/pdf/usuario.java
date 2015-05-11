package pdf;
import java.util.Calendar;
import java.util.GregorianCalendar;
class usuario {
    protected static String cifrado(){
        String huella = "";
        Calendar fecha = new GregorianCalendar();
        huella = huella.concat(Integer.toString(fecha.get(Calendar.HOUR_OF_DAY)));
        huella = huella.concat(Integer.toString(fecha.get(Calendar.MINUTE)));
        System.out.println(huella);
        return huella;
    }
    public static void main (String... x){
        cifrado();
    }
}
