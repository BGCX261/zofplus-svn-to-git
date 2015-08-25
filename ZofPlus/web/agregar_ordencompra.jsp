<%-- 
    Document   : agregar_ordencompra
    Created on : 17-mar-2012, 23:00:58
    Author     : pio
--%>


       <form id="form_adordencompra" name="form_adordencompra" method="post" action="paso_ordencompra.jsp">

            <div id="plantilla_ingreso">
            <fieldset>
                <b><legend>Cabecera Orden de Compra</legend></b>
                <table>
                <tr>
                    <td style="width:125px;font: 13px calibri;background-color:#BDBDBD;"><b>::Datos Personales </b></td><td style="width:155px;background-color:#BDBDBD"></td><td style="width:125px;font: 13px calibri;background-color:#BDBDBD;"><b>::Datos Especificos </b></td><td style="width:155px;background-color:#BDBDBD;"></td>

                </tr>
                <tr>
                    <td><label>Correlativo</label><br/>
                    <label>Fecha</label><br/>
                    <label>Glosa</label><br/>
                    <label>Informaci&oacute;n Adicionals</label><br/>
                    <label>C&oacute;digo Moneda</label><br/>
                    <label>C&oacute;digo de Pa&iacute;s Origen</label><br/>
                    </td>
                    <td>
                    <input type="text" name="oc_id" size="17"/><br/>
                    <input type="text" name="oc_fecha" size="17"/><br/>
                    <input type="text" name="oc_glosa" size="17"/><br/>
                    <input type="text" name="oc_infadicional" size="17"/><br/>
                    <input type="text" name="oc_monedacod" size="17"/><br/>
                    <input type="text" name="oc_porigencod" size="17"/><br/>
                    </td>
                </tr>
                </table>
            </fieldset>
                <br/><input id="btn" type="submit" value="[ Crear Orden de Compra ]" style="width:180px;margin-left:150px;"/>&nbsp;&nbsp;<input type="reset" value="[ Limpiar ] " style="width:70px" />
            </div>

            </form>
