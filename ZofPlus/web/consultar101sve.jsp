<%@page import = "java.util.List" %>
<%@page import = "java.util.Iterator" %>
<%@page import = "RN.RN_101" %>
<%@page import = "mapeo.Ext101" %>


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
            $(document).ready(function() { //////////////////////////////////////////////////////////////////////////////////////////////////////////////


                var oTable =  $('#grilla101ext').dataTable( {
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers"
                } );

                /////////////////////////////////PROCESO DE MARCADO Y TODO LO INTERNO PARA LA GRILLA/////////////////////////
                /* MARCA EN GRIS EN CASO QUE SE HICIERA CLICK*/
                $("#grilla101ext tbody").click(function(event) {
                    $(oTable.fnSettings().aoData).each(function (){
                        $(this.nTr).removeClass('row_selected');
                    });
                    $(event.target.parentNode).addClass('row_selected');
                });

                $('#visar101ext').click( function() {
                    var procesar101ext = fnGetActualizar( oTable );
                    $('#form101ext').submit();
                } );

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
                $('#101extid').val(oc_id);
            }
        }
        return aReturn;
    }


                    } );///Finalizacion del DocumentReady

                </script>
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
                    <li class="TabbedPanelsTab" tabindex="0">101 Extranjero</li>
                    <li class="TabbedPanelsTab" tabindex="0">101 Resto Del Pais</li>
                    <li class="TabbedPanelsTab" tabindex="0">101 Zona Franca de Extension</li>
                </ul>
                <div class="TabbedPanelsContentGroup">
                    <!-- pestaña 1-->
                    <div class="TabbedPanelsContent">
                        <center><font face="calibri">Listado de 101 Extranjero Existentes</font></center>
                        <br/><br/>
                        <a href="#" id ="visar101ext" name="visar101ext">Visar 101 EXT</a><img src='img/agregar.png'/>
                        <table class="display" id="grilla101ext" style="width:100%;">
                            <thead>
                                <tr>
                                    <th>ID 101</th>
                                    <th>ID OC</th>
                                    <th>Fecha Creacion</th>
                                    <th>FOB</th>
                                    <th>Flete</th>
                                    <th>Seguro</th>
                                    <th>CIF</th>
                                    <th>Num. Provisorio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                            RN_101 ext101 = new RN_101();
                                            List liext = ext101.ListarRechazados101EXT();
                                            Iterator itrext = liext.iterator();
                                            while (itrext.hasNext()) {
                                                Ext101 listado101ext = (Ext101) itrext.next();
                                %>
                                <tr>
                                    <td><%=listado101ext.getId101() %></td>
                                    <td><%=listado101ext.getOcId() %></td>
                                    <td><%=listado101ext.getFecha101()%></td>
                                    <td><%=listado101ext.getExtFob() %></td>
                                    <td><%=listado101ext.getExtFlete() %></td>
                                    <td><%=listado101ext.getExtSeguro() %></td>
                                    <td><%=listado101ext.getExtCif() %></td>
                                    <td><%=listado101ext.getNprovi101() %></td>
                                </tr>
                                <%
                                            }
                                %>
                            </tbody>

                        </table>

                    </div>
                    <!-- pestaña 2-->
                    <div class="TabbedPanelsContent">

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

        <form name="form101ext" id="form101ext" action="paso_visar101.jsp">
                    <input name="101extid" id="101extid" type="hidden" />
     </form>

    </body>
</html>