<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Zofplus</title>

<script src="js/SpryTabbedPanels.js" type="text/javascript"></script>
<script type="text/javascript" src="JS/jquery126.js"></script>
<script type="text/javascript" src="jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="http://indicador.eof.cl/js"></script>

<link rel="StyleSheet" type="text/css" href="estilo_maqueta_i.css"></link>
<link rel="StyleSheet" type="text/css" href="estilo_iconos.css"></link>
<link href="css/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div id="indicadores">
    UF <script type="text/javascript">indicadorEOF(6);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
    Dolar Observado <script type="text/javascript">indicadorEOF(8);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
    Euro <script type="text/javascript">indicadorEOF(9);</script>
</div>
<div id="contenedor">
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">Cabecera</li>
    <li class="TabbedPanelsTab" tabindex="0">Agregar Item</li>
    <li class="TabbedPanelsTab" tabindex="0">Editar Cabecera</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <!-- pestaña 1-->
      <div class="TabbedPanelsContent">
          <center><font face="calibri">Cabecera Nota de Venta</font></center>
          <br/><br/>
      </div>
    <!-- pestaña 2-->
      <div class="TabbedPanelsContent">
          <center><font face="calibri">Agregar Item Nota de Venta</font></center>
          <br/><br/>
      </div>
    <!-- pestaña 3-->
      <div class="TabbedPanelsContent">
          <center><font face="calibri">Editar Cabecera</font></center>
          <br/><br/>
      </div>


  </div>
</div>
    <div id="pie">
             <a href="inicio.jsp">Inicio</a>&nbsp;&nbsp;&nbsp;&nbsp;  | &nbsp;&nbsp;&nbsp;&nbsp; Ayuda &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Servicios &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Empresas &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Contacto &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Fax
    </div>
</div><!-- cierre contenedor-->
<script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
</script>
</body>
</html>