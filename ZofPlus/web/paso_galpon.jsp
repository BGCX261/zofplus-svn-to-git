<%@ page import = "RN.RN_Galpon"%>
<%@ page import = "RN.RN_Empresa"%>
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
RN_Galpon galpon;
String salida;


//Tipo de Operacion
if (operacion.equals("agregar"))
        {
Integer idGalpon = Integer.parseInt(request.getParameter("agregar_gal_id"));
String empRut = request.getParameter("agregar_emp_rut");
String recintoGalpon = request.getParameter("agregar_gal_recinto").toUpperCase();
String manzanaGalpon = request.getParameter("agregar_gal_manzana").toUpperCase();
String descripcionGalpon = request.getParameter("agregar_gal_descripcion").toUpperCase();
Integer fonoGalpon = Integer.parseInt(request.getParameter("agregar_gal_fono"));


galpon = new RN_Galpon(idGalpon, empRut, recintoGalpon, manzanaGalpon, descripcionGalpon, fonoGalpon);
salida = galpon.AgregarGalpon();
out.println("jAlert('"+salida+"','Aviso');");
   }
//Tipo de Operacion
if (operacion.equals("modificar"))
        {
Integer idGalpon = Integer.parseInt(request.getParameter("modificar_gal_id"));
String empRut = request.getParameter("modificar_emp_rut");
String recintoGalpon = request.getParameter("modificar_gal_recinto");
String manzanaGalpon = request.getParameter("modificar_gal_manzana");
String descripcionGalpon = request.getParameter("modificar_gal_descripcion");
Integer fonoGalpon = Integer.parseInt(request.getParameter("modificar_gal_fono"));
galpon = new RN_Galpon(idGalpon, empRut, recintoGalpon, manzanaGalpon, descripcionGalpon, fonoGalpon);
salida = galpon.ModificarGalpon();
out.println("jAlert('"+salida+"','Aviso');");
   }
//Tipo de Operacion
if (operacion.equals("eliminar"))
        {
Integer idGalpon = Integer.parseInt(request.getParameter("eliminar_gal_id"));
String empRut = request.getParameter("eliminar_emp_rut");
String recintoGalpon = request.getParameter("eliminar_gal_recinto");
String manzanaGalpon = request.getParameter("eliminar_gal_manzana");
String descripcionGalpon = request.getParameter("eliminar_gal_descripcion");
Integer fonoGalpon = Integer.parseInt(request.getParameter("eliminar_gal_fono"));
galpon = new RN_Galpon(idGalpon, empRut, recintoGalpon, manzanaGalpon, descripcionGalpon, fonoGalpon);
salida = galpon.DeshabilitarGalpon();
out.println("jAlert('"+salida+"','Aviso');");
   }


%>
});
setTimeout(function(){
url = "galpon.jsp";
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