<%@page import = "RN.RN_Familia" %>
<%@page import = "java.util.HashMap" %>
<%@page import = "java.util.Collection" %>
<%@page import = "java.util.Iterator" %>
<%@page import = "mapeo.Familia" %>
<%@page import = "java.util.List" %>

<form id="eliminar_familia" name="form" method="post" action="paso_producto.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion de Producto a Eliminar </legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="eliminar" name="operacion" size="40"/>
                <label>Codigo Producto</label><br/><input type="text" name="eliminar_prod_codigo" id="eliminar_prod_codigo" class="required digits" size="40" autocomplete="off"/><br/>
                <label>Familia</label><br/>
                <select name="eliminar_fam_id" id="eliminar_fam_id" class="required">
                <option value="">Seleccionar Familia</option>
                <%

                                RN_Familia familia3= new RN_Familia();
                                List li3 = familia3.ListarFamilia();
                                Iterator it3 = li3.iterator();
                                while (it3.hasNext()) {
                                    Familia e3 = (Familia) it3.next();
                                    out.println("<option value='" + e3.getFamId() + "'>");
                                    out.println(e3.getFamNombre());
                                    out.println("</option>");
                                }
                    %>

                <br/>
                </select><br/>
                <label>Nombre</label><br/><input type="text" name="eliminar_pro_nombre" id="eliminar_pro_nombre" class="required" size="40" autocomplete="off" maxlength="20"/><br/>
                <label>Descripcion</label><br/><input type="text" name="eliminar_pro_descripcion" id="eliminar_pro_descripcion" class="required" size="40" autocomplete="off"/><br/>
                <label>Cantidad</label><br/><input type="text" name="eliminar_pro_cantidad" id="eliminar_pro_cantidad" class="required digits" size="40" autocomplete="off" /><br/>
                <label>CIF Unitario</label><br/><input type="text" name="eliminar_pro_cifuni" id="eliminar_pro_cifuni" class="required digits" autocomplete="off" size="40"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;" value="Eliminar"/>
  </form>