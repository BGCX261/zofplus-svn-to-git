<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin t&iacute;tulo</title>
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">Cabecera</li>
    <li class="TabbedPanelsTab" tabindex="0">Item</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">
      <p>Aca va formulario de cabecera</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </div>
    <div class="TabbedPanelsContent">
      <p><strong>Documento Adjunto</strong></p>
      <form id="form_agregardocadjunto" name="form_agregardocadjunto" method="post" action="paso_documentoadjunto.jsp">
        <table width="31%" border="1" cellspacing="1" cellpadding="1">
          <tr>
            <td width="37%">Folio</td>
            <td width="63%"><label>
              <input type="text" name="dad_id" id="dad_id" />
            </label></td>
          </tr>
          <tr>
            <td>Folio 101</td>
            <td><label>
              <input type="text" name="id_101" id="id_101" />
            </label></td>
          </tr>
          <tr>
            <td>Tipo</td>
            <td><label>
              <input type="text" name="dad_tipo" id="dad_tipo" />
            </label></td>
          </tr>
          <tr>
            <td>Fecha</td>
            <td><label>
              <input type="text" name="dad_fecha" id="dad_fecha" />
            </label></td>
          </tr>
          <tr>
            <td>Emisor</td>
            <td><label>
              <input type="text" name="dad_emisor" id="dad_emisor" />
            </label></td>
          </tr>
          <tr>
            <td>Aduana</td>
            <td><label>
              <input type="text" name="dad_aduana" id="dad_aduana" />
            </label></td>
          </tr>
        </table>
        <p>&nbsp;</p>
        <p>
          <label>
          <input type="submit" name="enviar" id="enviar" value="Adjuntar Documento" />
          </label>
        </p>
        <p>&nbsp;</p>
      </form>
      <p></p>
      <p></p>
      <p></p>
      <p></p>
      <p></p>
    </div>
	
  </div>
</div>
<script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
</script>
</body>
</html>
