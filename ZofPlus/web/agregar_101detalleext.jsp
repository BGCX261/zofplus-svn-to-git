<html>
<head>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>

<script type="text/javascript" charset="utf-8">
$(function(){
	$('#menu li a').click(function(event){
		var elem = $(this).next();
		if(elem.is('ul')){
			event.preventDefault();
			$('#menu ul:visible').not(elem).slideUp();
			elem.slideToggle();
		}
	});
});
</script>
<script type="text/javascript">
function lookup(inputString)
{
	if(inputString.length == 0)
	{
		$('#suggestions').hide();
	}
	else
	{
		$.post("bus_prod_bd.jsp", {queryString: ""+inputString+""}, function(data)
		{
			if(data.length >0)
			{
				$('#suggestions').show();
				$('#autoSuggestionsList').html(data);
				//alert("hace click en un LI");

				$("#autoSuggestionsList li").click(function()
				{
					var valor = $(this).text();
					//alert("el valor seleccionado es: "+valor);
                                        $('#inputString').val(valor); //aqui va el valor ke va al input
					$('#suggestions').hide();

					//alert("valor seleccionado, se ha escondido la lista");
				});
			}
		});
	}
}
</script>

<script type="text/javascript">
var cargando = "<img src='IMAGENES/loading_red.gif'style='float:center;'>";
$(document).ready(function()
{
        $('#btn').click(function()
        {
        var prod_codigo = $('input[name=prod_codigo]').val();

	$.ajax({
		async:true,
                url:"alum_buscar_BD.jsp",
                beforeSend:function(){ /*alert("apellido_p: "+apellido_p);*/ $('#resp_buscar').html(cargando);},
		data:({prod_codigo:prod_codigo}), //lo que le envio
		success:function(datos){ $('#resp_buscar').html(datos);}, // en resp_buscar copia todo el contenido de la respuesta
                error:function(xhr, ajaxOptions, thrownError){$('#resp_buscar').html(xhr.responseText);}
		});

        });
});
</script>
<style type="text/css">
body {
font-family: Calibri;
font-size: 11px;
color: #000;
}
h3 {
margin: 0px;
padding: 0px;
}
.suggestionsBox {
float:left;
position: relative;
left: 130px;
margin: 0px 0px 0px 0px;
width: 120px;
background-color: #aa3b46;
border: 1px solid gray;
color: #fff;
}
.suggestionList {
margin: 0px;
padding: 0px;
}
.suggestionList li {
margin: 0px 0px 0px 0px;
padding: 3px;
}
.suggestionList li:hover {
background-color: #91000f;
}
</style>

<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

</head>
<body>

<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">&lt;Correlativo 101&gt;</li>
    <li class="TabbedPanelsTab" tabindex="0">Agregar Item</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">
      <table width="61%" height="410" border="1" cellpadding="1" cellspacing="1">
        <tr>
          <td width="14%" height="29"><strong>Correlativo</strong></td>
          <td width="2%"><strong>:</strong></td>
          <td colspan="2"><label></label></td>
          <td width="12%">&nbsp;</td>
          <td colspan="2"><strong>Fecha</strong></td>
          <td width="8%">:</td>
          <td width="4%">&nbsp;</td>
          <td width="11%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><strong>Numero Provisorio</strong></td>
          <td><strong>:</strong></td>
          <td colspan="2"><label></label></td>
          <td>&nbsp;</td>
          <td colspan="2"><strong>Puerto de embarque</strong></td>
          <td>:</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><strong>:</strong></td>
          <td colspan="2"><label></label></td>
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><strong>Pais procedencia</strong></td>
          <td><strong>:</strong></td>
          <td colspan="2"><label></label></td>
          <td>&nbsp;</td>
          <td colspan="2"><strong>Clausula</strong></td>
          <td>:</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="2"><label></label></td>
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><strong>F.O.B.</strong></td>
          <td colspan="2"><label></label></td>
          <td width="2%">&nbsp;</td>
          <td><strong> FLETE:</strong></td>
          <td width="15%">&nbsp;</td>
          <td width="11%">&nbsp;</td>
          <td><strong>CIF</strong></td>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="2"><label></label></td>
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><strong>SEGURO</strong></td>
          <td>&nbsp;</td>
          <td colspan="2"><label></label></td>
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="2"><label></label></td>
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><strong>Transbordo</strong></td>
          <td>&nbsp;</td>
          <td colspan="2"><label></label></td>
          <td>&nbsp;</td>
          <td colspan="2"><strong>Codigo Medio de Transporte</strong></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <table width="100%" border="1" cellspacing="1" cellpadding="1">
        <tr>
          <td><table width="100%" border="1" cellspacing="1" cellpadding="1">
              <tr>
                <td width="15%"><div align="center"><strong>Cantidad</strong></div></td>
                <td width="21%"><div align="center"><strong>Codigo de Producto</strong></div></td>
                <td width="31%"><div align="center"><strong>Descripción</strong></div></td>
                <td width="33%"><div align="center"><strong>Precio Unitario</strong></div></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <p></p>
      <p>&nbsp;</p>
    </div>
    <div class="TabbedPanelsContent">
      <p>&nbsp;</p>
      <form id="form1" name="form1" method="post" action="">
        <table width="100%" border="1" cellspacing="1" cellpadding="1"><tr><td><table width="100%" border="1" cellspacing="1" cellpadding="1">
          <tr>
            <td width="15%"><strong>Cantidad</strong></td>
            <td width="21%"><strong>Codigo de Producto</strong></td>
            <td width="31%"><strong>Descripción</strong></td>
            <td width="33%"><strong>Precio Unitario</strong></td>
            </tr>
          <tr>
            <td><input type="text" name="itm_cantidad" id="itm_cantidad" /></td>
            <td><label>
              <!-- <input type="text" name="prod_codigo" id="prod_codigo" /> -->
              <input type="text" name="prod_codigo" size="15" id="inputString" autocomplete="off" onKeyUp="lookup(this.value);" onBlur="fill();"/><img src="IMAGENES/help.png" alt="Ayuda" onMouseOver="muestraAyuda(event, 'prod_codigo')">
                <div class="suggestionsBox" id="suggestions" style="display: none;">
                <div class="suggestionList" id="autoSuggestionsList"></div>
                </div>
              <div id="resp_buscar"></div>
                </label></td>
            <td><label>&lt;Consultar detalle del producto&gt;</label></td>
            <td><label>
              <input type="text" name="item_cifunivta" id="item_cifunivta" />
            </label></td>
            </tr>
        </table></td>
            </tr>
        </table>
        <p>
          <label>
          <input type="submit" name="Enviar" id="Enviar" value="[Guardar Item 101 EXT]" />
          </label>
        </p>
      </form>
      <p>
        <label></label>
      </p>
    </div>
  </div>
</div>
<script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
</script>

</body>
</html>
