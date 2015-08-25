<%@page import = "RN.RN_Empresa" %>
<%@page import = "java.util.HashMap" %>
<%@page import = "java.util.Collection" %>
<%@page import = "java.util.Iterator" %>
<%@page import = "mapeo.Empresa" %>
<%@page import = "java.util.List" %>

<form id="eliminar_galpon" name="form" method="post" action="paso_galpon.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion Galpon a Eliminar </legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="eliminar" name="operacion" size="40"/>
                <label>ID Galpon</label><br/><input type="text" name="eliminar_gal_id" id="eliminar_gal_id" class="required digits" autocomplete="off" size="40"/><br/>
                <label>Empresa</label><br/>
                <select name="eliminar_emp_rut" id="eliminar_emp_rut" class="required" onmouseover="this.disabled=true;" onmouseout="this.disabled=false;" >
                <%

                                RN_Empresa empresa3= new RN_Empresa();
                                List li3 = empresa3.ListarEmpresa();
                                Iterator it3 = li3.iterator();
                                while (it3.hasNext()) {
                                    Empresa e3 = (Empresa) it3.next();
                                    out.println("<option value='" + e3.getEmpRut() + "'>");
                                    out.println(e3.getEmpNfantasia());
                                    out.println("</option>");
                                }
                    %>

                <br/>
                </select><br/>
                <label>Recinto Galpon</label><br/><input type="text" name="eliminar_gal_recinto" id="eliminar_gal_recinto" class="required" autocomplete="off" size="40"/><br/>
                <label>Manzana Galpon</label><br/><input type="text" name="eliminar_gal_manzana" id="eliminar_gal_manzana" class="required" autocomplete="off" size="40"/><br/>
                <label>Descripcion Galpon</label><br/><input type="text" name="eliminar_gal_descripcion" id="eliminar_gal_descripcion" class="required" autocomplete="off" size="40"/><br/>
                <label>Fono Galpon</label><br/><input type="text" name="eliminar_gal_fono" id="eliminar_gal_fono" class="required digits" autocomplete="off" size="40"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;" value="Eliminar"/>
  </form>