<%@ page import = "RN.RN_Item"%>


<%
//RESCATAMOS QUE TIPO DE OPERACION SE VA A HACER
            //String operacion = request.getParameter("operacion");
            RN_Item item;
            String salida;


            //Integer total_item = Integer.parseInt(request.getParameter("total_item"));


            /*for (int j = 1; j <= total_item; j++) {
                //out.println(x);
                String item_fac_agr = request.getParameter("item_fac_agr" + j);

                if (item_fac_agr.equals("0")) {
                    ///out.println("BORRADOS SON"+item_fac_agr);
                    /////////NO HACE NADA ESTOS SON LOS QUE BORRO EL CLIENTE
                } else {

                    String prodCodigo = request.getParameter("item_fac_agr" + j);
                    item = new RN_Item(1, prodCodigo);
                    salida = item.AgregarItem();
                    out.println(salida);
                }
            }*/

                    item = new RN_Item(4, "32");
                    salida = item.AgregarItem();
                    out.println(salida);

%>