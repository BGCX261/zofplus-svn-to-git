<%@page import = "RN.RN_Empresa" %>
<%@page import = "java.util.HashMap" %>
<%@page import = "java.util.Collection" %>
<%@page import = "java.util.Iterator" %>
<%@page import = "mapeo.Empresa" %>
<%@page import = "java.util.List" %>

<form id="modificar_galpon" name="form" method="post" action="paso_galpon.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion Galpon a Modificar </legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="modificar" name="operacion" size="40"/>
                <label>ID Galpon</label><br/><input type="text" name="modificar_gal_id" id="modificar_gal_id" class="required digits" autocomplete="off" size="40"/><br/>
                <label>Empresa</label><br/>
                <select name="modificar_emp_rut" id="modificar_emp_rut" class="required">
                <%

                                RN_Empresa empresa2= new RN_Empresa();
                                List li2 = empresa2.ListarEmpresa();
                                Iterator it2 = li2.iterator();
                                while (it2.hasNext()) {
                                    Empresa e2 = (Empresa) it2.next();
                                    out.println("<option value='" + e2.getEmpRut() + "'>");
                                    out.println(e2.getEmpNfantasia());
                                    out.println("</option>");
                                }
                    %>

                <br/>
                </select><br/>
                <label>Recinto Galpon</label><br/><input type="text" name="modificar_gal_recinto" id="modificar_gal_recinto" class="required" autocomplete="off" size="40" maxlength="20"/><br/>
                <label>Manzana Galpon</label><br/><input type="text" name="modificar_gal_manzana" id="modificar_gal_manzana" class="required" autocomplete="off" size="40" maxlength="2"/><br/>
                <label>Descripcion Galpon</label><br/><input type="text" name="modificar_gal_descripcion" id="modificar_gal_descripcion" class="required" autocomplete="off" size="40" maxlength="50"/><br/>
                <label>Fono Galpon</label><br/><input type="text" name="modificar_gal_fono" id="modificar_gal_fono" class="required digits" autocomplete="off" size="40"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:320px;" value=" [ Modificar ] "/>
  </form>