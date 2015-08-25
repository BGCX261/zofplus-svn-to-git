<%@page import = "RN.RN_Familia" %>
<%
RN_Familia famcorr = new RN_Familia();
Long correlativo = famcorr.ObtenerCorrelativoFamilia();
%>


<form id="agregar_familia" name="form" method="post" action="paso_familia.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion de Familia a Agregar</legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="agregar" name="operacion" size="40"/>
                <label>Id Familia</label><br/><input type="text" name="agregar_fam_id" class ="required" readonly="readonly" size="20" value="<%=correlativo%>" autocomplete="off"/><br/>
                <label>Nombre Familia</label><br/><input type="text" name="agregar_fam_nombre" class="required" size="30" autocomplete="off"/><br/>
                <label>Descripcion Familia</label><br/><input type="text" name="agregar_fam_descripcion" class="required" size="30" autocomplete="off"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;color:#b01414;" value="Agregar"/>
  </form>