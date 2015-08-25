<%@page import = "RN.RN_OrdenCompra" %>
<%@page import = "RN.RN_Galpon" %>
<%@page import = "RN.RN_DocumentoAdjunto" %>
<%@page import = "RN.RN_Item" %>
<%@page import = "RN.RN_101" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.Iterator" %>
<%@page import = "mapeo.Item" %>
<%@page import = "mapeo.Cabecera101" %>
<%@page import = "mapeo.OrdenDeCompra" %>
<%@page import = "mapeo.Galpon" %>


<%

            java.util.Date utilDate = new java.util.Date();
            java.sql.Date fechaactual = new java.sql.Date(utilDate.getTime());



%>
<%


            Long id_101;

            RN_101 rn101 = new RN_101();
            id_101 = rn101.ObtenerCorrelativo101();


//RESCATAMOS QUE TIPO DE OPERACION SE VA A HACER
String oca101id = request.getParameter("oca101idozf");
            if (oca101id == null) {
                response.sendRedirect("nuevo_101.jsp");
            }
            if (oca101id.equals("")) {
                response.sendRedirect("nuevo_101.jsp");
            }



            RN_OrdenCompra oc = new RN_OrdenCompra(oca101id);

            List li = oc.ObtenerOrdendeCompra();

            Iterator itr = li.iterator();
            while (itr.hasNext()) {
                OrdenDeCompra oc101 = (OrdenDeCompra) itr.next();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>ZofPlus</title>

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
        <script type="text/javascript" language="JavaScript" src="js/jquery.calculation.js"></script>
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
        <link rel="stylesheet" type="text/css" media="screen" href="css/datePicker.css">
<style>
	.ui-button { margin-left: -1px; margin-bottom: -10px; height: 90%;   }
	.ui-button-icon-only .ui-button-text { padding: 0.35em; }
	.ui-autocomplete-input { margin: 0; padding: 0.48em 0 0.47em 0.45em; }
</style>









        <script type="text/javascript">
            $(document).ready(function() {

                $("#form_agregardocadjunto").validate();

                var pais_origen =<%=oc101.getOcPorigencod()%>
                var moneda =<%=oc101.getOcPorigencod()%>
                $("#pais_origen option:contains("+pais_origen+")").attr("selected", true);
                $('#pais_origen').attr('readonly','readonly');
                $("#moneda option:contains("+moneda+")").attr("selected", true);
                $('#moneda').attr('readonly','readonly');


                $('#finalizar_proceso').click( function() {
                    $("#form_101rdp").validate();
                } );





            } );///Finalizacion del DocumentReady
        </script>


 
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



    </head>

    <body>
        <div id="indicadores">
            UF <script type="text/javascript">indicadorEOF(6);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
            Dolar Observado <script type="text/javascript">indicadorEOF(8);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
            Euro <script type="text/javascript">indicadorEOF(9);</script>
        </div>
        <div id=titulo style="margin:60% 2%;font:80px calibri;color:#e4e4e4;position:absolute;">Nuevo 101 OZF</div>
        <div id="contenedor">
            <div id="TabbedPanels1" class="TabbedPanels">
                <ul class="TabbedPanelsTabGroup">
                    <li class="TabbedPanelsTab" tabindex="0">101 Otra Zona Franca</li>
                    <li class="TabbedPanelsTab" tabindex="0">Factura</li>
                </ul>
                <div class="TabbedPanelsContentGroup">
                    <!-- pestaña 1-->
                    <div class="TabbedPanelsContent" style="font:13px calibri;">




                        <form id="form_101rdp" name="form_101rdp" method="post" action="paso_101ozf.jsp">




                            <fieldset style="color:#b01414;"><legend><font style="font:17px calibri;background:#b01414;color:#fff;">Cabecera Ingreso 101-Otra Zona Franca - N°: <%=id_101%> </font></legend>
                                <input  class="text " type="hidden" name="id_101" value="<%=id_101%>" />
                                <input  class="text " type="hidden" name="oca101id" value="<%=oca101id%>" />



                                <table style="width:710px;" > <!--width="750" border="1"> -->
                                    <tr>
                                        <td>Glosa</td>
                                        <td><input id="glosa" class="text " type="text" readonly="readonly" name="glosa" value="<%=oc101.getOcGlosa()%>" />   </td>
                                    </tr>
                                    <tr>
                                        <td>Información Adicional</td>
                                        <td>
                                            <textarea name="informacion_adicional" rows="3" cols="40" readonly="readonly" id="informacion_adicional" ><%=oc101.getOcInfadicional()%></textarea>   </td>
                                    </tr>



                                    <%-- Pais Origen siempre se debe de colocar--%>
                                    <tr>
                                        <td>Pais Origen Mercancia</td>
                                        <td>
                                            <select name="pais_origen">
                                                <option value ="101">SENEGAL</option>
                                                <option value ="102">GAMBIA</option>
                                                <option value ="103">GUINEA-BISSAU</option>
                                                <option value ="104">GUINEA</option>
                                                <option value ="105">SIERRA LEONA</option>
                                                <option value ="106">LIBERIA</option>
                                                <option value ="107">COSTA DE MARFIL</option>
                                                <option value ="108">GHANA</option>
                                                <option value ="109">TOGO</option>
                                                <option value ="111">NIGERIA</option>
                                                <option value ="112">SUDAFRICA</option>
                                                <option value ="113">BOTSWANA</option>
                                                <option value ="114">LESOTHO</option>
                                                <option value ="115">MALAWI</option>
                                                <option value ="116">ZIMBABWE</option>
                                                <option value ="117">ZAMBIA</option>
                                                <option value ="118">COMORAS</option>
                                                <option value ="119">MAURICIO</option>
                                                <option value ="120">MADAGASCAR</option>
                                                <option value ="121">MOZAMBIQUE</option>
                                                <option value ="122">SWAZILANDIA</option>
                                                <option value ="123">SUDAN</option>
                                                <option value ="124">EGIPTO</option>
                                                <option value ="125">LIBIA</option>
                                                <option value ="126">TUNEZ</option>
                                                <option value ="127">ARGELIA</option>
                                                <option value ="128">MARRUECOS</option>
                                                <option value ="129">CABO VERDE</option>
                                                <option value ="130">CHAD</option>
                                                <option value ="131">NIGER</option>
                                                <option value ="132">ALTO VOLTA</option>
                                                <option value ="133">MALI</option>
                                                <option value ="134">MAURITANIA</option>
                                                <option value ="135">TANZANIA</option>
                                                <option value ="136">UGANDA</option>
                                                <option value ="137">KENIA</option>
                                                <option value ="138">SOMALIA</option>
                                                <option value ="139">ETIOPIA</option>
                                                <option value ="140">ANGOLA</option>
                                                <option value ="141">BURUNDI</option>
                                                <option value ="142">RWANDA</option>
                                                <option value ="143">REP.DEM. CONGO</option>
                                                <option value ="144">CONGO</option>
                                                <option value ="145">GABON</option>
                                                <option value ="146">S.TOM.PRINCIPE</option>
                                                <option value ="147">GUINEA ECUATRL</option>
                                                <option value ="148">REP.CENT.AFRIC.</option>
                                                <option value ="149">CAMERUN</option>
                                                <option value ="150">BENIN</option>
                                                <option value ="151">TERR.BRIT.EN AF</option>
                                                <option value ="152">TER.ESPAN.EN AF</option>
                                                <option value ="153">TERR.FRAN.EN AF</option>
                                                <option value ="154">BOPHUTHATSWANA</option>
                                                <option value ="155">DJIBOUTI</option>
                                                <option value ="156">SEYCHELLES</option>
                                                <option value ="158">VIENDA</option>
                                                <option value ="159">NAMIBIA</option>
                                                <option value ="161">BURKINA FASO</option>
                                                <option value ="162">CISKEY</option>
                                                <option value ="163">ERITREA</option>
                                                <option value ="164">ISLAS MARSHALL</option>
                                                <option value ="165">SAHARAVI</option>
                                                <option value ="166">TRANSKEI</option>
                                                <option value ="201">VENEZUELA</option>
                                                <option value ="202">COLOMBIA</option>
                                                <option value ="203">TRINID.Y TOBAGO</option>
                                                <option value ="204">BARBADOS</option>
                                                <option value ="205">JAMAICA</option>
                                                <option value ="206">REP.DOMINICANA</option>
                                                <option value ="207">BAHAMAS</option>
                                                <option value ="208">HAITI</option>
                                                <option value ="209">CUBA</option>
                                                <option value ="210">PANAMA</option>
                                                <option value ="211">COSTA RICA</option>
                                                <option value ="212">NICARAGUA</option>
                                                <option value ="213">EL SALVADOR</option>
                                                <option value ="214">HONDURAS</option>
                                                <option value ="215">GUATEMALA</option>
                                                <option value ="216">MEXICO</option>
                                                <option value ="217">GUYANA</option>
                                                <option value ="218">ECUADOR</option>
                                                <option value ="219">PERU</option>
                                                <option value ="220">BRASIL</option>
                                                <option value ="221">BOLIVIA</option>
                                                <option value ="222">PARAGUAY</option>
                                                <option value ="223">URUGUAY</option>
                                                <option value ="224">ARGENTINA</option>
                                                <option value ="225">U.S.A.</option>
                                                <option value ="226">CANADA</option>
                                                <option value ="227">TERR.BRIT.EN AM</option>
                                                <option value ="228">TERR.FRAN.EN AM</option>
                                                <option value ="229">TER.HOLAN.EN AM</option>
                                                <option value ="230">TERR.D/DINAMARC</option>
                                                <option value ="231">DOMINICA</option>
                                                <option value ="232">GRANADA</option>
                                                <option value ="233">SANTA LUCIA(ISL</option>
                                                <option value ="234">S.VTE.Y GRANAD.</option>
                                                <option value ="235">SURINAM</option>
                                                <option value ="236">BELICE</option>
                                                <option value ="240">ANTIGUA Y BBUDA</option>
                                                <option value ="241">SNT.KIT & NEVIS</option>
                                                <option value ="242">ANGUILA</option>
                                                <option value ="243">ARUBA</option>
                                                <option value ="244">BERMUDAS</option>
                                                <option value ="245">ISLAS VIRGENES BRITANICAS</option>
                                                <option value ="246">ISLAS CAYMAN</option>
                                                <option value ="247">ANTILLAS NEERLANDESAS</option>
                                                <option value ="248">TURCAS Y CAICOS</option>
                                                <option value ="249">ISLAS VIRGENES (ESTADOS UNIDOS</option>
                                                <option value ="250">MARTINICA</option>
                                                <option value ="251">PUERTO RICO</option>
                                                <option value ="252">MONSERRAT</option>
                                                <option value ="253">GROENLANDIA</option>
                                                <option value ="301">JORDANIA</option>
                                                <option value ="302">ARABIA SAUDITA</option>
                                                <option value ="303">KUWAIT</option>
                                                <option value ="304">OMAN</option>
                                                <option value ="305">CHIPRE</option>
                                                <option value ="306">ISRAEL</option>
                                                <option value ="307">IRAK</option>
                                                <option value ="308">AFGANISTAN</option>
                                                <option value ="309">IRAN</option>
                                                <option value ="310">SIRIA</option>
                                                <option value ="311">LIBANO</option>
                                                <option value ="312">QATAR</option>
                                                <option value ="313">BAHREIN</option>
                                                <option value ="314">SRI LANKA</option>
                                                <option value ="315">CAMBOYA</option>
                                                <option value ="316">LAOS</option>
                                                <option value ="317">INDIA</option>
                                                <option value ="318">BHUTAN</option>
                                                <option value ="319">THAILANDIA</option>
                                                <option value ="320">NEPAL</option>
                                                <option value ="321">BANGLADESH</option>
                                                <option value ="322">YEMEN</option>
                                                <option value ="323">YEMEN DEL SUR</option>
                                                <option value ="324">PAKISTAN</option>
                                                <option value ="325">VIETNAM</option>
                                                <option value ="326">MYANMAR (EX BIR</option>
                                                <option value ="327">ISLAS MALDIVAS</option>
                                                <option value ="328">INDONESIA</option>
                                                <option value ="329">MALASIA</option>
                                                <option value ="330">TAIWAN (FORMOSA</option>
                                                <option value ="331">JAPON</option>
                                                <option value ="332">SINGAPUR</option>
                                                <option value ="333">COREA DEL SUR</option>
                                                <option value ="334">COREA DEL NORTE</option>
                                                <option value ="335">FILIPINAS</option>
                                                <option value ="336">CHINA</option>
                                                <option value ="337">MONGOLIA</option>
                                                <option value ="338">HONG-KONG REGION ADM. ESPECIAL DE CHINA</option>
                                                <option value ="341">EMIR.ARAB.UNID.</option>
                                                <option value ="342">HONG KONG</option>
                                                <option value ="343">TER.PORTUG.E/AS</option>
                                                <option value ="344">BRUNEI</option>
                                                <option value ="345">MACAO</option>
                                                <option value ="346">REPUBLICA DE YEMEN</option>
                                                <option value ="401">FIJI</option>
                                                <option value ="402">NAURU</option>
                                                <option value ="403">ISLAS TONGA</option>
                                                <option value ="404">SAMOA OCC.</option>
                                                <option value ="405">NUEVA ZELANDIA</option>
                                                <option value ="406">AUSTRALIA</option>
                                                <option value ="407">TERR.BRIT.EN AU</option>
                                                <option value ="408">TERR.FRAN.EN AU</option>
                                                <option value ="409">T.NORTEAM.EN AU</option>
                                                <option value ="412">PPUA.NVA.GUINEA</option>
                                                <option value ="415">VANUATU</option>
                                                <option value ="416">KIRIBATI</option>
                                                <option value ="417">MICRONESIA</option>
                                                <option value ="418">ISLAS SALOMON</option>
                                                <option value ="419">TUVALU</option>
                                                <option value ="420">PALAU</option>
                                                <option value ="421">NIUE</option>
                                                <option value ="422">POLINESIA FRANCESA</option>
                                                <option value ="423">NUEVA CALEDONIA</option>
                                                <option value ="424">ISLAS MARIANAS DEL NORTE</option>
                                                <option value ="425">GUAM</option>
                                                <option value ="426">TIMOR ORIENTAL</option>
                                                <option value ="427">ISLAS COOK</option>
                                                <option value ="501">PORTUGAL</option>
                                                <option value ="502">ALEMANIA R.F.</option>
                                                <option value ="503">ALEMANIA R.D.(N</option>
                                                <option value ="504">ITALIA</option>
                                                <option value ="505">FRANCIA</option>
                                                <option value ="506">IRLANDA</option>
                                                <option value ="507">DINAMARCA</option>
                                                <option value ="508">SUIZA</option>
                                                <option value ="509">AUSTRIA</option>
                                                <option value ="510">REINO UNIDO</option>
                                                <option value ="511">SUECIA</option>
                                                <option value ="512">FINLANDIA</option>
                                                <option value ="513">NORUEGA</option>
                                                <option value ="514">BELGICA</option>
                                                <option value ="515">HOLANDA</option>
                                                <option value ="516">ISLANDIA</option>
                                                <option value ="517">ESPANA</option>
                                                <option value ="518">ALBANIA</option>
                                                <option value ="519">RUMANIA</option>
                                                <option value ="520">GRECIA</option>
                                                <option value ="521">U.R.S.S.   (NO</option>
                                                <option value ="522">TURQUIA</option>
                                                <option value ="523">MALTA</option>
                                                <option value ="524">SANTA SEDE</option>
                                                <option value ="525">ANDORRA</option>
                                                <option value ="526">YUGOESLAVIA (NO</option>
                                                <option value ="527">BULGARIA</option>
                                                <option value ="528">POLONIA</option>
                                                <option value ="529">CHECOESLOVAQUIA</option>
                                                <option value ="530">HUNGRIA</option>
                                                <option value ="532">LUXEMBURGO</option>
                                                <option value ="534">LIECHTENSTEIN</option>
                                                <option value ="535">MONACO</option>
                                                <option value ="536">SAN MARINO</option>
                                                <option value ="540">ARMENIA</option>
                                                <option value ="541">AZERBAIYAN</option>
                                                <option value ="542">BELARUS</option>
                                                <option value ="543">BOSNIA HERZEGOVINA</option>
                                                <option value ="544">REPUBLICA CHECA</option>
                                                <option value ="545">REP.ESLOVACA</option>
                                                <option value ="547">CROACIA</option>
                                                <option value ="548">ESLOVENIA</option>
                                                <option value ="549">ESTONIA</option>
                                                <option value ="550">GEORGIA</option>
                                                <option value ="551">KASAJSTAN</option>
                                                <option value ="552">KIRGISTAN</option>
                                                <option value ="553">LETONIA</option>
                                                <option value ="554">LITUANIA</option>
                                                <option value ="555">MACEDONIA</option>
                                                <option value ="556">MOLDOVA</option>
                                                <option value ="557">TADJIKISTAN</option>
                                                <option value ="558">TURKMENISTAN</option>
                                                <option value ="559">UCRANIA</option>
                                                <option value ="560">UZBEKISTAN</option>
                                                <option value ="562">RUSIA</option>
                                                <option value ="563">ALEMANIA</option>
                                                <option value ="564">RF YUGOSLAVIA</option>
                                                <option value ="565">GIBRALTAR</option>
                                                <option value ="566">GUERNSEY</option>
                                                <option value ="567">ISLA DE MAN</option>
                                                <option value ="568">JERSEY</option>
                                                <option value ="888">LOS DEMAS</option>
                                                <option value ="900">RANCHO</option>
                                                <option value ="901">COMB.Y LUBRIC.</option>
                                                <option value ="902">RANCHO DE NAVES</option>
                                                <option value ="903">PESCA EXTRA</option>
                                                <option value ="904">ORIG.O DEST. NO</option>
                                                <option value ="905">ZF.IQUIQUE</option>
                                                <option value ="906">DEPOSITO FRANCO</option>
                                                <option value ="907">ZF.PARENAS</option>
                                                <option value ="910">ZF.ARICA-ZF IND</option>
                                                <option value ="911">ALMACEN FRANCO DE DEPOSITO</option>
                                                <option value ="912">DEPOSITO FRANCO</option>
                                                <option value ="913">ZONA PRIMARIA</option>
                                                <option value ="997" selected="selected">CHILE</option>
                                                <option value ="998">NAC.REPUTADA</option>
                                                <option value ="999">OTROS(PAIS DESC</option>

                                            </select>
                                        </td>
                                    </tr>



                                    <tr>
                                        <td>Otra Zona Franca</td>
                                        <td>
                                            <select name="region" id="region" class="required">
                                                <option value="">Seleccione Otra Zona Franca</option>
                                                <option value="952">Zona Franca Iquique</option>
                                                <option value="953">Zona Franca Punta Arenas</option>
                                            </select>
                                        </td>
                                    </tr>



                                    <tr>
                                        <td>Ubicacion Destino Mercancia</td>
                                        <td>
                                            <select name="ubicacion_destino" id="ubicacion_destino" class="required">
                                                <option value="" selected="selected">Seleccione Ubicacion de Destino Mercancia</option>
                                                <%
                                                                RN_Galpon galpon= new RN_Galpon();
                                List liga = galpon.ListarGalpon();
                                Iterator itga = liga.iterator();
                                while (itga.hasNext()) {
                                    Galpon g = (Galpon) itga.next();

                                                                out.println("<option value='"+g.getIdGalpon()+"'>");
                                                                out.println(g.getDescripcionGalpon());
                                                                out.println("</option>");
                                                                }

                                                %>

                                            </select>

                                        </td>
                                    </tr>



                                    <tr>
                                        <td>Tipo de Tramite</td>
                                        <td>
                                            <select name="tipo_tramite" class="required">
                                                <option value="">Seleccione Tipo de Tramite</option>
                                                <option value="LEY18110">LEY 18.110</option>
                                                <option value="ART21">ARTICULO 21</option>
                                            </select>
                                        </td>
                                    </tr>



                                    <tr>
                                        <td>Monto Operación</td>
                                        <td>
                                            <input name="monto_operacion" id="monto_operacion" class="required" value="<%=oc101.getTotalgralOc()%>"   />   </td>
                                    </tr>

                                    <tr>
                                        <td>Finalizar Proceso</td>
                                        <td>
                                            <input type="submit" value=" [ Confirmar ] " id ="finalizar_proceso"/>
                                        </td>
                                    </tr>
                                    </form>

                                    <%


                                                }
                                    %>


                                    <%-- Cerramos la Tabla por el Fieldset--%>
                                </table>

                            </fieldset>
                                <br/><br/>
                            <table width="100%" border="1" cellspacing="1" cellpadding="1">
                                <tr>
                                    <td><table width="100%" border="1" cellspacing="1" cellpadding="1" style="font:13px calibri;">
                                            <tr>
                                                <td ><div align="center" style="background:#b01414;color:#fff;"><strong>Codigo de Producto</strong></div></td>
                                                <td ><div align="center" style="background:#b01414;color:#fff;"><strong>Nombre</strong></div></td>
                                                <td><div align="center" style="background:#b01414;color:#fff;"><strong>Precio Unitario</strong></div></td>
                                                <td ><div align="center" style="background:#b01414;color:#fff;"><strong>Cantidad</strong></div></td>
                                                <td><div align="center" style="background:#b01414;color:#fff;"><strong>Total</strong></div></td>
                                            </tr>

                                            <%
                                                        RN_Item rnitem = new RN_Item(oca101id);

                                                        Double sumatoria = Double.valueOf("0");

                                                        List listaitem = rnitem.ObtenerItemSegunOC();

                                                        Iterator itritem = listaitem.iterator();
                                                        while (itritem.hasNext()) {
                                                            Item item = (Item) itritem.next();

                                                            sumatoria = sumatoria + item.getItmCiftotal();

                                            %>
                                            <tr>
                                                <td><%=item.getItmNumero()%></td>
                                                <td><%= item.getProducto().getProNombre()%></td>
                                                <td><%= item.getProducto().getProCifuni()%></td>
                                                <td><%= item.getItmCantidad()%></td>
                                                <td><%= item.getItmCiftotal()%></td>

                                            </tr>
                                            <%}

                                            %>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td><div align="center"><strong>TOTAL FINAL</strong></div></td>
                                                <td><%= sumatoria%></td>

                                            </tr>

                                        </table></td>
                                </tr>
                            </table>

                    </div>
                    <!-- pestaña 2-->
                    <div class="TabbedPanelsContent">
                        <%
                        RN_DocumentoAdjunto dadid = new RN_DocumentoAdjunto();
                        %>

                        <fieldset>

                            <legend style="background:#b01414;color:#fff;font:17px calibri;"><p>Factura</p></legend>
                        <form id="form_agregardocadjunto" name="form_agregardocadjunto" method="post" action="paso_facturaozf.jsp">

                            <table width="100%"  cellspacing="1" cellpadding="1" style="font:13px calibri;">
                                <tr>
                                    <td width="37%">Folio Documento Adjunto</td>
                                    <td width="63%"><label>
                                            <input type="text" name="dad_id" id="dad_id" value="<%=dadid.ObtenerCorrelativoDocumentoAdjunto()%>" readonly="readonly" />
                                        </label></td>
                                </tr>
                           <!--     <tr>
                                  <td>Folio 101</td>
                                  <td><label>
                                          <input name="id_101" id="id_101" value='<%=id_101%>' type="hidden" />
                                  </label></td>
                                </tr>
                                <tr> -->
                                    <td>Tipo de Documento Adjunto</td>
                                    <td>
                                        <select name="dad_tipo" id="dad_tipo" class="required">
                                            <option value="" selected="selected">Seleccione tipo de Documento</option>
                                            <option value="ADJ001">FACTURAS</option>
                                            <option value="ADJ003">MANIFIESTO</option>
                                            <option value="ADJ010">DOCUMENTO DE ZONA FRANCA</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Fecha</td>
                                    <td><label>
                                            <input type="text" name="dad_fecha" id="dad_fecha" class="required dateISO date-pick" autocomplete="off"  />
                                        </label></td>
                                </tr>
                                <tr>
                                    <td>Emisor</td>
                                    <td><label>
                                            <input type="text" name="dad_emisor" id="dad_emisor" autocomplete="off" />
                                        </label></td>
                                </tr>
                            </table>
                            </fieldset>
                            <p>&nbsp;</p>
                            <p>
                                <label>
                                    <input type='hidden' name="id_101" id="id_101" value='<%=id_101%>' />
                                    <input type='hidden' name="oca101id" id="oca101id" value='<%=oca101id%>'>
                                    <input type="submit" name="enviar" id="enviar" value=" [ Adjuntar Documento ] " />
                                </label>
                            </p>
                            <p>&nbsp;</p>
                        </form>
                        <p></p>
                        <p></p>
                        <p></p>
                        <p></p>
                        <p></p>
                    </div>


                </div>
    <br/><div style="margin-left:45%;font:20px calibri;color:#fff;"><a href="inicio.jsp"><b>Volver</b></a></div><br/><br/>

            </div>
        </div>

        <!--  <div id="pie">
              <a href="inicio.jsp">Inicio</a>&nbsp;&nbsp;&nbsp;&nbsp;  | &nbsp;&nbsp;&nbsp;&nbsp; Ayuda &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Servicios &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Empresas &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Contacto &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Fax
          </div>-->
    </div><!-- cierre contenedor-->
    <script type="text/javascript">
        <!--
        var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
        //-->
    </script>

<div id="pie" style="margin-top:0px;">
            <a href="inicio.jsp">Inicio</a>&nbsp;&nbsp;&nbsp;&nbsp;  | &nbsp;&nbsp;&nbsp;&nbsp; Ayuda &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Servicios &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Empresas &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Contacto &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Fax
</div>
</body>
</html>


<%

RN_101 rn101agregar = new RN_101(String.valueOf(id_101), oca101id);
rn101agregar.AgregarCabecera101();

%>