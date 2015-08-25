<%--
    Document   : menu
    Created on : 14-05-2011, 11:48:47 PM
    Author     : Tebi
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import = "RN.RN_OrdenCompra" %>
<%@page import = "RN.RN_NotaVenta" %>
<%@page import = "RN.RN_Producto" %>
<%@page import = "mapeo.Producto" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file='head.jsp' %>
<link rel="stylesheet" type="text/css" media="screen" href="css/invoice.css"></link>

<%
            java.util.Date utilDate = new java.util.Date();
            java.sql.Date fechaactual = new java.sql.Date(utilDate.getTime());

            String nvId = request.getParameter("numero_nv").toUpperCase();
            String nvGlosa = request.getParameter("glosa_nv").toUpperCase();
            String nvFormapago = request.getParameter("forma_pago").toUpperCase();
            String nvMonedacod = request.getParameter("moneda_nv").toUpperCase();
            String nvdestncod = request.getParameter("pais_destino_nv").toUpperCase();
            String cliRut = request.getParameter("agregar_cli_rut");
            RN_NotaVenta nventa;
            nventa = new RN_NotaVenta(nvId, fechaactual, nvGlosa, nvMonedacod, nvFormapago, nvdestncod, cliRut);
            String salida = nventa.AgregarCabeceraNotaVenta();
 %>


		<script type="text/javascript" charset="utf-8">
                    Date.firstDayOfWeek = 0;
                    Date.format = 'yyyy-mm-dd';

            $(function()
            {
			$('.date-pick').datePicker(
		{
			startDate: '1970-01-01',
			endDate: (new Date()).asString()
		}
	);
            });
		</script>
<script type='text/javascript' src='js/factura.js'></script>

<script type="text/javascript">

var total_item=0;

    $(document).ready(function() {



    $("#agregarfactura").validate(
{
rules: {
    costo_unitario: {
      min: 13
    }
}

}
);

oTable =  $('#grillaarticulo').dataTable( {
            "sScrollY": 300,
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "sDom": '<"barra">frtip'  //Si pongo esto se me va eso de mostrando 10 paginas de
        } );


        /////////////////////////////////PROCESO DE MARCADO Y TODO LO INTERNO PARA LA GRILLA/////////////////////////
        /* MARCA EN GRIS EN CASO QUE SE HICIERA CLICK*/
        $("#grillaarticulo tbody").click(function(event) {
            $(oTable.fnSettings().aoData).each(function (){
                $(this.nTr).removeClass('row_selected');
            });
            $(event.target.parentNode).addClass('row_selected');
        });
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////


$("div.barra").html("<a href='#' id='boton_agregar'><img src='img/agregar.png'/>Agregar Articulo Seleccionado</a> <a href='#' id='boton_cancelar'><img src='img/eliminar.png'/>Cancelar Proceso</a>")

        $('#boton_agregar').click( function() {
            var agregar = fnGetAgregar( oTable );
            if ($(".delete").length > 0) $(".delete").show();
            bind();
        } );
        $('#boton_cancelar').click( function() {
            $('.fondo_negro_agregar').css("visibility", "hidden");
            $('.contenedor_formulario_saliente_agregar').css("visibility", "hidden");
        } );


$('#cancelar_agregar').click( function() {
    setTimeout(function(){
url = "inicio.jsp";
$(location).attr('href',url);
},1000);

        } );



/////////////////////////////////PROCESO DE DE AGREGAR AL HIDDEN Y AGREGAR AL ITEM/////////////////////////

    function fnGetAgregar( oTableLocal )
    {
        var aReturn = new Array();
        var aTrs = oTableLocal.fnGetNodes();
        for ( var i=0 ; i<aTrs.length ; i++ )
        {
            if ( $(aTrs[i]).hasClass('row_selected') )
            {
                aReturn.push( aTrs[i] );
                /* Get the data array for this row */
                var aData = oTable.fnGetData(i);
                var item = aData[0];
                var descripcion = aData[1];
                var cif_uni = aData[2];
                total_item++;

                $(".item-row:last").after('<tr class="item-row"><td class="item-name"><div class="delete-wpr"><input type="text" value="'+item+'" readonly="readonly"/><a class="delete"  href="javascript:;" title="Remover Fila con Item'+item+'" alt="'+item+'">X</a></div></td><td class="description"><textarea readonly="readonly">'+descripcion+'</textarea></td><td><textarea  class="cost required" id="costo_unitario" min="'+cif_uni+'">'+cif_uni+'0</textarea></td><td><textarea class="qty required" min="1">0</textarea></td><td><span class="price">$0</span></td></tr>');
                $('.fondo_negro_agregar').css("visibility", "hidden");
                $('.contenedor_formulario_saliente_agregar').css("visibility", "hidden");

                //PROCESO DE LLENADO DE LAS COSAS OCULTAS
                $('#total_item').val(total_item);
                $('#item_fac_agr'+total_item+'').val(item);

            }

        }
        return aReturn;
    }

 $(".delete").live('click',function(){
     var comparador = $(this).attr('alt');
     alert(comparador);


    for (i=1;i<=total_item;i++)
        {
            var valor = $('#item_fac_agr'+i+'').val();
            if (comparador == valor)
                {
                $('#item_fac_agr'+i+'').val('0');
                }

        }
    $(this).parents('.item-row').remove();
    update_total();
    if ($(".delete").length < 2) $(".delete").hide();
  });


    } );///Finalizacion del DocumentReady

</script>
<body>

<div id="indicadores">
        UF <script type="text/javascript">indicadorEOF(6);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
        Dolar Observado <script type="text/javascript">indicadorEOF(8);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
        Euro <script type="text/javascript">indicadorEOF(9);</script>
</div>
<div id="contenedor_oc">
<br/><br/>
    <fieldset style="width:802px;margin-left:20%;background:#fff;border:2px dashed #000;">
         <b><legend>Generando nueva Nota de Venta</legend></b>
    <form action="paso_item_nv.jsp" id="agregarfactura">

    <!-- ID Proveedor oculto -->
    <input name="provRut" id="provRut" type="hidden"  maxlength="10" value="<%=cliRut %>"/>


    <div id="page-wrap">
        <textarea id="header" readonly="readonly">Nota de Venta n°<%=nvId%></textarea>
            <div id="identity">
                <textarea id="address">
                    RUT Del Cliente:<%=cliRut%>
                    
                </textarea>
                <div id="logo">
                        <img id="image" src="img/logo_zofplus.png" alt="logo" />
                </div>
             </div>
                    <div style="clear:both"></div>
                    <div id="customer">
                            <table id="meta">
                                <tr>
                                    <td class="meta-head">Numero NV</td>
                                    <td><input name="num_fac_agr" id="num_fac_agr"  maxlength="10" value="<%=nvId %>" readonly="readonly" autocomplete="off"/></td>
                                </tr>
                                <tr>
                                    <td class="meta-head" >Fecha</td>
                                    <td><input name="fecha_fac_agr" id="fecha_fac_agr"  maxlength="10" readonly="readonly" value="<%=fechaactual %>"  class="required dateISO date-pick" autocomplete="off"/></td>
                                </tr>
                                <tr>
                                    <td class="meta-head">Monto A Pagar</td>
                                    <td><div class="due">$0.00</div></td>
                                </tr>

                            </table>
                        </div>
                        <table id="items">
                                <tr>
                                      <th>Item</th>
                                      <th>Descripcion</th>
                                      <th>C.I.F. Venta</th>
                                      <th>Cantidad</th>
                                      <th>CIF Total</th>
                                </tr>
                                <tr class="item-row"></tr>
                                <tr id="hiderow">
                                    <td colspan="5"><a id="addrow" style="font:15px calibri;" href="javascript:;" title="Agregar Item">Agregar Item a la Nota de Venta</a></td>
                                </tr>
                                <!--        TODO LO OCULTO QUE MUEVE EL JAVASCRIPT  -->
                                <input type="hidden" name="subtotal_fac_agr" id="subtotal_fac_agr" value="0"/>
                                <input type="hidden" name="iva_fac_agr" id="iva_fac_agr" value="0"/>
                                <input type="hidden" name="total_fac_agr" id="total_fac_agr" value="0"/>
                                <input type="hidden" name="deuda_fac_agr" id="deuda_fac_agr" value="0"/>


                                <input type="hidden" name="total_item" id="total_item" value="0"/>

                                <%
                                for (int i=1; i<=100;i++)
                                    {
                                out.println("<input type=hidden name='item_fac_agr"+i+"' id='item_fac_agr"+i+"'>");
                                out.println("<input type=hidden name='costo_unitario"+i+"' id='costo_unitario"+i+"'>");
                                out.println("<input type=hidden name='item_cantidad"+i+"' id='item_cantidad"+i+"'>");
                                    }
                                %>
                              <!--<tr>
                                  <td colspan="2" class="blank"> </td>
                                  <td colspan="2" class="total-line">Total</td>
                                  <td class="total-value"><div id="subtotal">$0.00</div></td>
                              </tr>-->
                              <tr>
                                  <td colspan="2" class="blank"> </td>
                                  <td colspan="2" class="total-line">Total</td>
                                  <td class="total-value"><div id="total">$0.00</div></td>
                              </tr>
                              <tr>
                                  <td colspan="2" class="blank"> </td>
                                  <td colspan="2" class="total-line">Cantidad Pagada</td>

                                  <td class="total-value"><input id="paid" type="text" name="cantidadpagada_fac_agr" value="$0.00" /></td>
                              </tr>
                              <tr>
                                  <td colspan="2" class="blank"> </td>
                                    <td colspan="2">
                                    </td>
                                    <td><label>
                                       <input type="submit" name="Aceptar" id="Aceptar" value="Confirmar" class="form_boton" />
                                       <input type="button" name="cancelar_agregar" id="cancelar_agregar" value="Cancelar" class="form_boton"/>
                                    </label>
                                    </td>
                              </tr>
                          </table>
                    </div>
              </form>
                <div class="fondo_negro_agregar" style="visibility:hidden"></div>
                <div class="contenedor_formulario_saliente_agregar" style="visibility:hidden">
                    <table class="display" id="grillaarticulo" style="width:100%;">
                    <thead>
                        <tr>
                            <th width="100">Codigo</th>
                            <th width="100">Nombre Producto</th>
                            <th width="100">Precio Producto</th>
                        </tr>
                    </thead>
                    <tbody>
<%
                                RN_Producto producto= new RN_Producto();
                                List li = producto.ListarProducto();
                                Iterator it = li.iterator();
                                while (it.hasNext()) {
                                    Producto p = (Producto) it.next();
                                    %>


                    
                                    <tr>
                        <td><%=p.getProdCodigo() %></td>
                        <td><%=p.getProNombre() %></td>
                        <td><%=p.getProCifuni() %></td>
                                    </tr>
<%}

                    %>
                    </tbody>
                </table>
        </div>
</fieldset>
</div>
<div id="pie_oc">
     <a href="inicio.jsp">Inicio</a> &nbsp;&nbsp;&nbsp;&nbsp;  | &nbsp;&nbsp;&nbsp;&nbsp; Ayuda &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Servicios &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Empresas &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Contacto &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Fax
</div>
</body>