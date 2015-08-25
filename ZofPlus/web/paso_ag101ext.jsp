<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="connection.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.swing.*"%>

<%
        String id_101 = request.getParameter("id_101");
        String fecha_101 = request.getParameter("fecha_101");
        String nprovisorio_101 = request.getParameter("nprovisorio_101");
        String ext_pembarque = request.getParameter("ext_pembarque");
        String ext_paisprocedencia  = request.getParameter("ext_paisprocedencia");
        String ext_clausula  = request.getParameter("ext_clausula");
        String ext_fob  = request.getParameter("ext_fob");
        String ext_flete  = request.getParameter("ext_flete");
        String ext_cif  = request.getParameter("ext_cif");
        String ext_transbordo  = request.getParameter("ext_transbordo");
        String ext_mediotranscod  = request.getParameter("ext_mediotranscod");
 
        /* Guardar datos en la base de datos y dirigirse
        agregar_101extdetalle.jsp? enviando ID del documento 101 */
        
%>