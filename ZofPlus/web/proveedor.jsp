
<%@page import = "RN.RN_Proveedor" %>
<%@page import = "mapeo.Proveedor" %>
<%@page import = "java.util.HashMap" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.Iterator" %>
<%@page import = "java.util.Map" %>
<%@page import = "java.util.Collection" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Sistema Administrativo Zofplus</title>

        <!-- 	Agregamos el jquery-->
        <script type="text/javascript" language="JavaScript" src="js/jquery.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/jquery.dataTables.js"></script>
        <!-- 	Agregamos el plugin validate-->
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
                oTable =  $('#grillaproveedor').dataTable( {
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers"
                } );

                /////////////////////////////////PROCESO DE MARCADO Y TODO LO INTERNO PARA LA GRILLA/////////////////////////
                /* MARCA EN GRIS EN CASO QUE SE HICIERA CLICK*/
                $("#grillaproveedor tbody").click(function(event) {
                    $(oTable.fnSettings().aoData).each(function (){
                        $(this.nTr).removeClass('row_selected');
                    });
                    $(event.target.parentNode).addClass('row_selected');
                });
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////
                $('#boton_agregar').click( function() {
                    $("#agregar_proveedor").validate();
                } );
                $('#boton_modificar').click( function() {
                    $("#modificar_proveedor").validate();
                    var actualizar = fnGetModificar( oTable );
                } );

                $('#boton_eliminar').click( function() {
                    $("#eliminar_proveedor").validate();
                    var eliminar = fnGetEliminar( oTable );
                } );
            } );///Finalizacion del DocumentReady


            /////////////////////////////////PROCESO DE PONER EN LOS VALUE AL ACTUALIZAR/////////////////////////

            function fnGetModificar( oTableLocal )
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
                        var modificar_prov_rut = aData[0];
                        var modificar_prov_nombre = aData[1];
                        var modificar_prov_direccion = aData[2];
                        var modificar_prov_ciudad = aData[3];
                        var modificar_prov_email = aData[4];

                        $('#modificar_prov_rut').val(modificar_prov_rut);
                        $('#modificar_prov_rut').attr('readonly','readonly');
                        $('#modificar_prov_nombre').val(modificar_prov_nombre);
                        $('#modificar_prov_direccion').val(modificar_prov_direccion);
                        $('#modificar_prov_ciudad').val(modificar_prov_ciudad);
                        $('#modificar_prov_email').val(modificar_prov_email);
                    }
                }
                return aReturn;
            }

            ////////////////////////////////PROCESO DE PONER EN LOS VALUE AL ELIMINAR/////////////////////////

            function fnGetEliminar( oTableLocal )
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
                        var eliminar_prov_rut = aData[0];
                        var eliminar_prov_nombre = aData[1];
                        var eliminar_prov_direccion = aData[2];
                        var eliminar_prov_ciudad = aData[3];
                        var eliminar_prov_email = aData[4];

                        $('#eliminar_prov_rut').val(eliminar_prov_rut);
                        $('#eliminar_prov_rut').attr('readonly','readonly');
                        $('#eliminar_prov_nombre').val(eliminar_prov_nombre);
                        $('#eliminar_prov_nombre').attr('readonly','readonly');
                        $('#eliminar_prov_direccion').val(eliminar_prov_direccion);
                        $('#eliminar_prov_direccion').attr('readonly','readonly');
                        $('#eliminar_prov_ciudad').val(eliminar_prov_ciudad);
                        $('#eliminar_prov_ciudad').attr('readonly','readonly');
                        $('#eliminar_prov_email').val(eliminar_prov_email);
                        $('#eliminar_prov_email').attr('readonly','readonly');
                    }
                }
                return aReturn;
            }




        </script>

        <script type="text/javascript">

            $(document).ready(function() {

                //select all the a tag with name equal to modal
                $('a[name=modal]').click(function(e) {
                    //Cancel the link behavior
                    e.preventDefault();

                    //Get the A tag
                    var id = $(this).attr('href');

                    //Get the screen height and width
                    var maskHeight = $(document).height();
                    var maskWidth = $(window).width();

                    //Set heigth and width to mask to fill up the whole screen
                    $('#mask').css({'width':maskWidth,'height':maskHeight});

                    //transition effect
                    $('#mask').fadeIn(1000);
                    $('#mask').fadeTo("slow",0.8);

                    //Get the window height and width
                    var winH = $(window).height();
                    var winW = $(window).width();

                    //Set the popup window to center
                    $(id).css('top',  winH/2-$(id).height()/2);
                    $(id).css('left', winW/2-$(id).width()/2);

                    //transition effect
                    $(id).fadeIn(2000);

                });

                //if close button is clicked
                $('.window .close').click(function (e) {
                    //Cancel the link behavior
                    e.preventDefault();

                    $('#mask').hide();
                    $('.window').hide();
                });

                //if mask is clicked
                $('#mask').click(function () {
                    $(this).hide();
                    $('.window').hide();
                });

                $(window).resize(function () {

                    var box = $('#boxes .window');

                    //Get the screen height and width
                    var maskHeight = $(document).height();
                    var maskWidth = $(window).width();

                    //Set height and width to mask to fill up the whole screen
                    $('#mask').css({'width':maskWidth,'height':maskHeight});

                    //Get the window height and width
                    var winH = $(window).height();
                    var winW = $(window).width();

                    //Set the popup window to center
                    box.css('top',  winH/2 - box.height()/2);
                    box.css('left', winW/2 - box.width()/2);

                });

            });

        </script>

        <style>
            body {
                font-family:verdana;
                font-size:15px;
            }

            a {color:#333; text-decoration:none}
            a:hover {color:#ccc; text-decoration:none}

            #mask {
                position:absolute;
                left:0;
                top:0;
                z-index:9000;
                background-color:#000;
                display:none;
            }

            #boxes .window {
                position:fixed;
                left:0;
                top:5%;
                width:440px;
                height:500px;
                display:none;
                z-index:9999;
                padding:0px;
            }

            #boxes #dialog {
                width:375px;
                height:203px;
                padding:10px;
                background-color:#ffffff;
            }

            #dialog1 .d-header {
                background:url(img/login-header.png) no-repeat 0 0 transparent;
                width:375px;
                height:150px;
            }

            #dialog1 .d-header input {
                position:relative;
                top:60px;
                left:100px;
                border:3px solid #cccccc;
                height:22px;
                width:200px;
                font-size:15px;
                padding:5px;
                margin-top:4px;
            }

            #dialog1 .d-blank {
                float:left;
                background:url(img/login-blank.png) no-repeat 0 0 transparent;
                width:267px;
                height:53px;
            }

            #dialog1 .d-login {
                float:left;
                width:108px;
                height:53px;
            }

            #boxes #dialog1 #dialog2 #dialog3 #agregar #modificar #eliminar {
                background:url(img/notice.png) no-repeat 0 0 transparent;
                width:500px;
                height:450px;
            }
        </style>

    </head>

    <body>
        <div id="indicadores">
            UF <script type="text/javascript">indicadorEOF(6);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
            Dolar Observado <script type="text/javascript">indicadorEOF(8);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
            Euro <script type="text/javascript">indicadorEOF(9);</script>
        </div>
        <div id=titulo style="margin:2% 2%;font:80px calibri;color:#e4e4e4;position:absolute;">Proveedor</div>
        <div id=superior style="margin:10% 38%;font:17px calibri;color:white;position:absolute;">
            <ul>
                <a href="#agregar" name="modal" id="boton_agregar">Agregar</a><img src='img/agregar.png'/>
                <a href="#modificar" name="modal" id="boton_modificar">Modificar</a><img src='img/editar.png'/>
                <a href="#eliminar" name="modal" id="boton_eliminar">Eliminar</a><img src='img/eliminar.png'/>

            </ul>
        </div>
        <div id="boxes" style="">
            <!-- Formulario Agregar -->
            <div id="agregar" class="window" style="position:absolute;background:url(img/hoja_papel.png);">
                <%@ include file='agregar_proveedor.jsp' %>
            </div><!-- fin formulario -->

            <!-- Mask to cover the whole screen -->
            <div id="mask"></div>
        </div>
        <div id="boxes">
            <!-- Formulario Modificar -->
            <div id="modificar" class="window" style="position:absolute;background:url(img/hoja_papel.png);">
                <%@ include file='modificar_proveedor.jsp' %>
            </div><!-- fin formulario -->

            <!-- Mask to cover the whole screen -->
            <div id="mask"></div>
        </div>
        <div id="boxes">
            <!-- Formulario Modificar -->
            <div id="eliminar" class="window" style="position:absolute;background:url(img/hoja_papel.png);">
                <%@ include file='eliminar_proveedor.jsp' %>
            </div><!-- fin formulario -->

            <!-- Mask to cover the whole screen -->
            <div id="mask"></div>
        </div>

        <div id="contenedor">
            <br/><br/><br/><br/><br/><br/><br/>
            <table class="display" id="grillaproveedor" style="width:100%;">
                <thead>
                    <tr>
                        <th>Rut Proveedor</th>
                        <th>Nombre</th>
                        <th>Direccion</th>
                        <th>Ciudad</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <%

                               RN_Proveedor proveedor= new RN_Proveedor();
                                List li = proveedor.ListarProveedor();
                                Iterator itr = li.iterator();
                                while (itr.hasNext()) {
                                    Proveedor p = (Proveedor) itr.next();

                    %>
                    <tr>
                        <td><%=p.getProvRut()%></td>
                        <td><%=p.getProvNombre()%></td>
                        <td><%=p.getProvDireccion()%></td>
                        <td><%=p.getProvCiudad()%></td>
                        <td><%=p.getProvEmail()%></td>
                    </tr>
                    <%}

                    %>

                </tbody>

            </table>
                        <br/><br/> <div style="margin-left:45%;font:20px calibri;color:#fff;"><a href="inicio.jsp"><b>Volver</b></a></div><br/><br/>
                 <div style="width:50%;font:16px calibri;color:#fff;margin-left:1%;"><fieldset><p>- <b>Modulo Familia:</b> su funcionalidad es poder registrar los Proveedores que interactuen con el sistema.<br/>- Se pueden realizar operaciones como agregar, eliminar y modificar.<br/>- Para Modificaciones y Eliminaciones seleccione Proveedor en la Grilla de Trabajo y luego presione la operacion que desee realizar.</p></fieldset></div>

        </div><!-- cierre contenedor-->

        <div id="pie" style="margin-top:0px;">
            <a href="inicio.jsp">Inicio</a>&nbsp;&nbsp;&nbsp;&nbsp;  | &nbsp;&nbsp;&nbsp;&nbsp; Ayuda &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Servicios &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Empresas &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Contacto &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Fax
        </div>
    </body>
</html>
