<%@page import = "RN.RN_Item" %>
<%@page import = "mapeo.Item" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.Iterator" %>
<%
RN_Item rnitem = new RN_Item();

List listaitem = rnitem.ObtenerItemSegunOC();

Iterator itritem = listaitem.iterator();
                while (itritem.hasNext()) {
Item item = (Item) itritem.next();

%>

<%=item.getItmNumero()%>
<%=item.getProducto().getProNombre() %>

<%}

                    %>