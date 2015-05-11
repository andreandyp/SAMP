function digito(valor){
    var nssn = "",nt;
    if(valor.length === 10){
        for(var i = 1; i <= valor.length; i++){
            if(i%2 !== 0)
                nssn = nssn.concat(valor.charAt(i)*1+",");
            else{
                nt = valor.charAt(i)*2;
                if(nt > 9){
                    nt = nt.toString();
                    nt = parseInt(nt.charAt(0)) + parseInt(nt.charAt(1));
                }
                nssn = nssn.concat(nt+",");
            }
        }
        nssn = nssn.substring(0,nssn.lastIndexOf(','));
        document.getElementById('digito').value = nssn;
    }
}//1,5,9