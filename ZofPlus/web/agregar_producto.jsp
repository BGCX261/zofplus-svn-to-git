<%@page import = "RN.RN_Familia" %>
<%@page import = "java.util.HashMap" %>
<%@page import = "java.util.Collection" %>
<%@page import = "java.util.Iterator" %>
<%@page import = "mapeo.Familia" %>
<%@page import = "java.util.List" %>

<form id="agregar_producto" name="form" method="post" action="paso_producto.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion Producto </legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="agregar" name="operacion" size="40"/>
                <label>Codigo Producto</label><br/><input type="text" name="agregar_prod_codigo" class="required digits" size="40" autocomplete="off"/><br/>
                <label>Familia</label><br/>
                <select name="agregar_fam_id" class="required">
                <option value="">Seleccionar Familia</option>
                <%

                                RN_Familia familia= new RN_Familia();
                                List li1 = familia.ListarFamilia();
                                Iterator it1 = li1.iterator();
                                while (it1.hasNext()) {
                                    Familia f1 = (Familia) it1.next();
                                    out.println("<option value='" + f1.getFamId() + "'>");
                                    out.println(f1.getFamNombre());
                                    out.println("</option>");
                                }
                    %>

                <br/>
                </select><br/>
                <label>Nombre</label><br/><input type="text" name="agregar_pro_nombre" class="required" size="40" autocomplete="off" maxlength="20"/><br/>
                <label>Descripcion</label><br/><input type="text" name="agregar_pro_descripcion" class="required" size="40" autocomplete="off"/><br/>
                <label>Cantidad</label><br/><input type="text" name="agregar_pro_cantidad" class="required digits" min="1" size="40" autocomplete="off" /><br/>
                <label>CIF Unitario</label><br/><input type="text" name="agregar_pro_cifuni" class="required number" autocomplete="off" min="1" size="40"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;" value="Agregar"/>
  </form>