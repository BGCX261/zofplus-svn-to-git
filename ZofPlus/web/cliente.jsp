<%@page import = "RN.RN_Persona" %>
<%@page import = "mapeo.Cliente" %>
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
        <script type="text/javascript" language="JavaScript" src="js/jquery.datePicker.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/date.js"></script>

        <link href="css/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
        <link href="css/demo_page.css" rel="stylesheet" type="text/css" />
        <link href="css/demo_table_jui.css" rel="stylesheet" type="text/css" />
        <link href="css/themes/smoothness/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />
        <link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />
        <link rel="StyleSheet" type="text/css" href="estilo_maqueta_i.css"></link>
        <link rel="StyleSheet" type="text/css" href="estilo_iconos.css"></link>
        <link href="css/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
        <link rel="StyleSheet" href="css/calendario.css" type="text/css"/>

<script type="text/javascript" charset="utf-8">
                    Date.firstDayOfWeek = 0;
                    Date.format = 'yyyy-mm-dd';

            $(function()
            {
			$('.date-pick').datePicker(
		{
			startDate: '1970-01-01',
			endDate: (new Date()).asString()
		}
	);
            });
		</script>



        <script type="text/javascript">
            $(document).ready(function() {
                oTable =  $('#grillacliente').dataTable( {
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers"
                } );

                /////////////////////////////////PROCESO DE MARCADO Y TODO LO INTERNO PARA LA GRILLA/////////////////////////
                /* MARCA EN GRIS EN CASO QUE SE HICIERA CLICK*/
                $("#grillacliente tbody").click(function(event) {
                    $(oTable.fnSettings().aoData).each(function (){
                        $(this.nTr).removeClass('row_selected');
                    });
                    $(event.target.parentNode).addClass('row_selected');
                });
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////
                $('#boton_agregar').click( function() {
                    $("#agregar_cliente").validate();
                } );
                $('#boton_modificar').click( function() {
                    $("#modificar_cliente").validate();
                    var actualizar = fnGetModificar( oTable );
                } );

                $('#boton_eliminar').click( function() {
                    $("#eliminar_cliente").validate();
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
                        var aData = oTable.fnGetData(i);
                        var modificar_cli_rut = aData[0];
                        var modificar_cli_nombre = aData[1];
                        var modificar_cli_apellido = aData[2];
                        var modificar_cli_direccion = aData[3];
                        var modificar_cli_fono = aData[4];
                        var modificar_cli_mail = aData[5];
                        var modificar_cli_fnac = aData[6];
                        var modificar_cli_usu = aData[7];


                        $('#modificar_cli_rut').val(modificar_cli_rut);
                        $('#modificar_cli_rut').attr('readonly','readonly');
                        $('#modificar_cli_nombre').val(modificar_cli_nombre);
                        $('#modificar_cli_apellido').val(modificar_cli_apellido);
                        $('#modificar_cli_direccion').val(modificar_cli_direccion);
                        $('#modificar_cli_fono').val(modificar_cli_fono);
                        $('#modificar_cli_mail').val(modificar_cli_mail);
                        $('#modificar_cli_fnac').val(modificar_cli_fnac);
                        $("#modificar_cli_usu option:contains("+modificar_cli_usu+")").attr("selected", true);


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
                        var eliminar_cli_rut = aData[0];
                        var eliminar_cli_nombre = aData[1];
                        var eliminar_cli_apellido = aData[2];
                        var eliminar_cli_direccion = aData[3];
                        var eliminar_cli_fono = aData[4];
                        var eliminar_cli_mail = aData[5];
                        var eliminar_cli_fnac = aData[6];
                        var eliminar_cli_usu = aData[7];

                        $('#eliminar_cli_rut').val(eliminar_cli_rut);
                        $('#eliminar_cli_rut').attr('readonly','readonly');
                        $('#eliminar_cli_nombre').val(eliminar_cli_nombre);
                        $('#eliminar_cli_nombre').attr('readonly','readonly');
                        $('#eliminar_cli_apellido').val(eliminar_cli_apellido);
                        $('#eliminar_cli_apellido').attr('readonly','readonly');
                        $('#eliminar_cli_direccion').val(eliminar_cli_direccion);
                        $('#eliminar_cli_direccion').attr('readonly','readonly');
                        $('#eliminar_cli_fono').val(eliminar_cli_fono);
                        $('#eliminar_cli_fono').attr('readonly','readonly');
                        $('#eliminar_cli_mail').val(eliminar_cli_mail);
                        $('#eliminar_cli_mail').attr('readonly','readonly');
                        $('#eliminar_cli_fnac').val(eliminar_cli_fnac);
                        $('#eliminar_cli_fnac').attr('readonly','readonly');
                        $("#eliminar_cli_usu option:contains("+eliminar_cli_usu+")").attr("selected", true);
                        $('#eliminar_cli_usu').attr('readonly','readonly');

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
                top:10%;
                width:440px;
                height:450px;
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
         <div id=titulo style="margin:2% 2%;font:80px calibri;color:#e4e4e4;position:absolute;">Cliente</div>
        <div id=superior style="margin:10% 38%;font:17px calibri;color:white;position:absolute;">
            <ul>
                <a href="#agregar" name="modal" id="boton_agregar">Agregar</a><img src='img/agregar.png'/>
                <a href="#modificar" name="modal" id="boton_modificar">Modificar</a><img src='img/editar.png'/>
                <a href="inicio.jsp" name="" id="volver"><-Volver</a><img src=''/>
            </ul>
        </div>
        <div id="boxes" style="">
            <!-- Formulario Agregar -->
            <div id="agregar" class="window" style="position:absolute;background:url(img/hoja_papel.png);">
                <%@ include file='agregar_cliente.jsp' %>
            </div><!-- fin formulario -->

            <!-- Mask to cover the whole screen -->
            <div id="mask"></div>
        </div>
        <div id="boxes">
            <!-- Formulario Modificar -->
            <div id="modificar" class="window" style="position:absolute;background:url(img/hoja_papel.png);">
                <%@ include file='modificar_cliente.jsp' %>
            </div><!-- fin formulario -->

            <!-- Mask to cover the whole screen -->
            <div id="mask"></div>
        </div>
        <div id="boxes">
            <!-- Formulario Modificar -->
            <div id="eliminar" class="window" style="position:absolute;background:url(img/hoja_papel.png);">
                <%@ include file='eliminar_cliente.jsp' %>
            </div><!-- fin formulario -->

            <!-- Mask to cover the whole screen -->
            <div id="mask"></div>
        </div>

        <div id="contenedor">
            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
            <table class="display" id="grillacliente" style="width:100%;">
                <thead>
                    <tr>
                        <th>Rut</th>                        
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Direccion</th>
                        <th>Fono</th>
                        <th>Email</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Usu ZF</th>
                    </tr>
                </thead>
                <tbody>
                    <%

                                RN_Persona cliente= new RN_Persona();
                                List li = cliente.ListarCliente();
                                Iterator it = li.iterator();
                                while (it.hasNext()) {
                                    Cliente cli = (Cliente) it.next();

                    %>
                    <tr>
                        <td><%=cli.getPersona().getPerRut() %></td>                        
                        <td><%=cli.getPersona().getPerNombre() %></td>
                        <td><%=cli.getPersona().getPerApellido() %></td>
                        <td><%=cli.getPersona().getPerDireccion() %></td>
                        <td><%=cli.getPersona().getPerFono() %></td>
                        <td><%=cli.getPersona().getPerEmail() %></td>
                        <td><%=cli.getPersona().getPerFnacimiento() %></td>
                        <%
                        String comparador = cli.getUsuarioZonafr();
                        String salida ="";

                        if (comparador.equals("S"))
                                {
                            salida="Si";
                            }
                        if (comparador.equals("N"))
                            {
                            salida="No";
                            }
                        %>


                        <td><%=salida %></td>
                    </tr>
                    <%}

                    %>

                </tbody>
            </table>
                      <br/><br/> <div style="margin-left:45%;font:20px calibri;color:#fff;"><a href="inicio.jsp"><b>Volver</b></a></div><br/><br/>
                 <div style="width:50%;font:16px calibri;color:#fff;margin-left:1%;"><fieldset><p>- <b>Modulo Cliente:</b> su funcionalidad es poder registrar Clientes asociados al Sistema Zofplus.<br/>- Se pueden realizar operaciones como agregar, eliminar y modificar.<br/>- Para Modificaciones y Eliminaciones seleccione Cliente en la Grilla de Trabajo y luego presione la operacion que desee realizar.</p></fieldset></div>
        </div><!-- cierre contenedor-->
        <div id="pie" style="margin-top:0px;">
            <a href="inicio.jsp">Inicio</a>&nbsp;&nbsp;&nbsp;&nbsp;  | &nbsp;&nbsp;&nbsp;&nbsp; Ayuda &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Servicios &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Empresas &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Contacto &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Fax
        </div>
    </body>
</html>
