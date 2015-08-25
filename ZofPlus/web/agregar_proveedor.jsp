<form id="agregar_proveedor" name="form" method="post" action="paso_proveedor.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion de Proveedor a Agregar</legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="agregar" name="operacion" size="40"/>
                <label>Rut Proveedor</label><br/><input type="text" name="agregar_prov_rut" class ="required" size="20" autocomplete="off"/><br/>
                <label>Nombre</label><br/><input type="text" name="agregar_prov_nombre" class="required" size="30" autocomplete="off"/><br/>
                <label>Direccion</label><br/><input type="text" name="agregar_prov_direccion" class="required" size="30" autocomplete="off"/><br/>
                <label>Ciudad</label><br/><input type="text" name="agregar_prov_ciudad" class ="required" size="20" autocomplete="off"/><br/>
                <label>Email</label><br/><input type="text" name="agregar_prov_email" class ="required" size="20" autocomplete="off"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;color:#b01414;" value="Agregar"/>
  </form>