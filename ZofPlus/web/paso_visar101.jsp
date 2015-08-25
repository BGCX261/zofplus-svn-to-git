<%@ page import = "RN.ControladorSVE"%>
<%
//RESCATAMOS QUE TIPO DE OPERACION SE VA A HACER
String id101ext = request.getParameter("id101ext");
String id101rdp = request.getParameter("id101rdp");
String id101ozf = request.getParameter("id101ozf");
String salida = "";
Long numeroprovisorio = Long.valueOf("0");
//creo el objeto de tipo ControladorSVE encargado de controlar que WS consumir y cosas
ControladorSVE controladorsve = new ControladorSVE();
%>

101 EXT es:<%=id101ext %><br><br>
101 RDP es:<%=id101rdp %><br><br>
101 OZF es:<%=id101ozf %><br><br>

<% 

if (id101ext.equals("0") && (id101rdp.equals("0") ) )
    {
    out.println("Los 2 son 0");

    }
%>

<br><br>


<%
////////CONDICIO PARA QUE SEPA QUE HAY UN VALOR EN EL ID101RDP
if (id101rdp.compareTo("0") != 0 )
    {
    salida = controladorsve.Visar101RDP(id101rdp);
//    numeroprovisorio = controladorsve.ObtenerNumeroProvisorio();
    }
////////CONDICIO PARA QUE SEPA QUE HAY UN VALOR EN EL ID101RDP
if (id101ext.compareTo("0") != 0 )
    {
    salida = controladorsve.Visar101EXT(id101ext);
    numeroprovisorio = controladorsve.ObtenerNumeroProvisorio();
    }
if (id101ozf.compareTo("0") != 0 )
    {
    //salida = controladorsve.Visar101EXT(id101ext);
    //numeroprovisorio = controladorsve.ObtenerNumeroProvisorio();
    }


%>
Salida de Visar 101RDP es <%=salida %>

Numero Provisorio es <%=numeroprovisorio %>
