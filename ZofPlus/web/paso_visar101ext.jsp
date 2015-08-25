<%@ page import = "RN.ControladorSVE"%>


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



ControladorSVE controladorsve = new ControladorSVE(); //creo el objeto de tipo familia
String id101ext = request.getParameter("101extid");


String salida = controladorsve.Visar101EXT(id101ext);

Long numeroprovisorio= controladorsve.ObtenerNumeroProvisorio101EXT();


out.println("jAlert('"+salida+" Su numero provisorio es "+numeroprovisorio+"','Aviso');");
%>

});
setTimeout(function(){
url = "inicio.jsp";
$(location).attr('href',url);
},7000);
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
