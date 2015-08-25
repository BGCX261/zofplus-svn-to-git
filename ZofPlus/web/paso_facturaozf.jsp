<%-- 
    Document   : paso_documentoadjunto
    Created on : 25-mar-2012, 5:36:47
    Author     : pio
--%>
<%@page import = "RN.RN_DocumentoAdjunto" %>
<%@page import = "mapeo.DocumentoAdjunto" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
            java.util.Date utilDate = new java.util.Date();
            java.sql.Date fechaactual = new java.sql.Date(utilDate.getTime());

            String oca101id = request.getParameter("oca101id");
            
            String dadId = request.getParameter("dad_id").toUpperCase();
            String id_101 = request.getParameter("id_101").toUpperCase();
            String dadTipo = request.getParameter("dad_tipo").toUpperCase();

            String dadEmisor = request.getParameter("dad_emisor").toUpperCase();            
            RN_DocumentoAdjunto dadjunto;
            dadjunto = new RN_DocumentoAdjunto(dadId, id_101, dadTipo, fechaactual, dadEmisor);            
            String salida = dadjunto.AgregarFactura();

 %>


        <%
out.print("<META HTTP-EQUIV='Refresh' CONTENT='0;URL=101ozf.jsp?oca101idozf="+oca101id+"&id_101="+id_101+"';>");
%>