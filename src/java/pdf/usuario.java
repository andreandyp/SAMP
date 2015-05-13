package pdf;
import java.util.Calendar;
public class usuario {
    protected String cifrado(String usu,String delegacion,String subdelegacion){
        String huella = "",hora = "0";
        Calendar fecha = Calendar.getInstance();
        if(fecha.get(Calendar.HOUR_OF_DAY) < 10)
            hora = hora.concat(Integer.toString(fecha.get(Calendar.HOUR_OF_DAY)));
        else
            hora = Integer.toString(fecha.get(Calendar.HOUR_OF_DAY));
        huella = huella.concat(hora);
        huella = huella.concat(Integer.toString(fecha.get(Calendar.MINUTE)));
        huella = huella.concat(Integer.toString(fecha.get(Calendar.MONTH) + 1));
        for(int i = 0; i <= usu.length() - 1; i++){
            switch(usu.charAt(i)){
                case 'A':
                    huella = huella.concat("4");
                    break;
                case 'B':
                    huella = huella.concat("8");
                    break;
                case 'C':
                    huella = huella.concat("(");
                    break;
                case 'E':
                    huella = huella.concat("3");
                    break;
                case 'G':
                    huella = huella.concat("6");
                    break;
                case 'I':
                    huella = huella.concat("!");
                    break;
                case 'J':
                    huella = huella.concat("]");
                    break;
                case 'L':
                    huella = huella.concat("[");
                    break;
                case 'Ñ':
                    huella = huella.concat("%");
                    break;
                case 'O':
                    huella = huella.concat("*");
                    break;
                case 'R':
                    huella = huella.concat("~");
                    break;
                case 'S':
                    huella = huella.concat("5");
                    break;
                case 'T':
                    huella = huella.concat("7");
                    break;
                case 'U':
                    huella = huella.concat("^");
                    break;
                case 'V':
                    huella = huella.concat("/");
                    break;
                case 'W':
                    huella = huella.concat("//");
                    break;
                case 'X':
                    huella = huella.concat("#");
                    break;
                case 'Y':
                    huella = huella.concat("&");
                    break;
                case 'Z':
                    huella = huella.concat("2");
                    break;
                case '.':
                    huella = huella.concat("°");
                    break;
                default:
                    huella = huella.concat(Character.toString(usu.charAt(i)));
                    break;
            }
        }
        huella = huella.concat(delegacion);
        huella = huella.concat(Integer.toString(fecha.get(Calendar.YEAR)));
        huella = huella.concat(subdelegacion);
        huella = huella.concat(Integer.toString(fecha.get(Calendar.DAY_OF_MONTH)));
        System.out.println(huella);
        return huella;
    }
}