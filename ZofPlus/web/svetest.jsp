<%-- 
    Document   : svetest
    Created on : 19-03-2012, 08:24:56 PM
    Author     : Tebi
--%>
<%@ page import = "RN.Session"%>

<%

Session sessionsve = new Session(); //creo el objeto de tipo familia
String salida = sessionsve.IniciarSesionSVE();





%>


    
        <%-- start web service invocation --%><hr/>
    <%/*
    try {
	persistencia.SesionService service = new persistencia.SesionService();
	persistencia.Sesion port = service.getSesionSoapPort();
	 // TODO initialize WS operation arguments here
	persistencia.Login parameters = new  persistencia.Login(w);
	javax.xml.ws.Holder<java.lang.String> token = null;
	javax.xml.ws.Holder<persistencia.Respuesta> respuesta = null;
	javax.xml.ws.Holder<persistencia.LoginResponse> parameters0 = null;
	port.login(parameters, token, respuesta, parameters0);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }*/
    %>
    <%-- end web service invocation --%><hr/>
<%=salida%>