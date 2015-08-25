<form id="agregar_empresa" name="form" method="post" action="paso_empresa.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:20px;font:15px calibri;">
            <b><legend>Informacion Empresa </legend></b>
            <br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="agregar" name="operacion" size="40"/>
                <label>Rut Empresa</label><br/><input type="text" name="agregar_emp_rut" class ="required rut" size="20" autocomplete="off"/><br/>
                <label>Nombre Fantasia</label><br/><input type="text" name="agregar_emp_nfantasia" class="required" size="30" autocomplete="off"/><br/>
                <label>Razon Social</label><br/><input type="text" name="agregar_emp_rsocial" class="required" size="40" autocomplete="off"/><br/>
                <label>Giro Comercial</label><br/><input type="text" name="agregar_emp_gcomercial" class="required" size="40" autocomplete="off"/><br/>
                <label>Direccion</label><br/><input type="text" name="agregar_emp_direccion" class="required" size="40" autocomplete="off"/><br/>
                <label>Ciudad</label><br/><input type="text" name="agregar_emp_ciudad" class="required" size="40" autocomplete="off"/><br/>
                <label>Telefono</label><br/><input type="text" name="agregar_emp_fono" class="required" size="20" autocomplete="off"/><br/>
                <label>Rut Representante Legal</label><br/><input type="text" name="agregar_emp_replegal" class="required" size="15" autocomplete="off"/><br/>
                <label>Nombre Representante</label><br/><input type="text" name="agregar_emp_nomreplegal" class="required" size="45" autocomplete="off"/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;" id="boton_agregar" value=" [ Agregar ] "/>
  </form>