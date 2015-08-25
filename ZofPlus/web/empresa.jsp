
<%@page import = "RN.RN_Empresa" %>
<%@page import = "mapeo.Empresa" %>
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
                oTable =  $('#grillaempresa').dataTable( {
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers"
                } );

/////////////////////////////////PROCESO DE MARCADO Y TODO LO INTERNO PARA LA GRILLA/////////////////////////
        /* MARCA EN GRIS EN CASO QUE SE HICIERA CLICK*/
        $("#grillaempresa tbody").click(function(event) {
            $(oTable.fnSettings().aoData).each(function (){
                $(this.nTr).removeClass('row_selected');
            });
            $(event.target.parentNode).addClass('row_selected');
        });
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        $('#boton_agregar').click( function() {
        $("#agregar_empresa").validate();
        } );
        $('#boton_modificar').click( function() {
        $("#modificar_empresa").validate();
        var actualizar = fnGetModificar( oTable );
        } );

        $('#boton_eliminar').click( function() {
        $("#eliminar_empresa").validate();
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
                var modificar_emp_rut = aData[0];
                var modificar_emp_nfantasia = aData[1];
                var modificar_emp_rsocial = aData[2];
                var modificar_emp_gcomercial = aData[3];
                var modificar_emp_direccion = aData[4];
                var modificar_emp_ciudad = aData[5];
                var modificar_emp_fono = aData[6];
                var modificar_emp_replegal = aData[7];
                var modificar_emp_nomreplegal = aData[8];
                
                $('#modificar_emp_rut').val(modificar_emp_rut);
                $('#modificar_emp_rut').attr('readonly','readonly');
                $('#modificar_emp_nfantasia').val(modificar_emp_nfantasia);
                $('#modificar_emp_rsocial').val(modificar_emp_rsocial);
                $('#modificar_emp_gcomercial').val(modificar_emp_gcomercial);
                $('#modificar_emp_direccion').val(modificar_emp_direccion);
                $('#modificar_emp_ciudad').val(modificar_emp_ciudad);
                $('#modificar_emp_fono').val(modificar_emp_fono);
                $('#modificar_emp_replegal').val(modificar_emp_replegal);
                $('#modificar_emp_nomreplegal').val(modificar_emp_nomreplegal);
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
                var eliminar_emp_rut = aData[0];
                var eliminar_emp_nfantasia = aData[1];
                var eliminar_emp_rsocial = aData[2];
                var eliminar_emp_gcomercial = aData[3];
                var eliminar_emp_direccion = aData[4];
                var eliminar_emp_ciudad = aData[5];
                var eliminar_emp_fono = aData[6];
                var eliminar_emp_replegal = aData[7];
                var eliminar_emp_nomreplegal = aData[8];

                $('#eliminar_emp_rut').val(eliminar_emp_rut);
                $('#eliminar_emp_rut').attr('readonly','readonly');
                $('#eliminar_emp_nfantasia').val(eliminar_emp_nfantasia);
                $('#eliminar_emp_nfantasia').attr('readonly','readonly');
                $('#eliminar_emp_rsocial').val(eliminar_emp_rsocial);
                $('#eliminar_emp_rsocial').attr('readonly','readonly');
                $('#eliminar_emp_gcomercial').val(eliminar_emp_gcomercial);
                $('#eliminar_emp_gcomercial').attr('readonly','readonly');
                $('#eliminar_emp_direccion').val(eliminar_emp_direccion);
                $('#eliminar_emp_direccion').attr('readonly','readonly');
                $('#eliminar_emp_ciudad').val(eliminar_emp_ciudad);
                $('#eliminar_emp_ciudad').attr('readonly','readonly');
                $('#eliminar_emp_fono').val(eliminar_emp_fono);
                $('#eliminar_emp_fono').attr('readonly','readonly');
                $('#eliminar_emp_replegal').val(eliminar_emp_replegal);
                $('#eliminar_emp_replegal').attr('readonly','readonly');
                $('#eliminar_emp_nomreplegal').val(eliminar_emp_nomreplegal);
                $('#eliminar_emp_nomreplegal').attr('readonly','readonly');
                
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
        <div id=titulo style="margin:2% 2%;font:80px calibri;color:#e4e4e4;position:absolute;">Empresa</div>
        <div id=superior style="margin:10% 38%;font:17px calibri;color:white;position:absolute;">
            <ul>
                <a href="#agregar" name="modal">Agregar</a><img src='img/agregar.png'/>
                <a href="#modificar" name="modal" id="boton_modificar">Modificar</a><img src='img/editar.png'/>
                <a href="#eliminar" name="modal" id="boton_eliminar">Eliminar</a><img src='img/eliminar.png'/>
            </ul>
        </div>
        <div id="boxes" style="">
            <!-- Formulario Agregar -->
            <div id="agregar" class="window" style="position:absolute;background:url(img/hoja_papel.png);">
                <%@ include file='agregar_empresa.jsp' %>
            </div><!-- fin formulario -->

            <!-- Mask to cover the whole screen -->
            <div id="mask"></div>
        </div>
        <div id="boxes">
            <!-- Formulario Modificar -->
            <div id="modificar" class="window" style="position:absolute;background:url(img/hoja_papel.png);">
                <%@ include file='modificar_empresa.jsp' %>
            </div><!-- fin formulario -->

            <!-- Mask to cover the whole screen -->
            <div id="mask"></div>
        </div>
        <div id="boxes">
            <!-- Formulario Eliminar -->
            <div id="eliminar" class="window" style="position:absolute;background:url(img/hoja_papel.png);">
                <%@ include file='eliminar_empresa.jsp' %>
            </div><!-- fin formulario -->

            <!-- Mask to cover the whole screen -->
            <div id="mask"></div>
        </div>

        <div id="contenedor">
            <br/><br/><br/><br/><br/><br/><br/>
            <table class="display" id="grillaempresa" style="width:100%">
                <thead>
                    <tr>
                        <th>Rut Empresa</th>
                        <th>Nombre Fantasia</th>
                        <th>Razon Social</th>
                        <th>Giro Comercial</th>
                        <th>Direccion</th>
                        <th>Ciudad</th>
                        <th>fono</th>
                        <th>Representante Legal</th>
                        <th>Nombre Representante</th>

                    </tr>
                </thead>
                <tbody>
                    <%

                                RN_Empresa empresa= new RN_Empresa();
                                List li = empresa.ListarEmpresa();
                                Iterator it = li.iterator();
                                while (it.hasNext()) {
                                    Empresa e = (Empresa) it.next();
                                

                    %>
                    <tr>
                        <td><%=e.getEmpRut()%></td>
                        <td><%=e.getEmpNfantasia()%></td>
                        <td><%=e.getEmpRsocial()%></td>
                        <td><%=e.getEmpGcomercial()%></td>
                        <td><%=e.getEmpDireccion()%></td>
                        <td><%=e.getEmpCiudad()%></td>
                        <td><%=e.getEmpFono()%></td>
                        <td><%=e.getEmpReplegal()%></td>
                        <td><%=e.getEmpNomreplegal()%></td>
                    </tr>
                    <%}

                    %>
                </tbody>
            </table>
                 <br/><br/> <div style="margin-left:45%;font:20px calibri;color:#fff;"><a href="inicio.jsp"><b>Volver</b></a></div><br/><br/>
                 <div style="width:50%;font:16px calibri;color:#fff;margin-left:1%;"><fieldset><p>- <b>Modulo Empresa:</b> su funcionalidad es poder registrar las empresas pertenecientes o que interactuan con Zofri.<br/>- Se pueden realizar operaciones como agregar, eliminar y modificar.<br/>- Para Modificaciones y Eliminaciones seleccione la Empresa en la Grilla de Trabajo y luego presione la operacion que desee realizar.</p></fieldset></div>
        </div><!-- cierre contenedor-->
        <div id="pie" style="margin-top:0px;">
            <a href="inicio.jsp">Inicio</a>&nbsp;&nbsp;&nbsp;&nbsp;  | &nbsp;&nbsp;&nbsp;&nbsp; Ayuda &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Servicios &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Empresas &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Contacto &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Fax
        </div>
    </body>
</html>