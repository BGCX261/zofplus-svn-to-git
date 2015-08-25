
<html>
<head>
<title>Sistema Administrativo ZOFPLUS</title>
<link rel="StyleSheet" type="text/css" href="estilo_index.css"/>
</head>
<body>

    <div id="contenedor" >
      <form id="f_identifica" name="f_identifica" method="post" action="inicio.jsp">
        
            <label for="nombre" >Acceso</label>
            <input type="text" name="usuario" id="usuario" size="13" />
            <label for="clave">Codigo</label>
            <input type="password" name="clave" id="clave" size="8"/>
            <input id="btn" type="submit" value="ACCESO"/>
            <br>
    </form><br><br>
     <div style="text-align:center;background-color:blue;width:450px;color:white;">
     <%
    if(request.getParameter("error")!=null){
        out.println(request.getParameter("error"));
    }
    %>
    </div>
    </div>
<div id="logofondo">
</div>
</body>
</html>