<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.text.SimpleDateFormat" %>


<%@ page import = "RN.RN_Persona"%>
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

String salida="";
String operacion = request.getParameter("operacion");
if (operacion.equals("agregar"))
    {



String per_rut = request.getParameter("per_rut");
String per_nombre = request.getParameter("per_nombre");
String per_apellido = request.getParameter("per_apellido");
String per_direccion = request.getParameter("per_direccion");
String per_fono = request.getParameter("per_fono");
String per_email = request.getParameter("per_email");
String per_fnacimiento = request.getParameter("agregar_tra_fnac");
String area_trabajo = request.getParameter("area_trabajo");
String pass = request.getParameter("agregar_tra_pass1");
String strFecha = "2007-12-25";

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
java.util.Date perFnacimiento = sdf.parse(request.getParameter("agregar_tra_fnac"));
java.util.Date utilDate = new java.util.Date();
java.sql.Date fechaactual = new java.sql.Date(utilDate.getTime());

	java.util.Calendar cal = java.util.Calendar.getInstance(java.util.Locale.US);
	java.util.Date date = cal.getTime();
	java.text.DateFormat formateadorFecha = java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL);

	


RN_Persona trabajador;
trabajador = new RN_Persona(per_rut, per_nombre, per_apellido, per_direccion, per_fono, per_email, perFnacimiento, area_trabajo, pass);

salida = trabajador.AgregarTrabajador();
out.println("jAlert('"+salida+"','Aviso');");
}
%>
});
setTimeout(function(){
url = "cliente.jsp";
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