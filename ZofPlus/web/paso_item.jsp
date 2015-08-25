<%@ page import = "RN.RN_Item"%>
<%@ page import = "RN.RN_OrdenCompra"%>
<html>
<head>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/jquery.ui.draggable.js" type="text/javascript"></script>
        <script src="js/jquery.alerts.js" type="text/javascript"></script>
        <link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />

        <link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />
        <link rel="StyleSheet" type="text/css" href="estilo_maqueta_i.css"/>

<script type="text/javascript">
$(document).ready(function()
{
<%
//RESCATAMOS QUE TIPO DE OPERACION SE VA A HACER
            String operacion = request.getParameter("operacion");
            RN_Item item;
            String salida="";


            Integer total_item = Integer.parseInt(request.getParameter("total_item"));
////LLENADO DEL Precio Total de la Orden de Compra///
String ocIdtemp = request.getParameter("num_fac_agr");
String cantidadtotaloc = request.getParameter("total_fac_agr").replace("$", "");
double totalgralOc = Double.parseDouble(cantidadtotaloc);
RN_OrdenCompra ordendecompra = new RN_OrdenCompra(ocIdtemp,totalgralOc);
ordendecompra.AgregarTotalGeneralOrdenCompra();


            for (int j = 1; j <= total_item; j++) {
                //out.println(x);
                String item_fac_agr = request.getParameter("item_fac_agr" + j);

                if (item_fac_agr.equals("0")) {
                    ///out.println("BORRADOS SON"+item_fac_agr);
                    /////////NO HACE NADA ESTOS SON LOS QUE BORRO EL CLIENTE
                } else {

                    String prodCodigo = request.getParameter("item_fac_agr" + j);
                    //como String cantidad
                    String cantidad = request.getParameter("item_cantidad" + j);
                    //como double cantidad
                    double itmCantidad = Double.parseDouble(cantidad);
                    //como String cif unitario
                    //String cantidad = request.getParameter("item_cantidad" + j);
                    String cifuni = request.getParameter("costo_unitario" + j);
                    //como double cif unitario
                    double itmCifunivta = Double.parseDouble(cifuni);

                    double itmCiftotal;

                    itmCiftotal = (itmCifunivta*itmCantidad);

                    String ocId = request.getParameter("num_fac_agr");


                    item = new RN_Item(1, prodCodigo,itmCantidad,itmCifunivta,itmCiftotal,ocId);
                    
                    salida = item.AgregarItemCompra();
                    out.println(prodCodigo);
                    
                }
            }



out.println("jAlert('"+salida+"','Aviso');");
%>
});
setTimeout(function(){
url = "inicio.jsp";
$(location).attr('href',url);
},1000);
</script>
</head>
<body>
     <div id="indicadores">
            UF <script type="text/javascript">indicadorEOF(6);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
            Dolar Observado <script type="text/javascript">indicadorEOF(8);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
            Euro <script type="text/javascript">indicadorEOF(9);</script>
     </div>
<div id="contenedor">
</div><!-- cierre contenedor-->
        <div id="pie" style="margin-top:0px;">
            <a href="inicio.jsp">Inicio</a>&nbsp;&nbsp;&nbsp;&nbsp;  | &nbsp;&nbsp;&nbsp;&nbsp; Ayuda &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Servicios &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Empresas &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Contacto &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Fax
        </div>
</body>

