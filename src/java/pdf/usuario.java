package pdf;
import java.util.Calendar;
class usuario {
    protected static String cifrado(){
        String huella = "",hora = "0";
        Calendar fecha = Calendar.getInstance();
        if(fecha.get(Calendar.HOUR_OF_DAY) < 10)
            hora = hora.concat(Integer.toString(fecha.get(Calendar.HOUR_OF_DAY)));
        else
            hora = Integer.toString(fecha.get(Calendar.HOUR_OF_DAY));
        huella = huella.concat(hora);
        huella = huella.concat(Integer.toString(fecha.get(Calendar.MINUTE)));
        System.out.println(huella);
        return huella;
    }
    public static void main (String... x){
        cifrado();
    }
}