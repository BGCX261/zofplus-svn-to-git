
<%-- 
    Document   : agregar_101
    Created on : 23-mar-2012, 21:25:18
    Author     : pio
--%>

<%@ page import="connection.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.text.SimpleDateFormat" %>

 <%
   
    /* Recibir ID de la orden de compra */
 
    Connection con = ConnectionCreator.getPostgresConnection();

    String sql ="";
    Statement stmt = con.createStatement();
    sql = "SELECT * FROM orden_de_compra";
    ResultSet rset = stmt.executeQuery(sql);
    String oc_id="";
    Date oc_fecha;
   
    
    //Para luego modificar fecha
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
    //java.util.Date perFnacimiento = sdf.parse(request.getParameter("agregar_cli_fnac"));
    //Fin modificar fecha
    String oc_glosa="";
    String oc_infadicional="";
    String oc_monedacod="";
    String oc_poringedcod="";
    String oc_estado="";
    String prov_rut="";      
%>
 <script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
 <link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
 <table width="100%" border="1" cellspacing="1" cellpadding="1">
  <tr>
    <th scope="col">Correlativo</th>
    <th scope="col">Fecha</th>
    <th scope="col">Estado</th>
    <th scope="col">Proveedor</th>
    <th scope="col">Glosa</th>
  </tr>
  <%
        while (rset.next())
	{
        out.print("<tr>");
        out.print("<td>");
        oc_id = rset.getString("oc_id");
        prov_rut =rset.getString("prov_rut");
        out.print(oc_id);
        out.print("</td>");
        out.print("<td>");
        out.print(prov_rut);
        out.print("</td>");
        out.print("</tr>");
        }
        con.close();
        %>

</table>
<p>&nbsp;</p>
<div class="centro">
  <div id="TabbedPanels1" class="TabbedPanels">
    <ul class="TabbedPanelsTabGroup">
      <li class="TabbedPanelsTab" tabindex="0">Lista 101</li>
      <li class="TabbedPanelsTab" tabindex="0">Crear 101</li>
    </ul>
    <div class="TabbedPanelsContentGroup">
      <div class="TabbedPanelsContent">
        <p>Documento 101 EXT</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </div>
      <div class="TabbedPanelsContent">
        <p><strong>Cabecera 101</strong></p>
        <form id="form_agrega101" name="form_agrega101" method="post" action="paso_ag101ext.jsp">
          <p>&nbsp;</p>
          <table width="35%" height="96" border="1" cellpadding="1" cellspacing="1">
            <tr>
              <td width="42%"><strong>Correlativo</strong></td>
              <td width="5%"><strong>:</strong></td>
              <td width="53%"><label>
                <input type="text" name="id_101" id="id_101" />
              </label></td>
            </tr>
            <tr>
              <td><strong>Fecha</strong></td>
              <td><strong>:</strong></td>
              <td><label>
                <input type="text" name="fecha_101" id="fecha_101" />
              </label></td>
            </tr>
            <tr>
              <td><strong>Numero Provisorio</strong></td>
              <td><strong>:</strong></td>
              <td><label>
                <input type="text" name="nprovisorio_101" id="nprovisorio_101" />
              </label></td>
            </tr>
            <tr>
              <td><strong>Puerto de embarque</strong></td>
              <td><strong>:</strong></td>
              <td><label>
                <input type="text" name="ext_pembarque" id="ext_pembarque" />
              </label></td>
            </tr>
            <tr>
              <td><strong>Pais procedencia</strong></td>
              <td><strong>:</strong></td>
              <td><label>
                <input type="text" name="ext_paisprocedencia" id="ext_paisprocedencia" />
              </label></td>
            </tr>
            <tr>
              <td><strong>Clausula</strong></td>
              <td><strong>:</strong></td>
              <td><label>
                <input type="text" name="ext_clausula" id="ext_clausula" />
              </label></td>
            </tr>
            <tr>
              <td><strong>F.O.B.</strong></td>
              <td><strong>:</strong></td>
              <td><label>
                <input type="text" name="ext_fob" id="ext_fob" />
              </label></td>
            </tr>
            <tr>
              <td><strong>FLETE</strong></td>
              <td><strong>:</strong></td>
              <td><label>
                <input type="text" name="ext_flete" id="ext_flete" />
              </label></td>
            </tr>
            <tr>
              <td><strong>SEGURO</strong></td>
              <td><strong>:</strong></td>
              <td><label>
                <input type="text" name="ext_seguro" id="ext_seguro" />
              </label></td>
            </tr>
            <tr>
              <td><strong>CIF</strong></td>
              <td><strong>:</strong></td>
              <td><label>
                <input type="text" name="ext_cif" id="ext_cif" />
              </label></td>
            </tr>
            <tr>
              <td><strong>Transbordo</strong></td>
              <td><strong>:</strong></td>
              <td><label>
                <input type="text" name="ext_transbordo" id="ext_transbordo" />
              </label></td>
            </tr>
            <tr>
              <td><strong>Codigo Medio de Transporte</strong></td>
              <td><strong>:</strong></td>
              <td><label>
                <input type="text" name="ext_mediotranscod" id="ext_mediotranscod" />
              </label></td>
            </tr>
          </table>
          <p>&nbsp;</p>
          <label>
          <input type="submit" name="enviar" id="enviar" value="[Generar Items]" />
          </label>
          <p>&nbsp;</p>
        </form>
        <p>&nbsp;</p>
      </div>
    </div>
  </div>
<h2>
    <center>
    </center>
  </h2>
  <script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
        </script>
