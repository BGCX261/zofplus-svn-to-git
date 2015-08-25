<%@ page import = "RN.RN_101"%>


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

String id101= request.getParameter("id_101");
String ocId= request.getParameter("oca101id");
String extPembarque= request.getParameter("puerto_embarque");
String extPaisproced = request.getParameter("pais_procedencia");
String extClausula = request.getParameter("clausula");
//String tipo_tramite = request.getParameter("tipo_tramite");
//String moneda = request.getParameter("moneda");
String extFobstring = request.getParameter("valor_fob");
String extFletestring = request.getParameter("valor_flete");
String extSegurostring = request.getParameter("valor_seguro");
String extCifstring = request.getParameter("cif_total");
String extTransnacional = request.getParameter("transbordo_nacional");
String extTransext = request.getParameter("transbordo_extranjero");
String extMediotranscod2 = request.getParameter("medio_transporte");


////Parseo a Double//
Double extFob = Double.valueOf(extFobstring);
Double extFlete = Double.valueOf(extFletestring);
Double extSeguro = Double.valueOf(extSegurostring);
Double extCif = Double.valueOf(extCifstring);


RN.RN_101 rn101ext = new RN.RN_101(id101, ocId, extPembarque, extPaisproced, extClausula, extFob, extFlete, extSeguro, extCif, extTransext, extTransnacional, extMediotranscod2);
String salida = rn101ext.Agregar101EXT();
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
