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
RN_Familia familia;
String salida;


//Tipo de Operacion
if (operacion.equals("agregar"))
        {
String famNombre = request.getParameter("agregar_fam_nombre").toUpperCase();
String famDescripcion = request.getParameter("agregar_fam_descripcion").toUpperCase();
familia = new RN_Familia(famNombre, famDescripcion);
salida = familia.AgregarFamilia();
out.println("jAlert('"+salida+"','Aviso');");
   }

//Tipo de Operacion
if (operacion.equals("modificar"))

    {
String famId = request.getParameter("modificar_fam_id");
String famNombre = request.getParameter("modificar_fam_nombre").toUpperCase();
String famDescripcion = request.getParameter("modificar_fam_descripcion").toUpperCase();
familia = new RN_Familia(famId, famNombre, famDescripcion);
salida = familia.ModificarFamilia();
out.println("jAlert('"+salida+"','Aviso');");

    }

//Tipo de Operacion
if (operacion.equals("eliminar"))

    {
String famId = request.getParameter("eliminar_fam_id");
String famNombre = request.getParameter("eliminar_fam_nombre").toUpperCase();
String famDescripcion = request.getParameter("eliminar_fam_descripcion").toUpperCase();
familia = new RN_Familia(famId, famNombre, famDescripcion);
salida = familia.DeshabilitarFamilia();
out.println("jAlert('"+salida+"','Aviso');");
    }




%>
});
setTimeout(function(){
url = "familia.jsp";
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