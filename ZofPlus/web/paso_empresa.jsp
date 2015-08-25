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
RN_Empresa empresa;
String salida;


//Metodo AgregarEmpresa
if (operacion.equals("agregar"))
        {
    String empRut = request.getParameter("agregar_emp_rut");
    String empNfantasia = request.getParameter("agregar_emp_nfantasia").toUpperCase();
    String empRsocial = request.getParameter("agregar_emp_rsocial").toUpperCase();
    String empGcomercial = request.getParameter("agregar_emp_gcomercial").toUpperCase();
    String empDireccion = request.getParameter("agregar_emp_direccion").toUpperCase();
    String empCiudad = request.getParameter("agregar_emp_ciudad").toUpperCase();
    String empFono = request.getParameter("agregar_emp_fono").toUpperCase();
    String empReplegal = request.getParameter("agregar_emp_replegal");
    String empNomreplegal = request.getParameter("agregar_emp_nomreplegal").toUpperCase();

    empresa = new RN_Empresa(empRut, empNfantasia, empRsocial, empGcomercial, empDireccion, empCiudad, empFono, empReplegal, empNomreplegal);
    salida = empresa.AgregarEmpresa();
    out.println("jAlert('"+salida+"','Aviso');");
    }

//Metodo ModificarEmpresa
if (operacion.equals("modificar"))
    {
    String empRut = request.getParameter("modificar_emp_rut");
    String empNfantasia = request.getParameter("modificar_emp_nfantasia").toUpperCase();
    String empRsocial = request.getParameter("modificar_emp_rsocial").toUpperCase();
    String empGcomercial = request.getParameter("modificar_emp_gcomercial").toUpperCase();
    String empDireccion = request.getParameter("modificar_emp_direccion").toUpperCase();
    String empCiudad = request.getParameter("modificar_emp_ciudad").toUpperCase();
    String empFono = request.getParameter("modificar_emp_fono");
    String empReplegal = request.getParameter("modificar_emp_replegal");
    String empNomreplegal = request.getParameter("modificar_emp_nomreplegal").toUpperCase();
    empresa = new RN_Empresa(empRut, empNfantasia, empRsocial, empGcomercial, empDireccion, empCiudad, empFono, empReplegal, empNomreplegal);
    salida = empresa.ModificarEmpresa();
    out.println("jAlert('"+salida+"','Aviso');");
    }

//Metodo EliminarEmpresa
if (operacion.equals("eliminar"))
    {
    String empRut = request.getParameter("eliminar_emp_rut");
    String empNfantasia = request.getParameter("eliminar_emp_nfantasia").toUpperCase();
    String empRsocial = request.getParameter("eliminar_emp_rsocial").toUpperCase();
    String empGcomercial = request.getParameter("eliminar_emp_gcomercial").toUpperCase();
    String empDireccion = request.getParameter("eliminar_emp_direccion").toUpperCase();
    String empCiudad = request.getParameter("eliminar_emp_ciudad");
    String empFono = request.getParameter("eliminar_emp_fono");
    String empReplegal = request.getParameter("eliminar_emp_replegal");
    String empNomreplegal = request.getParameter("eliminar_emp_nomreplegal");

    empresa = new RN_Empresa(empRut, empNfantasia, empRsocial, empGcomercial, empDireccion, empCiudad, empFono, empReplegal, empNomreplegal);
    salida = empresa.DeshabilitarEmpresa();
    out.println("jAlert('"+salida+"','Aviso');");
    }

%>
});
setTimeout(function(){
url = "empresa.jsp";
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
