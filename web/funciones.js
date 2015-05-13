function digito(){
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
        while(hue > 10){
            hue = hue.toString();
            hue = parseInt(hue.charAt(0)) + parseInt(hue.charAt(1));
        }
        nssn = hue;
        document.getElementById('digito').value = nssn;
    }
}
function validar(hue){
    if(hue === null || hue.length !== 10){
        alert("El NSS debe ser de 10 digitos");
        return false;
    }else
        return true;
}