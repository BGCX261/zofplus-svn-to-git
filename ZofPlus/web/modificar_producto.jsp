<%@page import = "RN.RN_Familia" %>
<%@page import = "java.util.HashMap" %>
<%@page import = "java.util.Collection" %>
<%@page import = "java.util.Iterator" %>
<%@page import = "mapeo.Familia" %>
<%@page import = "java.util.List" %>

<form id="modificar_producto" name="form" method="post" action="paso_producto.jsp">
        <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Modificar Informacion de Producto </legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="modificar" name="operacion" size="40"/>
                <label>Codigo Producto</label><br/><input type="text" name="modificar_prod_codigo" id="modificar_prod_codigo" class="required digits" size="40" autocomplete="off"/><br/>
                <label>Familia</label><br/>
                <select name="modificar_fam_id" id="modificar_fam_id" class="required">
                <option value="">Seleccionar Familia</option>
                <%

                               RN_Familia familia2= new RN_Familia();
                                List li2 = familia2.ListarFamilia();
                                Iterator it2 = li2.iterator();
                                while (it2.hasNext()) {
                                    Familia f2 = (Familia) it2.next();
                                    out.println("<option value='" + f2.getFamId() + "'>");
                                    out.println(f2.getFamNombre());
                                    out.println("</option>");
                                }
                    %>

                <br/>
                </select><br/>
                <label>Nombre</label><br/><input type="text" name="modificar_pro_nombre" id="modificar_pro_nombre" class="required" size="40" autocomplete="off" maxlength="20"/><br/>
                <label>Descripcion</label><br/><input type="text" name="modificar_pro_descripcion" id="modificar_pro_descripcion" class="required" size="40" autocomplete="off"/><br/>
                <label>Cantidad</label><br/><input type="text" name="modificar_pro_cantidad" id="modificar_pro_cantidad" class="required digits" min="1" size="40" autocomplete="off" /><br/>
                <label>CIF Unitario</label><br/><input type="text" name="modificar_pro_cifuni" id="modificar_pro_cifuni" class="required number" autocomplete="off" size="40" min="1"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;" value="[ Modificar ]"/>
  </form>