<form id="form" name="form" method="post" action="paso_empresa.jsp">
      <div id="plantilla" style="margin-left:100px;margin-top:20px;font:15px calibri;">
            <b><legend>Informacion de Empresa a Modificar</legend></b>
            <br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="modificar" name="operacion" size="40"/>
                <label>Rut Empresa</label><br/><input type="text" name="modificar_emp_rut" id="modificar_emp_rut" size="30" class="required digits"/><br/>
                <label>Nombre Fantasia</label><br/><input type="text" name="modificar_emp_nfantasia" id="modificar_emp_nfantasia" size="40" class="required" autocomplete="off"/><br/>
                <label>Razon Social</label><br/><input type="text" name="modificar_emp_rsocial" id="modificar_emp_rsocial" size="40" autocomplete="off"/><br/>
                <label>Giro Comercial</label><br/><input type="text" name="modificar_emp_gcomercial" id="modificar_emp_gcomercial" size="40" autocomplete="off"/><br/>
                <label>Direccion</label><br/><input type="text" name="modificar_emp_direccion" id="modificar_emp_direccion" size="40" autocomplete="off"/><br/>
                <label>Ciudad</label><br/><input type="text" name="modificar_emp_ciudad" id="modificar_emp_ciudad" size="40" autocomplete="off"/><br/>
                <label>Telefono</label><br/><input type="text" name="modificar_emp_fono" id="modificar_emp_fono" size="40" autocomplete="off"/><br/>
                <label>Representante Legal</label><br/><input type="text" name="modificar_emp_replegal"  id="modificar_emp_replegal" size="15" autocomplete="off"/><br/>
                <label>Nombre Representante</label><br/><input type="text" name="modificar_emp_nomreplegal" id="modificar_emp_nomreplegal" size="45" autocomplete="off"/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;" value=" [ Modificar ] "/>
  </form>