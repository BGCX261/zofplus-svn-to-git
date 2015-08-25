<%@ page import = "RN.RN_Proveedor"%>
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
RN_Proveedor proveedor;
String salida;


//Tipo de Operacion
if (operacion.equals("agregar"))
        {
        String provRut = request.getParameter("agregar_prov_rut");
        String provNombre = request.getParameter("agregar_prov_nombre").toUpperCase();
        String provDireccion = request.getParameter("agregar_prov_direccion").toUpperCase();
        String provCiudad = request.getParameter("agregar_prov_ciudad").toUpperCase();
        String provEmail = request.getParameter("agregar_prov_email").toUpperCase();

        proveedor = new RN_Proveedor(provRut, provNombre, provDireccion, provCiudad, provEmail);
        salida = proveedor.AgregarProveedor();
        out.println("jAlert('"+salida+"','Aviso');");
   }

//Tipo de Operacion
if (operacion.equals("modificar"))

    {
        String provRut = request.getParameter("modificar_prov_rut").toUpperCase();
        String provNombre = request.getParameter("modificar_prov_nombre").toUpperCase();
        String provDireccion = request.getParameter("modificar_prov_direccion").toUpperCase();
        String provCiudad = request.getParameter("modificar_prov_ciudad").toUpperCase();
        String provEmail = request.getParameter("modificar_prov_email").toUpperCase();

        proveedor = new RN_Proveedor(provRut, provNombre, provDireccion, provCiudad, provEmail);
        salida = proveedor.ModificarProveedor();
        out.println("jAlert('"+salida+"','Aviso');");

    }

//Tipo de Operacion
if (operacion.equals("eliminar"))
    {
        String provRut = request.getParameter("eliminar_prov_rut");
        String provNombre = request.getParameter("eliminar_prov_nombre").toUpperCase();
        String provDireccion = request.getParameter("eliminar_prov_direccion").toUpperCase();
        String provCiudad = request.getParameter("eliminar_prov_ciudad").toUpperCase();
        String provEmail = request.getParameter("eliminar_prov_email").toUpperCase();

        proveedor = new RN_Proveedor(provRut, provNombre, provDireccion, provCiudad, provEmail);
        salida = proveedor.DeshabilitarProveedor();
        out.println("jAlert('"+salida+"','Aviso');");
    }
%>
});
setTimeout(function(){
url = "proveedor.jsp";
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