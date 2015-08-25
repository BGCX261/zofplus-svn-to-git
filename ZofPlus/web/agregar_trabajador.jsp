<%@page import = "RN.RN_Empresa" %>
<%@page import = "java.util.Iterator" %>
<%@page import = "mapeo.Empresa" %>
<%@page import = "java.util.List" %>
<form id="agregar_trabajador" name="form" method="post" action="paso_trabajador.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion de Trabajador a Agregar</legend></b>
            <br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="agregar" name="operacion" size="40"/>
                <label>Rut Cliente</label><br/><input type="text" name="agregar_tra_rut" class ="required" size="40" autocomplete="off"/><br/>
                <label>Empresa</label><br/>
                <select name="agregar_tra_rut" class="required">
                <option value="">Seleccionar Empresa</option>
                <%

                                RN_Empresa empresa1= new RN_Empresa();
                                List li1 = empresa1.ListarEmpresa();
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
                <label>Nombre Trabajador</label><br/><input type="text" name="agregar_tra_nombre" class="required" size="40" autocomplete="off"/><br/>
                <label>Apellido Trabajador</label><br/><input type="text" name="agregar_tra_apellido" class="required" size="40" autocomplete="off"/><br/>
                <label>Direccion Trabajador</label><br/><input type="text" name="agregar_tra_Direccion" class="required" size="40" autocomplete="off"/><br/>
                <label>Tipo de Trabajador</label><br/>
                <select name="agregar_tra_tip" class="required">
                <option value="">Seleccionar</option>
                <option value="Administrador">Administrador</option>
                <option value="Bodeguero">Bodeguero</option>
                <option value="Facturador">Facturador</option>
                <option value="Vendedor">Vendedor</option>
                <br/>
                </select><br/>
                <label>Password</label><br/><input name="agregar_tra_pass1" id="agregar_tra_pass1" type="password" size="40" class="required form_text" autocomplete="off" /><br/>
                <label>Confirmar Password</label><br/><input name="agregar_tra_pass2" id="agregar_tra_pass2" type="password" size="40" class="required form_text" autocomplete="off" /><br/>
                <label>Fono Trabajador</label><br/><input type="text" name="agregar_tra_fono" size="40" class="required digits" autocomplete="off"/><br/>
                <label>Mail Trabajador</label><br/><input type="text" name="agregar_tra_mail" size="40" class="required email" autocomplete="off"/><br/>
                <label>Fecha de Nacimiento Trabajador</label><br/><input type="text" name="agregar_cli_fnac" size="40" class="required dateISO" autocomplete="off"/><br/>

                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;color:#b01414;" value="Agregar"/>
  </form>