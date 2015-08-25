

// from http://www.mediacollege.com/internet/javascript/number/round.html
function roundNumber(number,decimals) {
    var newString;// The new rounded number
    decimals = Number(decimals);
    if (decimals < 1) {
        newString = (Math.round(number)).toString();
    } else {
        var numString = number.toString();
        if (numString.lastIndexOf(".") == -1) {// If there is no decimal point
            numString += ".";// give it one at the end
        }
        var cutoff = numString.lastIndexOf(".") + decimals;// The point at which to truncate the number
        var d1 = Number(numString.substring(cutoff,cutoff+1));// The value of the last decimal place that we'll end up with
        var d2 = Number(numString.substring(cutoff+1,cutoff+2));// The next decimal, after the last one we want
        if (d2 >= 5) {// Do we need to round up at all? If not, the string will just be truncated
            if (d1 == 9 && cutoff > 0) {// If the last digit is 9, find a new cutoff point
                while (cutoff > 0 && (d1 == 9 || isNaN(d1))) {
                    if (d1 != ".") {
                        cutoff -= 1;
                        d1 = Number(numString.substring(cutoff,cutoff+1));
                    } else {
                        cutoff -= 1;
                    }
                }
            }
            d1 += 1;
        }
        if (d1 == 10) {
            numString = numString.substring(0, numString.lastIndexOf("."));
            var roundedNum = Number(numString) + 1;
            newString = roundedNum.toString() + '.';
        } else {
            newString = numString.substring(0,cutoff) + d1.toString();
        }
    }
    if (newString.lastIndexOf(".") == -1) {// Do this again, to the new string
        newString += ".";
    }
    var decs = (newString.substring(newString.lastIndexOf(".")+1)).length;
    for(var i=0;i<decimals-decs;i++) newString += "0";
    //var newNumber = Number(newString);// make it a number if you like
    return newString; // Output the result to the form field (change for your purposes)
}

function update_total() {
    var subtotal = 0;
    var iva = 0;
    var total = 0;
    $('.price').each(function(i){
        price = $(this).html().replace("$","");
        if (!isNaN(price)) total += Number(price);
    });

    subtotal = roundNumber((total-(total*0.19)),2);
    iva = roundNumber(total*0.19,2);
    total = roundNumber(total,2);
  


  
    //$('#subtotal').html("<input name='subtotal_fac_agr' readonly='readonly' type='text' value='"+subtotal+"'/>");
    $('#subtotal').html("$"+subtotal);
    $('#subtotal_fac_agr').val(subtotal);
    //$('#iva').html("<input name='iva_fac_agr' readonly='readonly' type='text' value='$"+iva+"'/>");//
    $('#iva').html("$"+iva);
    $('#iva_fac_agr').val(iva);
    $('#total').html("$"+total);
    $('#total_fac_agr').val("$"+total);    
  

  
    update_balance();
}

function update_balance() {
    var due = $("#total").html().replace("$","") - $("#paid").val().replace("$","");
    $('#deuda_fac_agr').val(due);

  
  
    due = roundNumber(due,2);
  
    $('.due').html("$"+due);
  

}

function update_price() {
    var row = $(this).parents('.item-row');
    var price = row.find('.cost').val().replace("$","") * row.find('.qty').val();
    price = roundNumber(price,2);
    isNaN(price) ? row.find('.price').html("N/A") : row.find('.price').html("$"+price);
    ///////////////////TODO ESTO MODIFICADO POR MI///////////////
    var costo = row.find('.cost').val().replace("$","");
    var cantidad = row.find('.qty').val().replace("$","");
    costo = roundNumber(costo,2);
    //alert("costo debe de salir"+costo);
    //alert("cantidad debe de salir"+cantidad);
    //alert(total_item);
    $('#costo_unitario'+total_item+'').val(costo);
    $('#item_cantidad'+total_item+'').val(cantidad);
  
    update_total();
}
/*
function agrega_ocultos() {
    var row = $(this).parents('.item-row');
    var costo_unitario = row.find('.cost').val().replace("$","");
    costo_unitario = row.find('.cost').val().replace("$","");
    alert(costo_unitario);

}*/

function bind() {
    $(".cost").blur(update_price);
    $(".qty").blur(update_price);
//$(".cost").blur(agrega_ocultos);
}


$(document).ready(function() {

    $('input').click(function(){
        $(this).select();
    });

    $("#paid").blur(update_balance);
   
    $("#addrow").click(function(){
        $('.fondo_negro_agregar').css("visibility", "visible");
        $('.contenedor_formulario_saliente_agregar').css("visibility", "visible");
    });


          
  
    bind();
  

    $('#customer-title').change(function() {
        var str = "";
        $("select option:selected").each(function () {

            /////PARA SABER EL NOMBRE DE LA CLASE Si es cliente escribimos otros Datos///



            str = $(this).attr('title');

                
            var separado = str.split("-");
            var id = $('#customer-title').attr('class'); //si quieres saver una Clase ('id')
            if (id == 'required cliente')
            {

                    
                var rut = "Rut Cliente:"+separado[0]+"\n";
                var nombre = "Nombre:"+separado[1]+"\n";
                var direccion = "Direccion:"+separado[2]+"\n";
                var tipo = separado[3];
                if (tipo =='N')
                {
                    tipo='Tipo:NORMAL'
                }
                else if (tipo =='C')
                {
                    tipo='Tipo:CRONICOS'
                }
                else if (tipo =='T')
                {
                    tipo='Tipo:TERCERA EDAD'
                }
                else if (tipo =='A')
                {
                    tipo='Tipo:ASOCIADOS'
                }
                else
                    {
                    tipo='Tipo:'
                    }
                $(address).val(rut+nombre+direccion+tipo);
            }
            else
            {
                //alert("Direccion Del Proveedor:"+separado[0]+"\n");
                var direccion = "Direccion Del Proveedor:"+separado[0]+"\n"
                //alert("Ciudad:"+separado[1]+"\n");
                var ciudad = "Ciudad:"+separado[1]+"\n"
                //alert("Fono:"+separado[2]+"\n");
                var fono = "Fono:"+separado[2]+"\n"
                //alert("Comentario:"+separado[3]+"\n");
                var comentario = "Comentario:"+separado[3]+"\n";
                if (separado[3] == null)
                {
                    comentario = "Comentario:";
                }
                //$(address).val(str);
                $(address).val(direccion+ciudad+fono+comentario);
            }

                
      

                
        });



    });

  
});