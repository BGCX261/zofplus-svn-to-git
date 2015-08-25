
   function esDigito(sChr){
    var sCod = sChr.charCodeAt(0);
    return ((sCod > 47) && (sCod < 58));
   }

   function valSep(oTxt){
    var bOk = false;
    bOk = bOk || ((oTxt.value.charAt(2) == "-") && (oTxt.value.charAt(5) == "-"));
    bOk = bOk || ((oTxt.value.charAt(2) == "/") && (oTxt.value.charAt(5) == "/"));
    return bOk;
   }

   function finMes(oTxt){
    var nMes = parseInt(oTxt.value.substr(3, 2), 10);
    var nAno = parseInt(oTxt.value.substr(6), 10);
    var nRes = 0;
    switch (nMes){
     case 1: nRes = 31; break;
     case 2: nRes = 28; break;
     case 3: nRes = 31; break;
     case 4: nRes = 30; break;
     case 5: nRes = 31; break;
     case 6: nRes = 30; break;
     case 7: nRes = 31; break;
     case 8: nRes = 31; break;
     case 9: nRes = 30; break;
     case 10: nRes = 31; break;
     case 11: nRes = 30; break;
     case 12: nRes = 31; break;
    }
    return nRes + (((nMes == 2) && (nAno % 4) == 0)? 1: 0);
   }

   function valDia(oTxt){
    var bOk = false;
    var nDia = parseInt(oTxt.value.substr(0, 2), 10);
    bOk = bOk || ((nDia >= 1) && (nDia <= finMes(oTxt)));
    return bOk;
   }

   function valMes(oTxt){
    var bOk = false;
    var nMes = parseInt(oTxt.value.substr(3, 2), 10);
    bOk = bOk || ((nMes >= 1) && (nMes <= 12));
    return bOk;
   }

   function valAno(oTxt){
    var bOk = true;
    var nAno = oTxt.value.substr(6);
    bOk = bOk && ((nAno.length == 2) || (nAno.length == 4));
    if (bOk){
     for (var i = 0; i < nAno.length; i++){
      bOk = bOk && esDigito(nAno.charAt(i));
     }
    }
    return bOk;
   }

   function valFecha(oTxt){
    var bOk = true;
    if (oTxt.value != ""){
     bOk = bOk && (valAno(oTxt));
     bOk = bOk && (valMes(oTxt));
     bOk = bOk && (valDia(oTxt));
     bOk = bOk && (valSep(oTxt));
     return bOk;
    }
   }

   function fechaMayorOIgualQue(fec0, fec1){
    var bRes = false;
    var sDia0 = fec0.value.substr(0, 2);
    var sMes0 = fec0.value.substr(3, 2);
    var sAno0 = fec0.value.substr(6, 4);
    var sDia1 = fec1.value.substr(0, 2);
    var sMes1 = fec1.value.substr(3, 2);
    var sAno1 = fec1.value.substr(6, 4);
    if (sAno0 > sAno1) bRes = true;
    else {
     if (sAno0 == sAno1){
      if (sMes0 > sMes1) bRes = true;
      else {
       if (sMes0 == sMes1)
        if (sDia0 >= sDia1) bRes = true;
      }
     }
    }
    return bRes;
   }

   function valFechas(){
    var bOk = false;
    if (valFecha(document.formu_ad.fec0)){
     if (valFecha(document.formu_ad.fec1)){
      if (fechaMayorOIgualQue(document.formu_ad.fec1, document.formu_ad.fec0)){
       bOk = true;
       alert("Ok");
      } else {
       alert("Rango inválido");
       document.formu_ad.fec1.focus();
      }
     } else {
      alert("Fecha inválida");
      document.formu_ad.fec1.focus();
     }
    } else {
     alert("Fecha inválida");
     document.formu_ad.fec0.focus();
    }
   }
