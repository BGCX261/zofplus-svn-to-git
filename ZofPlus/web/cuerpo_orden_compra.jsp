<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import = "RN.RN_OrdenCompra"%>

<%
            java.util.Date utilDate = new java.util.Date();
            java.sql.Date fechaactual = new java.sql.Date(utilDate.getTime());


            String ocId = request.getParameter("numero_oc").toUpperCase();
            String ocGlosa = request.getParameter("glosa_oc").toUpperCase();
            String ocInfadicional = request.getParameter("inf_oc").toUpperCase();
            String ocMonedacod = request.getParameter("moneda_oc").toUpperCase();
            String ocPorigencod = request.getParameter("pais_origen_oc").toUpperCase();
            String provRut = request.getParameter("agregar_emp_rut");
            RN_OrdenCompra ocompra;
            ocompra = new RN_OrdenCompra(ocId, fechaactual, ocGlosa, ocInfadicional, ocMonedacod, ocPorigencod, provRut);
            String salida = ocompra.AgregarCabeceraOrdenCompra();
%>




<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zofplus</title>

        <script src="js/SpryTabbedPanels.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.js"></script>        
        <!-- 	Agregamos el plugin validate-->
        <script type="text/javascript" language="JavaScript" src="js/jquery.validate.js"></script>
        <!-- 	Agregamos que los mensajes sean en español-->
        <script type="text/javascript" language="JavaScript" src="js/messages_es.js"></script>

        <script type='text/javascript' src='js/factura.js'></script>


        <link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />
        <link rel="stylesheet" type="text/css" media="screen" href="css/invoice.css"></link>
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
                    <li class="TabbedPanelsTab" tabindex="0">Orden de Compra:<%=ocId%> </li>
                    <li class="TabbedPanelsTab" tabindex="0">Agregar Item</li>
                    <li class="TabbedPanelsTab" tabindex="0">Editar Cabecera</li>
                </ul>
                <div class="TabbedPanelsContentGroup">
                    <!-- pestaña 1-->
                    <div class="TabbedPanelsContent">
                        <center><font face="calibri">Cabecera Orden de Compra</font></center>
                        <br/><br/>
                    </div>
                    <!-- pestaña 2-->
                    <div class="TabbedPanelsContent">
                        <center><font face="calibri">Agregar Item Orden de Compra</font></center>
                        <table id="items">
                  <tr>
		      <th>Item</th>
		      <th>Descripcion</th>
		      <th>Costo Unitario</th>
		      <th>Cantidad</th>
		      <th>Precio</th>
		  </tr>

            <tr class="item-row">
            </tr>
		  <tr id="hiderow">
		    <td colspan="5"><a id="addrow" href="javascript:;" title="Agregar Un Item">Agregar Item</a></td>
		  </tr>
                       
                    </table>
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