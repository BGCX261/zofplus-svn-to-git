<%@ page import = "RN.RN_Empresa"%>

<%
RN_Empresa empresa;
empresa = new RN_Empresa("lapajilla");

out.println("nose"+empresa.BorrarDatos("lapajilla"));
%>