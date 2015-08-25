<%@page import = "RN.RN_OrdenCompra" %>
<%@page import = "mapeo.OrdenDeCompra" %>
<%@page import = "RN.RN_Proveedor" %>
<%@page import = "mapeo.Proveedor" %>
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

        <script type="text/javascript">
            $(document).ready(function() {
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////
                $('#btn').click( function() {
                    $("#formu_ad").validate();
               } );
            
                formu_adoTable =  $('#grillaoc').dataTable( {
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers"
                } );
/*
$('#sel_prov').change(function() {
        var str = "";
        var name = $("#sel_prov option[value=" + countrycode + "]").text()
}
*/
            } );///Finalizacion del DocumentReady


        </script>
    </head>

    <body>
        <div id="indicadores">
            UF <script type="text/javascript">indicadorEOF(6);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
            Dolar Observado <script type="text/javascript">indicadorEOF(8);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
            Euro <script type="text/javascript">indicadorEOF(9);</script>
        </div>
        <div id=titulo style="margin:60% 2%;font:80px calibri;color:#e4e4e4;position:absolute;">Orden de Compra</div>
        <div id="contenedor">
            <div id="TabbedPanels1" class="TabbedPanels">
                <ul class="TabbedPanelsTabGroup">
                    <li class="TabbedPanelsTab" tabindex="0">Orden de Compra</li>
                    <li class="TabbedPanelsTab" tabindex="0">Nueva Orden de Compra</li>
                </ul>
                <div class="TabbedPanelsContentGroup">
                    <!-- pestaña 1-->
                    <div class="TabbedPanelsContent">
                        <center><font face="calibri">Listado Ordenes de Compra Existentes</font></center>
                        <br/>
                        <table class="display" id="grillaoc" style="width:100%;">
                            <thead>
                                <tr>
                                    <th>ID OC</th>
                                    <th>Fecha de Orden</th>
                                    <th>Glosa</th>
                                    <th>Codigo Moneda</th>
                                    <th>Codigo Pais Origen</th>
                                    <th>Estado</th>
                                    <th>Proveedor</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                            RN_OrdenCompra ordencompra = new RN_OrdenCompra();
                                            List li = ordencompra.ListarOrdenCompra();
                                            Iterator itr = li.iterator();
                                            while (itr.hasNext()) {
                                                OrdenDeCompra oc = (OrdenDeCompra) itr.next();
                                %>
                                <tr>

                                    <td><div align="center"><%=oc.getOcId()%></div></td>
                                    <td><div align="center"><%=oc.getOcFecha()%></div></td>
                                    <td><div align="center"><%=oc.getOcGlosa()%></div></td>
                                    <td><div align="center"><%=oc.getOcMonedacod()%></div></td>
                                    <td><div align="center"><%=oc.getOcPorigencod()%></div></td>
                                    <td><div align="center"><%=oc.getOcEstado()%></div></td>
                                    <td><div align="center"><%=oc.getProveedor().getProvNombre()%></div></td>
                                    <td><div align="center"><%=oc.getTotalgralOc()%></div></td>
                                </tr>
                                <%
                                            }
                                %>
                            </tbody>
                        </table>

                    </div>
                    <!-- pestaña 2-->
                    <div class="TabbedPanelsContent">
                        <form id="formu_ad" name="formu_ad" method="post" action="item_orden_compra.jsp">
                            <div id="plantilla_ingreso">
                                <fieldset>
                                    <b><legend>Nueva Orden de Compra</legend></b>
                                    <table>
                                        <tr>
                                            <td style="width:210px;font: 14px calibri;background-color:#ea4c4c;"><b>::Datos Requeridos </b></td><td style="width:25%;font: 14px calibri;background-color:#dc7878"><b>::Ingresar </b></td><td style="width:25%;font: 14px calibri;background-color:#ea4c4c;"><b>::Datos Requeridos</b></td><td style="width:25%;font: 14px calibri;background-color:#dc7878;"><b>::Datos Requeridos</b></td>

                                        </tr>
                                        <tr>
                                            <td style="width:25%;border:1px solid #eee;"><br/><label>Numero de Orden de Compra</label><br/><br/><label>Proveedor</label><br/><br/><label>Glosa</label><br/><br/><br/><br/><br/><br/><br/></td>
                                            <td style="width:140px;border:1px solid #eee;">
                                                <input type="text" name="numero_oc" class="required" size="30" value="<%=ordencompra.ObtieneCorrelativoOrdenCompra()%>" readonly="readonly" autocomplete="off" /><br/><br/>                                                
                                                <select name="agregar_emp_rut" class="required">
                                                    <option value="" id="sel_prov">Seleccionar Proveedor</option>
                                                    <%

                                                                RN_Proveedor proveedor = new RN_Proveedor();
                                                                List li1 = proveedor.ListarProveedor();
                                                                Iterator it1 = li1.iterator();
                                                                while (it1.hasNext()) {
                                                                    Proveedor p1 = (Proveedor) it1.next();
                                                                    out.println("<option value='" + p1.getProvRut() + "'>");
                                                                    out.println(p1.getProvNombre());
                                                                    out.println("</option>");
                                                                }
                                                    %>

                                                    <br/>
                                                </select><br/><br/>
                                                <textarea name="glosa_oc" cols="23" rows="3" class="required"></textarea><br/><br/><br/><br/>
                                            </td>
                                            <td style="width:25%;border:1px solid #eee;"><br/><label>Moneda Local</label><br/><br/><label>Origen del Producto</label><br/><br/><label>Informacion de Orden de Compra</label><br/><br/><br/><br/><br/><br/><br/></td>
                                            <td style="width:140px;border:1px solid #eee;">
                                                <select name="moneda_oc" style="width:210px;font:13px calibri;">
                                                    <option VALUE ="1">PESO</option>
                                                    <option VALUE ="4">BOLIVIANO</option>
                                                    <option VALUE ="5">CRUZEIRO REAL</option>
                                                    <option VALUE ="6">DOLAR CAN</option>
                                                    <option VALUE ="13" selected="selected">DOLAR USA</option>
                                                    <option VALUE ="23">GUARANI</option>
                                                    <option VALUE ="24">NUEVO SOL</option>
                                                    <option VALUE ="26">PESO URUG</option>
                                                    <option VALUE ="30">MARCO AL</option>
                                                    <option VALUE ="36">DOLAR AUST</option>
                                                    <option VALUE ="37">CHELIN</option>
                                                    <option VALUE ="40">FRANCO BEL</option>
                                                    <option VALUE ="48">RENMINBI</option>
                                                    <option VALUE ="51">CORONA DIN</option>
                                                    <option VALUE ="53">PESETA</option>
                                                    <option VALUE ="57">MARCO FIN</option>
                                                    <option VALUE ="58">FRANCO FR</option>
                                                    <option VALUE ="64">FLORIN</option>
                                                    <option VALUE ="71">LIRA</option>
                                                    <option VALUE ="72">YEN</option>
                                                    <option VALUE ="82">FRANCO SZ</option>
                                                    <option VALUE ="96">CORONA NOR</option>
                                                    <option VALUE ="97">DOLAR NZ</option>
                                                    <option VALUE ="102">LIBRA EST</option>
                                                    <option VALUE ="113">CORONA SC</option>
                                                    <option VALUE ="127">DOLAR HK</option>
                                                    <option VALUE ="128">RAND</option>
                                                    <option VALUE ="129">PESO COL</option>
                                                    <option VALUE ="130">SUCRE</option>
                                                    <option VALUE ="131">DRACMA</option>
                                                    <option VALUE ="132">PESO MEX</option>
                                                    <option VALUE ="133">ESCUDO</option>
                                                    <option VALUE ="134">BOLIVAR</option>
                                                    <option VALUE ="135">DINAR</option>
                                                    <option VALUE ="136">DOLAR SIN</option>
                                                    <option VALUE ="137">RUPIA</option>
                                                    <option VALUE ="138">DOLAR TAI</option>
                                                    <option VALUE ="139">DIRHAM</option>
                                                    <option VALUE ="142">EURO</option>
                                                    <option VALUE ="301">WON</option>
                                                    <option VALUE ="302">SCHILLING AUSTRIACO</option>
                                                    <option VALUE ="303">MARKKA</option>
                                                    <option VALUE ="304">BALBOA</option>
                                                    <option VALUE ="305">PESO FILIPINO</option>
                                                    <option VALUE ="306">COLON</option>
                                                    <option VALUE ="307">QUETZAL</option>
                                                    <option VALUE ="308">LEV</option>
                                                    <option VALUE ="309">BAHT</option>
                                                    <option VALUE ="310">LEU</option>
                                                    <option VALUE ="311">LIRA TURCA</option>
                                                    <option VALUE ="312">PESO CUBANO</option>
                                                    <option VALUE ="313">RUPIA CINGALESA</option>
                                                    <option VALUE ="314">RINGGIT</option>
                                                    <option VALUE ="315">PESO LAS BAHAMAS</option>
                                                    <option VALUE ="316">ZLOTY</option>
                                                    <option VALUE ="317">LIBRA</option>
                                                    <option VALUE ="318">FORINT</option>
                                                    <option VALUE ="320">RUPIA</option>
                                                    <option VALUE ="321">ZIMBAWE</option>
                                                    <option VALUE ="322">RIAL</option>
                                                    <option VALUE ="323">FRANCO</option>
                                                    <option VALUE ="324">RYAL</option>
                                                    <option VALUE ="325">LIBRA IRLANDA</option>
                                                    <option VALUE ="326">CORONA ISLANDIA</option>
                                                    <option VALUE ="327">CORONA CHECA</option>
                                                    <option VALUE ="328">RUBLO</option>
                                                    <option VALUE ="329">DINAR YUGOESLAVO</option>
                                                    <option VALUE ="900">OTRAS MONEDAS</option>
                                                    <option VALUE ="901">ECU</option>
                                                </select><br/><br/>
                                                <select name="pais_origen_oc" style="width:210px;font:13px calibri;">
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
                                                    <option value ="338">HONG-KONG REGION</option>
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
                                                </select><br/><br/>
                                                <textarea name="inf_oc" class="required" cols="23" rows="3"></textarea><br/><br/><br/><br/>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                                <input id="btn" type="submit" value="[Generar Nueva Orden de Compra]" style="width:230px;margin-left:550px;font:15px calibri;"/>&nbsp;&nbsp;<input type="reset" id="" value=" [ Limpiar ] " style="width:70px;font:15px calibri;" />
                            </div>
                        </form>
                    </div>

                </div>    <br/><div style="margin-left:45%;font:20px calibri;color:#fff;"><a href="inicio.jsp"><b>Volver</b></a></div><br/><br/>
     
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