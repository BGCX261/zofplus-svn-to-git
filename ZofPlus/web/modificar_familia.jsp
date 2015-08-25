<form id="modificar_familia" name="form" method="post" action="paso_familia.jsp">
       <div id="plantilla" style="margin-left:100px;margin-top:50px;font:15px calibri;">
            <b><legend>Informacion de Familia a Modificar</legend></b>
            <br/><br/><br/>
            <table cellpadding="20" style="font: 14px calibri;">
                <tr>
                <input type="hidden" value="modificar" name="operacion" size="40"/>
                <label>Id Familia</label><br/><input type="text" name="modificar_fam_id" id ="modificar_fam_id" size="40" autocomplete="off"/><br/>
                <label>Nombre Familia</label><br/><input type="text" name="modificar_fam_nombre" id ="modificar_fam_nombre" size="40" autocomplete="off"/><br/>
                <label>Descripcion Familia</label><br/><input type="text" name="modificar_fam_descripcion" id="modificar_fam_descripcion" size="40" autocomplete="off"/><br/>
                </tr>
                </table>
       </div>
    <br/><input type="submit" style="margin-left:350px;color:#b01414;" value="Modificar"/>
  </form>