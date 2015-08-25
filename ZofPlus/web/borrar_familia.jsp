<%@ page import = "RN.RN_Familia"%>

<%
RN_Familia familia;
familia = new RN_Familia("kaka");

out.println("nose"+familia.BorrarDatos("kaka"));
%>