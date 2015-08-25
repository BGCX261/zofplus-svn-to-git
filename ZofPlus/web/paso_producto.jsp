<%@ page import = "RN.RN_Producto"%>
<%@ page import = "RN.RN_Familia"%>

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
RN_Producto producto;
String salida;


//Tipo de Operacion
if (operacion.equals("agregar"))
        {
        String prodCodigo = request.getParameter("agregar_prod_codigo");
        String famId = request.getParameter("agregar_fam_id");
        String proNombre = request.getParameter("agregar_pro_nombre").toUpperCase();
        String proDescripcion = request.getParameter("agregar_pro_descripcion").toUpperCase();

        String cifuni = request.getParameter("agregar_pro_cifuni");
        Long proCantidad = Long.valueOf(request.getParameter("agregar_pro_cantidad"));
       //como double cif unitario
        double proCifuni = Double.parseDouble(cifuni);


        producto = new RN_Producto(prodCodigo, famId, proNombre, proDescripcion, proCantidad, proCifuni);
        salida = producto.AgregarProducto();
        out.println("jAlert('"+salida+"','Aviso');");
   }

//Tipo de Operacion
if (operacion.equals("modificar"))
        {
        String prodCodigo = request.getParameter("modificar_prod_codigo");
        String famId = request.getParameter("modificar_fam_id");
        String proNombre = request.getParameter("modificar_pro_nombre").toUpperCase();
        String proDescripcion = request.getParameter("modificar_pro_descripcion").toUpperCase();

        String cifuni = request.getParameter("modificar_pro_cifuni");
        Long proCantidad = Long.valueOf(request.getParameter("modificar_pro_cantidad"));
       //como double cif unitario
        double proCifuni = Double.parseDouble(cifuni);

        producto = new RN_Producto(prodCodigo, famId, proNombre, proDescripcion, proCantidad, proCifuni);
        salida = producto.ModificarProducto();
        out.println("jAlert('"+salida+"','Aviso');");
   }

%>
});
setTimeout(function(){
url = "producto.jsp";
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