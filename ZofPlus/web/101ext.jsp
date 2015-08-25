<%@page import = "RN.RN_OrdenCompra" %>
<%@page import = "RN.RN_DocumentoAdjunto" %>
<%@page import = "mapeo.OrdenDeCompra" %>
<%@page import = "RN.RN_Item" %>
<%@page import = "mapeo.Item" %>
<%@page import = "RN.RN_Galpon" %>
<%@page import = "mapeo.Galpon" %>
<%@page import = "RN.RN_101" %>
<%@page import = "mapeo.Cabecera101" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.Iterator" %>
<%

            java.util.Date utilDate = new java.util.Date();
            java.sql.Date fechaactual = new java.sql.Date(utilDate.getTime());



%>
<%


            Long id_101;

            RN_101 rn101 = new RN_101();
            id_101 = rn101.ObtenerCorrelativo101();


//RESCATAMOS QUE TIPO DE OPERACION SE VA A HACER
            String oca101id = request.getParameter("oca101id");
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
                var pais_origen =<%=oc101.getOcPorigencod()%>
                var moneda =<%=oc101.getOcPorigencod()%>
                $("#pais_origen option:contains("+pais_origen+")").attr("selected", true);
                $('#pais_origen').attr('readonly','readonly');
                $("#moneda option:contains("+moneda+")").attr("selected", true);
                $('#moneda').attr('readonly','readonly');


                $('#finalizar_proceso').click( function() {
                    $("#form_101ext").validate();
                } );
                $("#tipo_documento_adjuntos").validate();
                

                //se suma automaticamente el cif
                $("input[name^=valor_]").sum("keyup", "#valor_cif");
                //aca ponemos el codigo en bruto del jquery

                $('#valor_flete_teorico').click( function() {
                    if ($('#valor_flete_teorico').attr('checked')) {
                        var fob = $('#valor_fob').val()
                        var valor_flete_teorico = (fob*0.05).toFixed(2)
                        $('#valor_flete').attr('value', valor_flete_teorico)
                        $('#valor_flete').attr('readonly','readonly');

                    }// Estoy chequeado

                    else
                    {
                        $('#valor_flete').removeAttr("readonly");
                    }
                } );    //CIERRE FLETE TEORICO

                $('#valor_seguro_teorico').click( function() {
                    if ($('#valor_seguro_teorico').attr('checked')) {
                        var fob = $('#valor_fob').val()
                        var valor_seguro_teorico = (fob*0.02).toFixed(2)
                        $('#valor_seguro').attr('value', valor_seguro_teorico)
                        $('#valor_seguro').attr('readonly','readonly');
                    }// Estoy chequeado

                    else
                    {
                        $('#valor_seguro').removeAttr("readonly");
                    }
                } );    //CIERRE SEGURO TEORICO

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
                    <li class="TabbedPanelsTab" tabindex="0">Otros Documentos Adjuntos</li>
                    <li class="TabbedPanelsTab" tabindex="0">Factura</li>
                    <div style="margin-left:90%;font:20px calibri;color:#fff;position:absolute;"><a href="inicio.jsp"><b>Volver</b></a></div>
                </ul>
                <div class="TabbedPanelsContentGroup">
                    <!-- pestaña 1-->
                    <div class="TabbedPanelsContent">                                               




                        <form id="form_101ext" name="form_101ext" method="post" action="paso_101ext.jsp">
                            <input  class="text " type="hidden" name="id_101" value="<%=id_101%>" />
                            <input  class="text " type="hidden" name="oca101id" value="<%=oca101id%>" />
                            <center style="background:#eee;text-align:center;"><legend><h3 style="text-align:center;font:20px calibri;">Cabecera Documento 101 Extranjero N°: <%=id_101%> </h3></legend></center>
                            <table width="710" style="font:15px calibri;" > <!--width="750" border="1"> -->
                                <tr>
                                    <td>Glosa</td>
                                    <td>
                                        <input id="glosa" class="text " type="text" name="glosa" readonly="readonly" value="<%=oc101.getOcGlosa()%>" />   </td>
                                </tr>

                                <tr>
                                    <td>Información Adicional</td>
                                    <td>
                                        <textarea name="informacion_adicional" rows="3" cols="40" readonly="readonly" id="informacion_adicional"><%=oc101.getOcInfadicional()%></textarea>   </td>
                                </tr>
                                <tr><td>
                                        <center style="background:#eee;text-align:center;"><legend><h3 style="text-align:center;font:15px calibri;">Datos Asociados al Origen de la Mercancia</h3></legend></center>
                                        <%-- Pais Origen siempre se debe de colocar--%>
                                    </td></tr>
                                <tr>
                                    <td>Pais Origen Mercancia</td>
                                    <td>
                                        <select name="pais_origen" id="pais_origen" >
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
                                            <option value ="331" selected="selected">JAPON</option>
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
                                            <option value ="997">CHILE</option>
                                            <option value ="998">NAC.REPUTADA</option>
                                            <option value ="999">OTROS(PAIS DESC</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Tipo de Tramite</td>
                                    <td>
                                        <select name="tipo_tramite" class="required">
                                            <option value="">Seleccione Tipo de Tramite</option>
                                            <option value="A">ANTICIPADO</option>
                                            <option value="N">NORMAL</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Clausula</td>
                                    <td>
                                        <select name="clausula" id="clausula" class="required">
                                            <option value="" selected="selected">Seleccione Clausula</option>
                                            <option value="C">C.I.F.</option>
                                            <option value="F">F.O.B.</option>
                                            <option value="L">C.I.F. + F.O.B.</option>
                                        </select>
                                    </td>
                                </tr>


                                <%-- como es ingreso de mercacnia de EXT moneda codigo no debe ser peso chileno--%>
                                <tr>
                                    <td>Moneda</td>
                                    <td>
                                        <select name="moneda" id="moneda">
                                            <OPTION VALUE ="1">PESO</OPTION>
                                            <OPTION VALUE ="4">BOLIVIANO</OPTION>
                                            <OPTION VALUE ="5">CRUZEIRO REAL</OPTION>
                                            <OPTION VALUE ="6">DOLAR CAN</OPTION>
                                            <OPTION VALUE ="13" selected="selected">DOLAR USA</OPTION>
                                            <OPTION VALUE ="23">GUARANI</OPTION>
                                            <OPTION VALUE ="24">NUEVO SOL</OPTION>
                                            <OPTION VALUE ="26">PESO URUG</OPTION>
                                            <OPTION VALUE ="30">MARCO AL</OPTION>
                                            <OPTION VALUE ="36">DOLAR AUST</OPTION>
                                            <OPTION VALUE ="37">CHELIN</OPTION>
                                            <OPTION VALUE ="40">FRANCO BEL</OPTION>
                                            <OPTION VALUE ="48">RENMINBI</OPTION>
                                            <OPTION VALUE ="51">CORONA DIN</OPTION>
                                            <OPTION VALUE ="53">PESETA</OPTION>
                                            <OPTION VALUE ="57">MARCO FIN</OPTION>
                                            <OPTION VALUE ="58">FRANCO FR</OPTION>
                                            <OPTION VALUE ="64">FLORIN</OPTION>
                                            <OPTION VALUE ="71">LIRA</OPTION>
                                            <OPTION VALUE ="72">YEN</OPTION>
                                            <OPTION VALUE ="82">FRANCO SZ</OPTION>
                                            <OPTION VALUE ="96">CORONA NOR</OPTION>
                                            <OPTION VALUE ="97">DOLAR NZ</OPTION>
                                            <OPTION VALUE ="102">LIBRA EST</OPTION>
                                            <OPTION VALUE ="113">CORONA SC</OPTION>
                                            <OPTION VALUE ="127">DOLAR HK</OPTION>
                                            <OPTION VALUE ="128">RAND</OPTION>
                                            <OPTION VALUE ="129">PESO COL</OPTION>
                                            <OPTION VALUE ="130">SUCRE</OPTION>
                                            <OPTION VALUE ="131">DRACMA</OPTION>
                                            <OPTION VALUE ="132">PESO MEX</OPTION>
                                            <OPTION VALUE ="133">ESCUDO</OPTION>
                                            <OPTION VALUE ="134">BOLIVAR</OPTION>
                                            <OPTION VALUE ="135">DINAR</OPTION>
                                            <OPTION VALUE ="136">DOLAR SIN</OPTION>
                                            <OPTION VALUE ="137">RUPIA</OPTION>
                                            <OPTION VALUE ="138">DOLAR TAI</OPTION>
                                            <OPTION VALUE ="139">DIRHAM</OPTION>
                                            <OPTION VALUE ="142">EURO</OPTION>
                                            <OPTION VALUE ="301">WON</OPTION>
                                            <OPTION VALUE ="302">SCHILLING AUSTRIACO</OPTION>
                                            <OPTION VALUE ="303">MARKKA</OPTION>
                                            <OPTION VALUE ="304">BALBOA</OPTION>
                                            <OPTION VALUE ="305">PESO FILIPINO</OPTION>
                                            <OPTION VALUE ="306">COLON</OPTION>
                                            <OPTION VALUE ="307">QUETZAL</OPTION>
                                            <OPTION VALUE ="308">LEV</OPTION>
                                            <OPTION VALUE ="309">BAHT</OPTION>
                                            <OPTION VALUE ="310">LEU</OPTION>
                                            <OPTION VALUE ="311">LIRA TURCA</OPTION>
                                            <OPTION VALUE ="312">PESO CUBANO</OPTION>
                                            <OPTION VALUE ="313">RUPIA CINGALESA</OPTION>
                                            <OPTION VALUE ="314">RINGGIT</OPTION>
                                            <OPTION VALUE ="315">PESO LAS BAHAMAS</OPTION>
                                            <OPTION VALUE ="316">ZLOTY</OPTION>
                                            <OPTION VALUE ="317">LIBRA</OPTION>
                                            <OPTION VALUE ="318">FORINT</OPTION>
                                            <OPTION VALUE ="319">PUNT</OPTION>
                                            <OPTION VALUE ="320">RUPIA</OPTION>
                                            <OPTION VALUE ="321">ZIMBAWE</OPTION>
                                            <OPTION VALUE ="322">RIAL</OPTION>
                                            <OPTION VALUE ="323">FRANCO</OPTION>
                                            <OPTION VALUE ="324">RYAL</OPTION>
                                            <OPTION VALUE ="325">LIBRA IRLANDA</OPTION>
                                            <OPTION VALUE ="326">CORONA ISLANDIA</OPTION>
                                            <OPTION VALUE ="327">CORONA CHECA</OPTION>
                                            <OPTION VALUE ="328">RUBLO</OPTION>
                                            <OPTION VALUE ="329">DINAR YUGOESLAVO</OPTION>
                                            <OPTION VALUE ="900">OTRAS MONEDAS</OPTION>
                                            <OPTION VALUE ="901">ECU</OPTION>


                                        </select>
                                    </td>
                                </tr>



                                <%-- Pais de Procedencia solamente se debe de colocar en los 101EXT--%>
                                <tr>
                                    <td>Pais de Adquisision</td>
                                    <td>
                                        <select name="pais_procedencia">
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
                                            <option value ="331" selected="selected">JAPON</option>
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
                                            <option value ="997">CHILE</option>
                                            <option value ="998">NAC.REPUTADA</option>
                                            <option value ="999">OTROS(PAIS DESCONOCIDO)</option>

                                        </select>
                                    </td>
                                </tr>
                                <tr><td>
                                        <center style="background:#eee;text-align:center;"><legend><h3 style="text-align:center;font:15px calibri;">Valores Necesarios para la creacion del Documento</h3></legend></center>
                                    </td></tr>


                                <tr>
                                    <td>Valor F.O.B.</td>
                                    <td>
                                        <input name="valor_fob" id="valor_fob" class="required number money" />   </td>

                                </tr>



                                <tr>
                                    <td>Valor Flete</td>
                                    <td>
                                        <input name="valor_flete" id="valor_flete" class="required number money" />
                                    <td>Flete Teorico (5% del FOB)<input type="checkbox" id="valor_flete_teorico" name="valor_flete_teorico" class="text" /> </td>
                                </tr>

                                <tr>
                                    <td>Valor Seguro</td>
                                    <td>
                                        <input name="valor_seguro" id="valor_seguro" class="amt required"  />
                                    <td>Seguro Teorico (2% del FOB)<input type="checkbox"id="valor_seguro_teorico" name="valor_seguro_teorico" class="text" /> </td>
                                </tr>


                                <tr>
                                    <td>Valor C.I.F.</td>
                                    <td>
                                        <input name="cif_total" id="valor_cif" class="text required" />   </td>
                                </tr>


                                <tr><td>
                                        <center style="background:#eee;text-align:center;"><legend><h3 style="text-align:center;font:15px calibri;">Datos Asociados a la Logistica</h3></legend></center>
                                    </td></tr>



                                <%-- Medio de Transporte --%>
                                <tr>
                                    <td>Medio Transporte</td>
                                    <td>
                                        <select name="medio_transporte" size="1" class="text required">
                                            <option value="" selected="selected">Seleccione Medio de Transporte</option>
                                            <option value="1">Maritima</option>
                                            <option value="2">Fluvial</option>
                                            <option value="3">Lacustre</option>
                                            <option value="4">Aereo</option>
                                            <option value="5">Postal</option>
                                            <option value="6">Ferrovario</option>
                                            <option value="7">Carretero/Terrestre</option>
                                            <option value="8">Oleoductos, Gasotuctos</option>
                                            <option value="9">Tendido Electrico</option>
                                            <option value="10">Otra</option>
                                            <option value="11">Ducto Submarino</option>
                                        </select>
                                    </td>
                                </tr>



                                <%-- Puerto de Embarque --%>
                                <tr>
                                    <td>Puerto de Embarque</td>
                                    <td>
                                        <select name="puerto_embarque" size="1" class="text">
                                            <option value ="110">CANADA</option>
                                            <option value ="111" selected="selected">MONTREAL</option>
                                            <option value ="112">COSTA DEL PACIFICO</option>
                                            <option value ="113">HALIFAX</option>
                                            <option value ="114">VANCOUVER</option>
                                            <option value ="115">SAINT JOHN</option>
                                            <option value ="116">TORONTO</option>
                                            <option value ="117">OTROS PUERTOS CANADA</option>
                                            <option value ="118">BAYSIDE</option>
                                            <option value ="120">PORT CARTIES</option>
                                            <option value ="121">COSTA DEL ATLANTICO</option>
                                            <option value ="122">PUERTOS DEL GOLFO ME</option>
                                            <option value ="123">COSTA DEL PACIFICO</option>
                                            <option value ="124">QUEBEC</option>
                                            <option value ="125">PRINCE RUPERT</option>
                                            <option value ="126">HAMILTON</option>
                                            <option value ="130">PUERTO DEL ATL. EEUU</option>
                                            <option value ="131">BOSTON</option>
                                            <option value ="132">NEW HAVEN</option>
                                            <option value ="133">BRIDGEPORT</option>
                                            <option value ="134">NEW YORK</option>
                                            <option value ="135">FILADELFIA</option>
                                            <option value ="136">BALTIMORE</option>
                                            <option value ="137">NORFOLK</option>
                                            <option value ="138">WILMINGTON</option>
                                            <option value ="139">CHARLESTON</option>
                                            <option value ="140">SAVANAH</option>
                                            <option value ="141">MIAMI</option>
                                            <option value ="142">EVERGLADES</option>
                                            <option value ="143">JACKSONVILLE</option>
                                            <option value ="145">PALM BEACH</option>
                                            <option value ="146">BATON ROUGE</option>
                                            <option value ="147">COLUMBRES</option>
                                            <option value ="148">PITTSBURGH</option>
                                            <option value ="149">DULUTH</option>
                                            <option value ="150">MILWAUKEE</option>
                                            <option value ="151">TAMPA</option>
                                            <option value ="152">PENSACOLA</option>
                                            <option value ="153">MOBILE</option>
                                            <option value ="154">NEW ORLEANS</option>
                                            <option value ="155">PORT ARTHUR</option>
                                            <option value ="156">GALVESTON</option>
                                            <option value ="157">CORPUS CRISTI</option>
                                            <option value ="158">BROWNSVILLE</option>
                                            <option value ="159">HOUSTON</option>
                                            <option value ="160">OAKLAND</option>
                                            <option value ="161">STOCKTON</option>
                                            <option value ="170">PUERTOS DEL PACIF.EE</option>
                                            <option value ="171">SEATTLE</option>
                                            <option value ="172">PORTLAND</option>
                                            <option value ="173">SAN FRANCISCO</option>
                                            <option value ="174">LOS ANGELES</option>
                                            <option value ="175">LONG BEACH</option>
                                            <option value ="176">SAN DIEGO</option>
                                            <option value ="180">OTROS PUERTOS EE.UU.</option>
                                            <option value ="199">LOS VILOS</option>
                                            <option value ="200">AMERICA LATINA</option>
                                            <option value ="204">PATACHE</option>
                                            <option value ="205">CALBUCO</option>
                                            <option value ="206">MICHILLA</option>
                                            <option value ="207">PUERTO ANGAMOS</option>
                                            <option value ="208">POSEIDON</option>
                                            <option value ="209">TRES PUENTES</option>
                                            <option value ="210">OTROS PUERTOS MEXICO</option>
                                            <option value ="211">TAMPICO</option>
                                            <option value ="212">COSTA DEL PACIFICO</option>
                                            <option value ="213">VERACRUZ</option>
                                            <option value ="214">COATZACOALCOS</option>
                                            <option value ="215">GUAYMAS</option>
                                            <option value ="216">MAZATLAN</option>
                                            <option value ="217">MANZANILLO</option>
                                            <option value ="218">ACAPULCO</option>
                                            <option value ="219">GOLFO DE MEXICO,OTRO</option>
                                            <option value ="220">ALTAMIRA</option>
                                            <option value ="221">CRISTOBAL</option>
                                            <option value ="222">BALBOA</option>
                                            <option value ="223">COLON</option>
                                            <option value ="224">OTROS PTOS. PANAMA</option>
                                            <option value ="227">GRAN BRETANA</option>
                                            <option value ="230">COLOMBIA</option>
                                            <option value ="231">OTROS PTOS. COLOMBIA</option>
                                            <option value ="232">BUENAVENTURA</option>
                                            <option value ="233">BARRANQUILLA</option>
                                            <option value ="240">ECUADOR</option>
                                            <option value ="241">OTROS PTOS. ECUADOR</option>
                                            <option value ="242">GUAYAQUIL</option>
                                            <option value ="250">PERU</option>
                                            <option value ="251">OTROS PTOS. DE PERU</option>
                                            <option value ="252">CALLAO</option>
                                            <option value ="253">ILO</option>
                                            <option value ="254">IQUITOS</option>
                                            <option value ="260">ARGENTINA</option>
                                            <option value ="261">OTROS PTOS.ARGENTINA</option>
                                            <option value ="262">BUENOS AIRES</option>
                                            <option value ="263">NECOCHEA</option>
                                            <option value ="264">MENDOZA</option>
                                            <option value ="265">CORDOBA</option>
                                            <option value ="266">BAHIA BLANCA</option>
                                            <option value ="267">COMODORO RIVADAVIA</option>
                                            <option value ="268">PUERTO MADRYN</option>
                                            <option value ="269">MAR DEL PLATA</option>
                                            <option value ="270">ROSARIO</option>
                                            <option value ="271">OTROS PTOS.URUGUAY</option>
                                            <option value ="272">MONTEVIDEO</option>
                                            <option value ="280">VENEZUELA</option>
                                            <option value ="281">OTROS PTOS.VENEZUELA</option>
                                            <option value ="282">LA GUAIRA</option>
                                            <option value ="285">MARACAIBO</option>
                                            <option value ="290">BRASIL</option>
                                            <option value ="291">OTROS PTOS.BRASIL</option>
                                            <option value ="292">SANTOS</option>
                                            <option value ="293">RIO DE JANEIRO</option>
                                            <option value ="294">RIO GRANDE DEL SUR</option>
                                            <option value ="295">PARANAGUA</option>
                                            <option value ="296">SAO PAULO</option>
                                            <option value ="297">SALVADOR</option>
                                            <option value ="301">OTROS ANT.HOLANDESA</option>
                                            <option value ="302">CURAZAO</option>
                                            <option value ="399">OTROS PTOS.AMERICA</option>
                                            <option value ="400">ASIA</option>
                                            <option value ="410">CHINA</option>
                                            <option value ="411">SHANGAI</option>
                                            <option value ="412">DAIREN</option>
                                            <option value ="413">OTROS PTOS.DE CHINA</option>
                                            <option value ="420">COREA</option>
                                            <option value ="421">NANPO</option>
                                            <option value ="422">BUSAN CY (PUSAN)</option>
                                            <option value ="423">OTROS PTOS.DE COREA</option>
                                            <option value ="430">FILIPINAS</option>
                                            <option value ="431">MANILA</option>
                                            <option value ="432">OTROS PTOS.FILIPINAS</option>
                                            <option value ="440">JAPON</option>
                                            <option value ="441">OTROS PTOS.JAPONESES</option>
                                            <option value ="442">OSAKA</option>
                                            <option value ="443">KOBE</option>
                                            <option value ="444">YOKOHAMA</option>
                                            <option value ="445">NAGOYA</option>
                                            <option value ="446">SHIMIZUI</option>
                                            <option value ="447">MOJI</option>
                                            <option value ="448">YAWATA</option>
                                            <option value ="449">FUKUYAMA</option>
                                            <option value ="450">TAIWAN</option>
                                            <option value ="451">KAOHSIUNG</option>
                                            <option value ="452">KEELUNG</option>
                                            <option value ="453">OTROS PTOS.TAIWAN</option>
                                            <option value ="460">KARHG ISLAND</option>
                                            <option value ="461">KARHG ISLAND</option>
                                            <option value ="462">OTROS PTO.IRAN NO ES</option>
                                            <option value ="470">INDIA</option>
                                            <option value ="471">CALCUTA</option>
                                            <option value ="472">OTROS PTOS. DE INDIA</option>
                                            <option value ="480">BANGLADESH</option>
                                            <option value ="481">CHALNA</option>
                                            <option value ="482">OTROS PTO.BANGLADESH</option>
                                            <option value ="491">OTROS PTO.SINGAPUR</option>
                                            <option value ="492">HONG KONG</option>
                                            <option value ="499">OTROS PTO.ASIATICOS</option>
                                            <option value ="500">EUROPA</option>
                                            <option value ="510">RUMANIA</option>
                                            <option value ="511">CONSTANZA</option>
                                            <option value ="512">OTROS PTO.DE RUMANIA</option>
                                            <option value ="520">BULGARIA</option>
                                            <option value ="521">VARNA</option>
                                            <option value ="522">OTROS PTOS BULGARIA</option>
                                            <option value ="530">YUGOESLAVIA</option>
                                            <option value ="531">RIJEKA</option>
                                            <option value ="532">OTROS PTOS.YUGOESL.</option>
                                            <option value ="540">ITALIA</option>
                                            <option value ="541">OTROS PTOS.DE ITALIA</option>
                                            <option value ="542">GENOVA</option>
                                            <option value ="543">LIORNA,LIVORNO</option>
                                            <option value ="544">NAPOLES</option>
                                            <option value ="545">SALERNO</option>
                                            <option value ="546">AUGUSTA</option>
                                            <option value ="547">SAVONA</option>
                                            <option value ="550">FRANCIA</option>
                                            <option value ="551">OTROS PTOS.FRANCIA</option>
                                            <option value ="552">LA PALLICE</option>
                                            <option value ="553">LE HAVRE</option>
                                            <option value ="554">MARSELLA</option>
                                            <option value ="555">BURDEOS</option>
                                            <option value ="556">CALAIS</option>
                                            <option value ="557">BREST</option>
                                            <option value ="558">RUAN</option>
                                            <option value ="560">ESPANA</option>
                                            <option value ="561">OTROS PTOS.ESPANA</option>
                                            <option value ="562">CADIZ</option>
                                            <option value ="563">BARCELONA</option>
                                            <option value ="564">BILBAO</option>
                                            <option value ="565">HUELVA</option>
                                            <option value ="566">SEVILLA</option>
                                            <option value ="567">TARRAGONA</option>
                                            <option value ="570">INGLATERRA</option>
                                            <option value ="571">LIVERPOOL</option>
                                            <option value ="572">LONDRES</option>
                                            <option value ="573">ROCHESTER</option>
                                            <option value ="574">ETEN SALVERRY</option>
                                            <option value ="576">OTROS PTOS.INGLATERR</option>
                                            <option value ="577">DOVER</option>
                                            <option value ="578">PLYMOUTH</option>
                                            <option value ="580">FINLANDIA</option>
                                            <option value ="581">HELSINKI</option>
                                            <option value ="582">OTROS PTOS.FINLANDIA</option>
                                            <option value ="583">HANKO</option>
                                            <option value ="584">KEMI</option>
                                            <option value ="585">KOKKOLA</option>
                                            <option value ="586">KOTKA</option>
                                            <option value ="587">OULO</option>
                                            <option value ="588">PIETARSAARI</option>
                                            <option value ="589">PORI</option>
                                            <option value ="590">ALEMANIA OCCIDENTAL</option>
                                            <option value ="591">BREMEN</option>
                                            <option value ="592">HAMBURGO</option>
                                            <option value ="593">NUREMBERG</option>
                                            <option value ="594">FRANKFURT</option>
                                            <option value ="595">DUSSELDORF</option>
                                            <option value ="596">OTROS PTOS.ALEMANIA</option>
                                            <option value ="597">CUXHAVEN</option>
                                            <option value ="598">ROSTOCK</option>
                                            <option value ="599">OLDENBURG</option>
                                            <option value ="600">BELGICA</option>
                                            <option value ="601">AMBERES</option>
                                            <option value ="602">OTROS PTO.BELGICA</option>
                                            <option value ="603">ZEEBRUGGE</option>
                                            <option value ="604">GHENT</option>
                                            <option value ="605">OOSTENDE</option>
                                            <option value ="610">PORTUGAL</option>
                                            <option value ="611">LISBOA</option>
                                            <option value ="612">OTROSS PTOS.PORTUGAL</option>
                                            <option value ="613">SETUBAL</option>
                                            <option value ="620">HOLANDA</option>
                                            <option value ="621">AMSTERDAM</option>
                                            <option value ="622">ROTTERDAM</option>
                                            <option value ="623">OTROS PTOS.HOLANDA</option>
                                            <option value ="630">SUECIA</option>
                                            <option value ="631">GOTEMBURGO</option>
                                            <option value ="632">OTROS PTOS.SUECIA</option>
                                            <option value ="633">MALMO</option>
                                            <option value ="634">HELSIMBORG</option>
                                            <option value ="635">KALMAR</option>
                                            <option value ="640">DINAMARCA</option>
                                            <option value ="641">AARHUS</option>
                                            <option value ="642">COPENHAGEN</option>
                                            <option value ="643">OTROS PTOS.DINAMARCA</option>
                                            <option value ="644">AALBORG</option>
                                            <option value ="645">ODENSE</option>
                                            <option value ="650">NORUEGA</option>
                                            <option value ="651">OSLO</option>
                                            <option value ="652">OTROS PTO. NORUEGA</option>
                                            <option value ="653">STAVANGER</option>
                                            <option value ="699">OTROS PTOS.EUROPA</option>
                                            <option value ="700">AFRICA</option>
                                            <option value ="710">SUDAFRICA</option>
                                            <option value ="711">DURBAM</option>
                                            <option value ="712">CIUDAD DEL CABO</option>
                                            <option value ="713">OTROS PTO.SUDAFFRICA</option>
                                            <option value ="714">SALDANHA</option>
                                            <option value ="715">PORT-ELIZABETH</option>
                                            <option value ="716">MOSSEL-BAY</option>
                                            <option value ="717">EAST-LONDON</option>
                                            <option value ="799">OTROS PTO.DE AFRICA</option>
                                            <option value ="800">OCEANIA</option>
                                            <option value ="810">AUSTRALIA</option>
                                            <option value ="811">SIDNEY</option>
                                            <option value ="812">FREMANTLE</option>
                                            <option value ="813">OTROS PTOS.AUSTRALIA</option>
                                            <option value ="814">ADELAIDA</option>
                                            <option value ="815">DARWIN</option>
                                            <option value ="816">GERALDTON</option>
                                            <option value ="899">OTROS PTOS. OCEANIA</option>
                                            <option value ="900">RANCHO,COMB.,LUBRIC.</option>
                                            <option value ="901">ARICA</option>
                                            <option value ="902">IQUIQUE</option>
                                            <option value ="903">ANTOFAGASTA</option>
                                            <option value ="904">COQUIMBO</option>
                                            <option value ="905">VALPARAISO</option>
                                            <option value ="906">SAN ANTONIO</option>
                                            <option value ="907">TALCAHUANO</option>
                                            <option value ="908">SAN VICENTE</option>
                                            <option value ="909">LIRQUEN</option>
                                            <option value ="910">PUERTO MONTT</option>
                                            <option value ="911">CHACABUCO/PTO.AYSEN</option>
                                            <option value ="912">PUNTA ARENAS</option>
                                            <option value ="913">PATILLOS</option>
                                            <option value ="914">TOCOPILLA</option>
                                            <option value ="915">MEJILLONES</option>
                                            <option value ="916">TALTAL</option>
                                            <option value ="917">CHANARAL/BARQUITO</option>
                                            <option value ="918">CALDERA</option>
                                            <option value ="919">CALDERILLA</option>
                                            <option value ="920">HUASCO/GUACOLDA</option>
                                            <option value ="921">QUINTERO</option>
                                            <option value ="922">JUAN FERNANDEZ</option>
                                            <option value ="923">CONSTUTUCION</option>
                                            <option value ="924">TOME</option>
                                            <option value ="925">PENCO</option>
                                            <option value ="926">CORONEL</option>
                                            <option value ="927">LOTA</option>
                                            <option value ="928">LEBU</option>
                                            <option value ="929">ISLA DE PASCUA</option>
                                            <option value ="930">CORRAL</option>
                                            <option value ="931">ANCUD</option>
                                            <option value ="932">CASTRO</option>
                                            <option value ="933">QUELLON</option>
                                            <option value ="934">CHAITEN</option>
                                            <option value ="935">TORTEL</option>
                                            <option value ="936">NATALES</option>
                                            <option value ="937">GUARELLO</option>
                                            <option value ="938">CUTTERCOVE</option>
                                            <option value ="939">PERCY</option>
                                            <option value ="940">CLARENCIA</option>
                                            <option value ="941">GREGORIO</option>
                                            <option value ="942">CABO NEGRO</option>
                                            <option value ="943">PUERTO WILLIAMS</option>
                                            <option value ="944">TER.ANTARTICO CHILEN</option>
                                            <option value ="945">SALINAS</option>
                                            <option value ="946">GUAYACAN</option>
                                            <option value ="947">PUNTA DELGADA</option>
                                            <option value ="948">VENTANAS</option>
                                            <option value ="949">PINO HACHADO(LIUCURA</option>
                                            <option value ="950">CALETA COLOSO</option>
                                            <option value ="951">AGUAS NEGRAS</option>
                                            <option value ="952">ZONA FRANCA IQUIQUE</option>
                                            <option value ="953">ZONA FRANCA PTA AREN</option>
                                            <option value ="954">RIO MAYER</option>
                                            <option value ="955">RIO MOSCO</option>
                                            <option value ="956">VISVIRI</option>
                                            <option value ="957">CHACALLUTA</option>
                                            <option value ="958">CHUNGARA</option>
                                            <option value ="959">COLCHANE</option>
                                            <option value ="960">ABRA DE NAPA</option>
                                            <option value ="961">OLLAGUE</option>
                                            <option value ="962">SAN PEDRO DE ATACAMA</option>
                                            <option value ="963">SOCOMPA</option>
                                            <option value ="964">SAN FRANCISCO</option>
                                            <option value ="965">LOS LIBERTADORES</option>
                                            <option value ="966">MAHUIL MALAL</option>
                                            <option value ="967">CARDENAL SAMORE</option>
                                            <option value ="968">PEREZ ROSALES</option>
                                            <option value ="969">FUTALEUFU</option>
                                            <option value ="970">PALENA-CARRENLEUFU</option>
                                            <option value ="971">PANGUIPULLI</option>
                                            <option value ="972">HUAHUM</option>
                                            <option value ="973">LAGO VERDE</option>
                                            <option value ="974">APPELEG</option>
                                            <option value ="975">PAMPA ALTA</option>
                                            <option value ="976">HUEMULES</option>
                                            <option value ="977">CHILE CHICO</option>
                                            <option value ="978">BAKER</option>
                                            <option value ="979">DOROTEA</option>
                                            <option value ="980">CASAS VIEJAS</option>
                                            <option value ="981">MONTE AYMOND</option>
                                            <option value ="982">SAN SEBASTIAN</option>
                                            <option value ="983">COYHAIQUE ALTO</option>
                                            <option value ="984">TRIANA</option>
                                            <option value ="985">IBANEZ PALAVICINI</option>
                                            <option value ="986">VILLA OHIGGINS</option>
                                            <option value ="987">AEROP.CHACALLUTA</option>
                                            <option value ="988">AEROP.DIEGO ARACENA</option>
                                            <option value ="989">AEROP.CERRO MORENO</option>
                                            <option value ="990">AEROP.EL TEPUAL</option>
                                            <option value ="991">AEROP.C.I.DEL CAMPO</option>
                                            <option value ="992">AEROP.A.M.BENITEZ</option>
                                            <option value ="994">ARICA-TACNA</option>
                                            <option value ="995">ARICA-LA PAZ</option>
                                            <option value ="997">OTROS PTOS. CHILENOS</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Ubicacion Destino Mercancia</td>
                                    <td>
                                        <select name="ubicacion_destino" id="ubicacion_destino" class="required">
                                            <option value="" selected="selected">Seleccione Ubicacion de Destino Mercancia</option>
                                            <%
                                                            RN_Galpon galpon = new RN_Galpon();
                                                            List liga = galpon.ListarGalpon();
                                                            Iterator itga = liga.iterator();
                                                            while (itga.hasNext()) {
                                                                Galpon g = (Galpon) itga.next();

                                                                out.println("<option value='" + g.getIdGalpon() + "'>");
                                                                out.println(g.getDescripcionGalpon());
                                                                out.println("</option>");
                                                            }
                                            %>
                                        </select>
                                    </td>
                                </tr>

                                <%-- Transbordo Nacional --%>
                                <tr>
                                    <td>Transbordo Nacional</td>
                                    <td>
                                        <select name="transbordo_nacional" size="1" id="select" class="text required">
                                            <option value="" selected="selected">Seleccionar</option>
                                            <option value="N">No</option>
                                            <option value="S">Si</option>
                                        </select>
                                    </td>
                                </tr>



                                <%-- Transbordo Extranjero --%>
                                <tr>
                                    <td>Transbordo Extranjero</td>
                                    <td>
                                        <select name="transbordo_extranjero" size="1" id="select" class="text required">
                                            <option value="" selected="selected">Seleccionar</option>
                                            <option value="N" >No</option>
                                            <option value="S">Si</option>
                                        </select>
                                    </td>
                                </tr>

                                <%-- Transbordo Extranjero --%>
                                <tr>
                                    <td>Finalizar Proceso</td>
                                    <td>
                                        <input type="submit" value="Confirmar" id ="finalizar_proceso"/>
                                    </td>
                                </tr>
                        <%


                                    }
                        %>


                        <%-- Cerramos la Tabla por el Fieldset--%>
                        </table>
                        <br/><br/>
                        <table width="100%" style="font: 15px calibri;" cellspacing="1" cellpadding="1">
                            <tr>
                                <td><table width="100%" border="1" cellspacing="1" cellpadding="1">
                                        <tr style="background:#eee;">
                                            <td ><div align="center">Codigo de Producto</div></td>
                                            <td ><div align="center">Nombre</div></td>
                                            <td><div align="center">CIF Unitario</div></td>
                                            <td ><div align="center">Cantidad</div></td>
                                            <td><div align="center">Total</div></td>
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
                                            <td><div align="center">Total Final</div></td>
                                            <td><%= sumatoria%></td>

                                        </tr>

                                    </table></td>
                            </tr>
                        </table>

                    </div>
                </form>
                    <!-- pestaña 2-->
                    <div class="TabbedPanelsContent">
                        <%
                                    RN_DocumentoAdjunto dadid = new RN_DocumentoAdjunto();
                        %>
                        <legend style="background:#b01414;color:#fff;font:17px calibri;"><p>Documento Adjunto</p></legend>
                        <form id="form_agregardocadjunto" name="form_agregardocadjunto" method="post" action="paso_documentoadjunto.jsp">
                            <table width="100%" style="font:13px calibri;" cellspacing="1" cellpadding="1">
                                <tr>
                                    <td width="37%">Folio</td>
                                    <td width="63%"><label>
                                            <input type="text" name="dad_id" id="dad_id" value="<%=dadid.ObtenerCorrelativoDocumentoAdjunto()%>" />
                                        </label></td>
                                </tr>                                
                                <td>Folio 101</td>
                                <td><label>
                                        <input type="text" name="id_101" id="id_101" value='<%=id_101%>' readonly="readonly" />
                                    </label></td>
                                </tr>
                                <tr>
                                    <tr>
        <td>Tipo de Documento Adjunto</td>
        <td>
       <select name="dad_tipo" id="tipo_documento_adjunto" class="required">
        <option value="" selected="selected">Seleccione tipo de Documento</option>
        <option value="ADJ001">FACTURAS</option>
        <option value="ADJ002">CERTIFICADO DE SEGURO</option>
        <option value="ADJ003">MANIFIESTO</option>
        <option value="ADJ004">DECLARACIÓN DE TRANSBORDO</option>
        <option value="ADJ004">DECLARACIÓN DE REDESTINACIÓN</option>
        <option value="ADJ006">REGISTRO DE RECONOCIMIENTO DE REEMBALAJE Y DIVISIÓN</option>
        <option value="ADJ007">NOTA DE GASTOS</option>
        <option value="ADJ008">CONOCIMIENTO DE EMBARQUE</option>
        <option value="ADJ009">PAPELETA DE RECEPCIÓN</option>
        <option value="ADJ010">DOCUMENTO DE ZONA FRANCA</option>
        <option value="ADJ011">AUTORIZACION MINISTERIAL</option>
      </select>
       </td>
      </tr>
                                </tr>
                                <tr>
                                    <td>Fecha</td>
                                    <td><label>
                                            <input type="text" name="dad_fecha" id="dad_fecha"  class="required date-pick" />
                                        </label></td>
                                </tr>
                                <tr><!--
                                    <td>Emisor</td>
                                    <td><label>
                                            <input type="text" name="dad_emisor" id="dad_emisor" />
                                        </label></td> -->
                                </tr>
                                <tr>
                                    <td>C&oacute;digo de Aduana</td>
                                    <td><label>
                                            <input type="text" name="dad_aduana" id="dad_aduana"  class="required" />
                                        </label></td>
                                </tr>
                            </table>
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
                    <div class="TabbedPanelsContent">
                        <legend style="background:#b01414;color:#fff;font:17px calibri;"><p>Factura</p></legend>
                        <form id="form_agregardocadjunto" name="form_agregardocadjunto" method="post" action="paso_facturardp.jsp">

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


                    </div>

                </div>

            </div>

        </div>

    </div><!-- cierre contenedor-->

    <script type="text/javascript">
        <!--
        var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
        //-->
    </script>

    <br/>
    <div id="pie_oc">
        <a href="inicio.jsp">Inicio</a>&nbsp;&nbsp;&nbsp;&nbsp;  | &nbsp;&nbsp;&nbsp;&nbsp; Ayuda &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Servicios &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Empresas &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Contacto &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Fax
    </div>
</body>
</html>



<%

            RN_101 rn101agregar = new RN_101(String.valueOf(id_101), oca101id);
            rn101agregar.AgregarCabecera101();

%>
