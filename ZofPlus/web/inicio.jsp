<%@page contentType="text/html; charset=iso-8859-1" session="true" language="java" import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Sistema Administrativo Zofplus</title>
<link rel="StyleSheet" type="text/css" href="estilo_maqueta_i.css"></link>
<link rel="StyleSheet" type="text/css" href="estilo_iconos.css"></link>
<link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />

<script src="JS/jquery126.js"></script>
<script type="text/javascript" src="jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="http://indicador.eof.cl/js"></script>
</head>
<body style="margin: 0pt; padding: 0pt; height: 100%;">
    <div id="indicadores">
        UF <script type="text/javascript">indicadorEOF(6);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
        Dolar Observado <script type="text/javascript">indicadorEOF(8);</script>&nbsp;&nbsp;&nbsp;&nbsp;  |
        Euro <script type="text/javascript">indicadorEOF(9);</script>
    </div>
    <div id="contenedor">
        <div id="img1"><a href="nuevo_101.jsp"><img src="img/documento.png" /></a><br/>Generar 101</div>
        <div id="img2"><a href="nuevo_201.jsp"><img src="img/documento.png" /></a><br/>Generar 201</div>
        <div id="img3"><a href="nuevo_203.jsp"><img src="img/documento.png" /></a><br/>Generar 203</div>
        <div id="img4"><a href="nueva_orden_compra.jsp"><img src="img/documento.png" /></a><br/>Orden de Compra</div>
        <div id="img5"><a href="nueva_nota_venta.jsp"><img src="img/documento.png" /></a><br/>Nota de Venta</div>
        
        <!-- manejo administrador visar-->

        <div id="img6"><a href="visar101.jsp"><img src="img/webservice.png" /></a><br/>Enviar a Visar Documento 101</div>
        <!--<div id="img15"><a href="consultar101sve.jsp"><img src="img/webservice.png" /></a><br/>Consultar estado Documento 101</div>-->
        <div id="img14"><a href="http://sve-piloto.zofri.cl/KNA/webZofri/InvokePattern.jsp"><img src="img/webservice.png" /></a><br/>Visualizar a web SVE</div>

        

        



        <div id="img7"><a href="galpon.jsp"><img src="img/galpon.png" /></a><br/>Galpon</div>
        <div id="img8"><a href="empresa.jsp"><img src="img/empresa.png" /></a><br/>Empresa</div>
        <div id="img9"><a href="producto.jsp"><img src="img/producto.png" /></a><br/>Producto</div>
        <div id="img10"><a href="familia.jsp"><img src="img/familia_2.png" /></a><br/>Familia</div>
        <div id="img11"><a href="trabajador.jsp"><img src="img/trabajadores.png" /></a><br/>Trabajador</div>
        <div id="img12"><a href="cliente.jsp"><img src="img/clientes.png" /></a><br/>Cliente</div>
        <div id="img13"><a href="proveedor.jsp"><img src="img/proveedor.png" /></a><br/>Proveedor</div>

        <div id="pie">
             <a href="inicio.jsp">Inicio</a> &nbsp;&nbsp;&nbsp;&nbsp;  | &nbsp;&nbsp;&nbsp;&nbsp; Ayuda &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Servicios &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Empresas &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Contacto &nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp; Fax
        </div>
    </div>
</body>
</html>
