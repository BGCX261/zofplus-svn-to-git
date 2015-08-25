<%@page import = "RN.RN_Galpon" %>
<%@page import = "RN.RN_Empresa" %>
<%@page import = "java.util.HashMap" %>
<%@page import = "java.util.Collection" %>
<%@page import = "java.util.Iterator" %>
<%@page import = "mapeo.Empresa" %>
<%@page import = "java.util.List" %>

<%
RN_Galpon galpcorr = new RN_Galpon();
int correlativo = galpcorr.ObtenerCorrelativoFamilia();
%>


<form id="agregar_galpon" name="form" method="post" action="paso_galpon.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion de Galpon</legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="agregar" name="operacion" size="40"/>
                <label>ID Galpon</label><br/><input type="text" name="agregar_gal_id" class="required digits" value="<%=correlativo%>" readonly="readonly" size="30" autocomplete="off"/><br/>
                <label>Empresa</label><br/>
                <select name="agregar_emp_rut" class="required">
                <option value="">Seleccionar Empresa</option>
                <%

                                RN_Empresa empresa= new RN_Empresa();
                                List li1 = empresa.ListarEmpresa();
                                Iterator it1 = li1.iterator();
                                while (it1.hasNext()) {
                                    Empresa e1 = (Empresa) it1.next();
                                    out.println("<option value='" + e1.getEmpRut() + "'>");
                                    out.println(e1.getEmpNfantasia());
                                    out.println("</option>");
                                }
                    %>

                <br/>
                </select><br/>
                <label>Recinto Galpon</label><br/><input type="text" name="agregar_gal_recinto" class="required" size="30" autocomplete="off" maxlength="20"/><br/>
                <label>Manzana Galpon</label><br/><input type="text" name="agregar_gal_manzana" class="required" size="30" autocomplete="off" maxlength="2"/><br/>
                <label>Descripcion Galpon</label><br/><input type="text" name="agregar_gal_descripcion" class="required" autocomplete="off" size="32" maxlength="50"/><br/>
                <label>Fono Galpon</label><br/><input type="text" name="agregar_gal_fono" class="required digits" autocomplete="off" size="25"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" id="" style="margin-left:350px;" value=" [ Agregar ] "/>
  </form>