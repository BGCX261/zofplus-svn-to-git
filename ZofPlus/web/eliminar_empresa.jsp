<form id="eliminar_empresa" name="form" method="post" action="paso_empresa.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion de Empresa a Eliminar</legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="eliminar" name="operacion" size="40"/>
                <label>Rut Empresa</label><br/><input type="text" name="eliminar_emp_rut" id="eliminar_emp_rut" size="40" class="required"/><br/>
                <label>Nombre Fantasia</label><br/><input type="text" name="eliminar_emp_nfantasia" id="eliminar_emp_nfantasia" size="40"/><br/>
                <label>Razon Social</label><br/><input type="text" name="eliminar_emp_rsocial" id="eliminar_emp_rsocial" size="40"/><br/>
                <label>Giro Comercial</label><br/><input type="text" name="eliminar_emp_gcomercial" id="eliminar_emp_gcomercial" size="40"/><br/>
                <label>Direccion</label><br/><input type="text" name="eliminar_emp_direccion" id="eliminar_emp_direccion" size="40"/><br/>
                <label>Ciudad</label><br/><input type="text" name="eliminar_emp_ciudad" id="eliminar_emp_ciudad" size="40"/><br/>
                <label>Telefono</label><br/><input type="text" name="eliminar_emp_fono" id="eliminar_emp_fono" size="40"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;" value=" [ Eliminar ] "/>
  </form>