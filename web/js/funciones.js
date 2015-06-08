function verificar(){
    var nssn = "",nt,valor,hue = 0;
    valor = document.getElementById('nss').value;
    if(valor.length === 10){
        for(var i = 1; i <= 10; i++){
            if(i%2 !== 0)
                nssn = nssn.concat(valor.charAt(i-1)*1);
            else{
                nt = valor.charAt(i-1)*2;
                if(nt > 9){
                    nt = nt.toString();
                    nt = parseInt(nt.charAt(0)) + parseInt(nt.charAt(1));
                }
                nssn = nssn.concat(nt);
            }
        }
        nssn = nssn.toString();
        for(var i = 1; i <= 10; i++){
            hue = hue + (parseInt(nssn.charAt(i-1)));
        }
        while(hue > 9){
            hue = hue.toString();
            hue = parseInt(hue.charAt(0)) + parseInt(hue.charAt(1));
        }
        nssn = hue;
        document.getElementById('digito').value = nssn;
    }
    else
        document.getElementById('digito').value = "";
}
function valida(){
    hue = document.getElementById('nss').value;
    jue = document.getElementById('m').value;
    if(hue.length !== 10 || jue === "nada"){
        alert("El NSS debe ser de 10 digitos y debes escoger un tramite");
        return false;
    }else
        return true;
}
function combo(){
    opcion = document.getElementById('m').value;
    if(opcion === "cambios")
        document.getElementById("regimen").style.display = "block";
    else
        document.getElementById("regimen").style.display = "none";
}
function usuarios(){
    hue = document.getElementById('usuario').value;
    if(hue.length === 0){
        alert("Inserta un usuario");
        return false;
    }else
        return true;
}
function numero(e){
    var keynum;
    if(window.event)
        keynum = e.keyCode;
    else
        keynum = e.which;
    if((keynum >= 48 && keynum <= 57))
        return true;
    else
        return false;
}
function nadas(){
    hue = document.getElementById('nuevo').value;
    jue = document.getElementById('clave').value;
    gue = document.getElementById('delegacion').value;
    ue = document.getElementById('subdelegacion').value;
    console.log(hue);
    if(hue.length === 0 || jue.length === 0 || gue.length === 0 || ue.length === 0){
        alert("Te falta por llenar algun campo");
        return false;
    }else
        return true;
}
//function repetir(){
//    clave1 = document.getElementById('nueva').value;
//    clave2 = document.getElementById('nueva2').value;
//    if(clave1 !== clave2){
//        document.getElementById('coinciden').value = "Las claves no coinciden";
//        document.getElementById('aceptar').value = "Asignar permisos";
//    }
//    else{
//        document.getElementById('coinciden').value = "Claves iguales";
//        document.getElementById('aceptar').value = "Asignar permisos y cambiar clave";
//    }
//}
function cambioclave(){
    vieja = clave2 = document.getElementById('vieja').value;
    igual = document.getElementById('coinciden').value;
    if(vieja.length === 0 && igual === "Las claves no coinciden"){
        alert('Inserta la clave antigua y haz que ambas claves nuevas coincidan');
        return false;
    }
    else
        return true;
}