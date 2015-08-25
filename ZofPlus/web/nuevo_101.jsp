<%@page import = "RN.RN_101" %>
<%@page import = "mapeo.Cabecera101" %>
<%@page import = "RN.RN_OrdenCompra" %>
<%@page import = "mapeo.OrdenDeCompra" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.Iterator" %>

<%

            java.util.Date utilDate = new java.util.Date();
            java.sql.Date fechaactual = new java.sql.Date(utilDate.getTime());
%>





<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zofplus</title>

        <script src="js/SpryTabbedPanels.js" type="text/javascript"></script>
        <script type="text/javascript" src="JS/jquery126.js"></script>
        <script type="text/javascript" src="jquery-1.3.2.min.js"></script>
        <!-- 	Agregamos el plugin validate-->
        <!-- 	Agregamos el jquery-->
        <script type="text/javascript" language="JavaScript" src="js/jquery.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/jquery.dataTables.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/jquery.validate.js"></script>
        <!-- 	Agregamos que los mensajes sean en español-->
        <script type="text/javascript" language="JavaScript" src="js/messages_es.js"></script>
        <script type="text/javascript" src="http://indicador.eof.cl/js"></script>


        <link href="css/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
        <link href="css/demo_page.css" rel="stylesheet" type="text/css" />
        <link href="css/demo_table_jui.css" rel="stylesheet" type="text/css" />
        <link href="css/themes/smoothness/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />
        <link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />
        <link rel="StyleSheet" type="text/css" href="estilo_maqueta_i.css"></link>
        <link rel="StyleSheet" type="text/css" href="estilo_iconos.css"></link>
        <link href="css/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
        <link rel="StyleSheet" href="css/calendario.css" type="text/css"/>

        <script type="text/javascript">
            $(document).ready(function() {
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////
                          

                formu_adoTable =  $('#grilla101').dataTable( {
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers"
                } );

                oTable =  $('#oc').dataTable( {
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers"
                } );


                /////////////////////////////////PROCESO DE MARCADO Y TODO LO INTERNO PARA LA GRILLA/////////////////////////
                /* MARCA EN GRIS EN CASO QUE SE HICIERA CLICK*/
                $("#oc tbody").click(function(event) {
                    $(oTable.fnSettings().aoData).each(function (){
                        $(this.nTr).removeClass('row_selected');
                    });
                    $(event.target.parentNode).addClass('row_selected');
                });

                $('#101ext').click( function() {                    
                    var procesar101ext = fnGetActualizar( oTable );
                    $('#form101ext').submit();
                } );
                $('#101rdp').click( function() {
                    var procesar101rdp = fnGetActualizar( oTable );
                    $('#form101rdp').submit();
                } );
                $('#101ozf').click( function() {
                    var procesar101ozf = fnGetActualizar( oTable );
                    $('#form101ozf').submit();
                } );


            } );///Finalizacion del DocumentReady


function fnGetActualizar( oTableLocal )
    {
        var aReturn = new Array();
        var aTrs = oTableLocal.fnGetNodes();
        for ( var i=0 ; i<aTrs.length ; i++ )
        {
            if ( $(aTrs[i]).hasClass('row_selected') )
            {
                aReturn.push( aTrs[i] );
                /* Get the data array for this row */
                var aData = oTable.fnGetData(i);
                var oc_id = aData[0];                
                $('#oca101id').val(oc_id);
                $('#oca101idrdp').val(oc_id);
                $('#oca101idozf').val(oc_id);
            }
        }
        return aReturn;
    }


        </script>
    </head>

    <body>
        <div id="indicadores">
            UF <script type="text/javascript">indicadorEOF(6);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
            Dolar Observado <script type="text/javascript">indicadorEOF(8);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
            Euro <script type="text/javascript">indicadorEOF(9);</script>
        </div>
        <div id=titulo style="margin:70% 2%;font:80px calibri;color:#e4e4e4;position:absolute;">Módulo 101</div>
        <div id="contenedor">
            <div id="TabbedPanels1" class="TabbedPanels">
                <ul class="TabbedPanelsTabGroup">
                    <li class="TabbedPanelsTab" tabindex="0">Listado 101</li>
                    <li class="TabbedPanelsTab" tabindex="0">Nuevo 101</li>
                </ul>
                <div class="TabbedPanelsContentGroup">
                    <!-- pestaña 1-->
                    <div class="TabbedPanelsContent">
                        <center><font face="calibri">Listado de 101 Existentes</font></center>
                        <br/><br/>

                        <table class="display" id="grilla101" style="width:100%;">
                            <thead>
                                <tr>
                                    <th>ID 101</th>
                                    <th>ID OC</th>
                                    <th>Fecha de  Creacion</th>
                                    <th>Numero Provisorio</th>
                                    <th>Estado del Documento 101</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                            RN_101 n101 = new RN_101();
                                            List li = n101.Listar101();
                                            Iterator itr = li.iterator();
                                            while (itr.hasNext()) {
                                                Cabecera101 listado101 = (Cabecera101) itr.next();

                                %>
                                <tr>

                                    <td><div align="center"><%=listado101.getId101()%></div></td>
                                    <td><div align="center"><%=listado101.getOrdenDeCompra().getOcId()%></div></td>
                                    <td><div align="center"><%=listado101.getFecha101()%></div></td>
                                    <td><div align="center"><%=listado101.getNprovi101()%></div></td>
                                    <td><div align="center"><%=listado101.getEstado101()%></div></td>




                                </tr>
                                <%
                                            }
                                %>
                            </tbody>

                        </table>

                    </div>
                    <!-- pestaña 2-->
                    <div class="TabbedPanelsContent">
                        <center><font face="calibri">Listado Ordenes de Compra Existentes</font></center>

                        <a href="#" id ="101ext" name="101ext"><font style="font:13px calibri;">Generar 101 Extranjero</font></a><img src='img/101.png'/>
                        <a href="#" id="101rdp" name="101rdp"><font style="font:13px calibri;">Generar 101 Resto Del Pais</font></a><img src='img/101.png'/>
                        <a href="#" id="101ozf" name="101ozf"><font style="font:13px calibri;">Generar 101 Otra Zona Franca</font></a><img src='img/101.png'/>
                        <br/><br/>
                        <table class="display" id="oc" style="width:100%;">
                            <thead>
                                <tr>
                                    <th>ID OC</th>
                                    <th>Fecha de OC</th>
                                    <th>Glosa</th>
                                    <th>Codigo Moneda</th>
                                    <th>Codigo Pais Origen</th>
                                    <th>Estado</th>
                                    <th>Proveedor</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                            RN_OrdenCompra ordencompra = new RN_OrdenCompra();
                                            List li2 = ordencompra.ListarOrdenCompra();
                                            Iterator itr2 = li2.iterator();
                                            while (itr2.hasNext()) {
                                                OrdenDeCompra oc = (OrdenDeCompra) itr2.next();

                                %>
                                <tr>

                                    <td><%=oc.getOcId()%></td>
                                    <td><%=oc.getOcFecha()%></td>
                                    <td><%=oc.getOcGlosa()%></td>
                                    <td><%=oc.getOcMonedacod()%></td>
                                    <td><%=oc.getOcPorigencod()%></td>
                                    <td><div align="center"><%=oc.getOcEstado()%></div></td>
                                    <td><div align="center"><%=oc.getProveedor().getProvNombre()%></div></td>
                                </tr>
                                <%
                                            }
                                %>
                            </tbody>

                        </table>
                       </div>

                </div>
                                <br/><div style="margin-left:45%;font:20px calibri;color:#fff;"><a href="inicio.jsp"><b>Volver</b></a></div><br/><br/>
     
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

        <form id="form101ext" action="101ext.jsp">
                    <input name="oca101id" id="oca101id" type="hidden" />
                </form>

        <form id="form101rdp" action="101rdp.jsp">
                    <input name="oca101idrdp" id="oca101idrdp" type="hidden" />
         </form>


        <form id="form101ozf" action="101ozf.jsp">
                    <input name="oca101idozf" id="oca101idozf" type="hidden" />
         </form>
               

    </body>
</html>