<form id="modificar_proveedor" name="form" method="post" action="paso_proveedor.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion de Proveedor a Modificar</legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="modificar" name="operacion" size="40"/>
                <label>Rut Proveedor</label><br/><input type="text" name="modificar_prov_rut" id="modificar_prov_rut" size="20" autocomplete="off"/><br/>
                <label>Nombre</label><br/><input type="text" name="modificar_prov_nombre" id="modificar_prov_nombre" size="30" autocomplete="off"/><br/>
                <label>Direccion</label><br/><input type="text" name="modificar_prov_direccion" id="modificar_prov_direccion" size="30" autocomplete="off"/><br/>
                <label>Ciudad</label><br/><input type="text" name="modificar_prov_ciudad" id="modificar_prov_ciudad" size="20" autocomplete="off"/><br/>
                <label>Email</label><br/><input type="text" name="modificar_prov_email" id="modificar_prov_email" size="20" autocomplete="off"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;color:#b01414;" value="Modificar"/>
  </form>
