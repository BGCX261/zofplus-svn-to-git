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
//RESCATAMOS QUE TIPO DE OPERACION SE VA A HACER
String operacion = request.getParameter("operacion");
RN_Persona cliente;
String salida;


//Tipo de Operacion
if (operacion.equals("agregar"))
    {
String perRut = request.getParameter("agregar_cli_rut");
String perNombre = request.getParameter("agregar_cli_nombre").toUpperCase();
String perApellido = request.getParameter("agregar_cli_apellido").toUpperCase();
String perDireccion = request.getParameter("agregar_cli_Direccion").toUpperCase();
String perFono = request.getParameter("agregar_cli_fono");
String perEmail = request.getParameter("agregar_cli_mail").toUpperCase();
String usuarioZonafr = request.getParameter("agregar_cli_usu");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
java.util.Date perFnacimiento = sdf.parse(request.getParameter("agregar_cli_fnac"));
java.util.Date utilDate = new java.util.Date();
java.sql.Date fechaactual = new java.sql.Date(utilDate.getTime());
cliente = new RN_Persona(perRut, perNombre, perApellido, perDireccion, perFono, perEmail, perFnacimiento, fechaactual, usuarioZonafr);
salida = cliente.AgregarCliente();
out.println("jAlert('"+salida+"','Aviso');");
}

if (operacion.equals("modificar"))
    {
String perRut = request.getParameter("modificar_cli_rut");
String perNombre = request.getParameter("modificar_cli_nombre");
String perApellido = request.getParameter("modificar_cli_apellido").toUpperCase();
String perDireccion = request.getParameter("modificar_cli_direccion").toUpperCase();
String perFono = request.getParameter("modificar_cli_fono");
String perEmail = request.getParameter("modificar_cli_mail").toUpperCase();
String usuarioZonafr = request.getParameter("modificar_cli_usu");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
java.util.Date perFnacimiento = sdf.parse(request.getParameter("modificar_cli_fnac"));
java.util.Date utilDate = new java.util.Date();
java.sql.Date fechaactual = new java.sql.Date(utilDate.getTime());
cliente = new RN_Persona(perRut, perNombre, perApellido, perDireccion, perFono, perEmail, perFnacimiento, fechaactual, usuarioZonafr);
salida = cliente.ModificarCliente();
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