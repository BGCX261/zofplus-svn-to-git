<form id="modificar_cliente" name="form" method="post" action="paso_cliente.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion de Cliente a Modificar</legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="modificar" name="operacion" size="40"/>
                <label>Rut Cliente</label><br/><input type="text" name="modificar_cli_rut" id="modificar_cli_rut" class ="required" size="40" autocomplete="off"/><br/>
                <label>Usuario Zona Franca</label><br/>
                <select name="modificar_cli_usu" id="modificar_cli_usu" class="required">
                <option value="S">Si</option>
                <option value="N">No</option>
                <br/>
                </select><br/>
                <label>Nombre Cliente</label><br/><input type="text" name="modificar_cli_nombre" id="modificar_cli_nombre" class="required" size="40" autocomplete="off"/><br/>
                <label>Apellido Cliente</label><br/><input type="text" name="modificar_cli_apellido" id="modificar_cli_apellido" class="required" size="40" autocomplete="off"/><br/>
                <label>Direccion Cliente</label><br/><input type="text" name="modificar_cli_direccion" id="modificar_cli_direccion" class="required" size="40" autocomplete="off"/><br/>
                <label>Fono Cliente</label><br/><input type="text" name="modificar_cli_fono" id="modificar_cli_fono" size="40" class="required digits" autocomplete="off"/><br/>
                <label>Mail Cliente</label><br/><input type="text" name="modificar_cli_mail" id="modificar_cli_mail" size="40" class="required email" autocomplete="off"/><br/>
                <label>Fecha de Nacimiento Cliente</label><br/><input type="text" name="modificar_cli_fnac" id="modificar_cli_fnac" size="40" class="required dateISO date-pick" autocomplete="off"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;color:#b01414;" value="Modificar"/>
  </form>