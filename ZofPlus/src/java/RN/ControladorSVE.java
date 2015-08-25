/*
 Autor Tebi
 */
package RN;
import persistencia.BD_101;
import mapeo.Ext101;
import mapeo.Rdp101;
import java.util.*;
/**
 *
 * @author Tebi
 */
public class ControladorSVE {

    
    
    
    /*                  ATRIBUTOS PARA CONSUMIR EL WS LOGIN*/
    private SesionSVE.SesionService service = new SesionSVE.SesionService();
    private SesionSVE.Sesion port = service.getSesionSoapPort();
    private SesionSVE.Login parameters = new SesionSVE.Login();
    private String claveSVE = "26VeUnJp"; //ACA EL USUARIO DEBERIA DE PONER SUS DATOS EN MI CASO LOS QUE ME DIERON esteban.miranda
    private String usuarioSVE = "esteban.miranda"; //esteban.miranda
    private SesionSVE.RutEO ruteo = new SesionSVE.RutEO();
    private String digitoverificadorSVE = "2";
    private long rutSVE = 80000009;
    private javax.xml.ws.Holder<java.lang.String> token = new javax.xml.ws.Holder<java.lang.String>();
    private javax.xml.ws.Holder<SesionSVE.Respuesta> respuesta = new javax.xml.ws.Holder<SesionSVE.Respuesta>();
    private javax.xml.ws.Holder<SesionSVE.LoginResponse> parameters0 = null;
    private String tokentemporal = "";
    private String xmlvisar = "";

    /*ATRIBUTOS CONSUMIR EL WEBSERVICES PROCESAR DOCUMENTO*/
    private ProcesarSVE.ProcesarDocumentoService servicevisar = new ProcesarSVE.ProcesarDocumentoService();
    private ProcesarSVE.ProcesarDocumento portvisar = servicevisar.getProcesarDocumentoSoapPort();
    private ProcesarSVE.VisarDocumento parametersvisar = new ProcesarSVE.VisarDocumento();
    private javax.xml.ws.Holder<ProcesarSVE.Respuesta> respuestavisar = new javax.xml.ws.Holder<ProcesarSVE.Respuesta>();
    private javax.xml.ws.Holder<ProcesarSVE.VisarDocumentoResponse> parameters0visar = new javax.xml.ws.Holder<ProcesarSVE.VisarDocumentoResponse>();
    private ProcesarSVE.RespuestaImportacionEO respuestaimportacion = new ProcesarSVE.RespuestaImportacionEO();
    private ProcesarSVE.RespuestaVisacionEO respuestavisacion = new ProcesarSVE.RespuestaVisacionEO();
    private List<ProcesarSVE.RespuestaVisacionEO> lista = new ArrayList<ProcesarSVE.RespuestaVisacionEO>();
    

    /*ATRIBUTOS PARA LA PERSISTENCIA*/
    BD_101 bd101 = new BD_101();


    public String IniciarSesionSVE() {
        this.parameters.setUsuario(this.usuarioSVE);
        this.parameters.setClave(this.claveSVE);
        this.ruteo.setNro(this.rutSVE);
        this.ruteo.setDv(this.digitoverificadorSVE);
        this.parameters.setRutEmpresa(this.ruteo);
        this.parameters.setRutAgencia(this.ruteo);
        try {
            this.port.login(this.parameters, this.token, this.respuesta, this.parameters0);
            //this.port.login(parameters, token, respuesta, parameters0);
        } catch (Exception ex) {
            return ex.toString();
            // TODO handle custom exceptions here
        }
        String codigorespuesta = respuesta.value.getResCodigo();
        if (codigorespuesta.equals("0"));
        {
            this.tokentemporal = token.value.toString();            
        }

        return respuesta.value.getResCodigo();
    }

    public String CerrarSesionSVE() {
        this.parameters.setUsuario(this.usuarioSVE);
        this.parameters.setClave(this.claveSVE);
        this.ruteo.setNro(this.rutSVE);
        this.ruteo.setDv(this.digitoverificadorSVE);
        this.parameters.setRutEmpresa(this.ruteo);
        this.parameters.setRutAgencia(this.ruteo);
        try {
            this.port.login(this.parameters, this.token, this.respuesta, this.parameters0);
            //this.port.login(parameters, token, respuesta, parameters0);
        } catch (Exception ex) {
            //return ex.toString();
            // TODO handle custom exceptions here
        }
        return token.value.toString();
    }




public Boolean XML101EXT(String id101ext) {
String informacion_adicional="";
String pais_procedencia="";
String pais_origen="";
String glosa="";
String fob="";
String flete="";
String seguro="";
String cif="";
String moneda_codigo="";
String clausula="";

List li = bd101.Devolver101EXT(id101ext);
Iterator it = li.iterator();
                                while (it.hasNext()) {
Ext101 ext101 = (Ext101) it.next();
informacion_adicional = ext101.getCabecera101().getOrdenDeCompra().getOcInfadicional();
pais_procedencia = ext101.getExtPaisproced();
glosa = ext101.getCabecera101().getOrdenDeCompra().getOcGlosa();
fob = ext101.getExtFob().toString();
flete = ext101.getExtFlete().toString();
seguro = ext101.getExtSeguro().toString();
cif = ext101.getExtCif().toString();
moneda_codigo = ext101.getCabecera101().getOrdenDeCompra().getOcMonedacod();
clausula = ext101.getExtClausula();                                }
        this.xmlvisar="<Documents>"  +
                "<Document Domain=\"ZofriSVE\" Type=\"101\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"xsd\\DocIngresoRaiz.xsd\">"+
                "<Signers>"+
                "<Signer>"+
                "<PI Type=\"Rut\"/>"+
                "</Signer>"+
                "</Signers>"+
                "<Content>"+
                "   <sve>"+
                "<documento ID=\"Documento101\" xmlns=\"http://zofri.cl/sve/doc/ingreso\">" +
                "<cabecera>"+
                "<informacion_adicional>"+informacion_adicional+"</informacion_adicional>"+
                "<procedencia_codigo>EXT</procedencia_codigo>"+
                "<region_codigo></region_codigo>"+
                "<pais_codigo>"+pais_procedencia+"</pais_codigo>"+
                "<numero_interno_usuario>1</numero_interno_usuario>"+                
                "<glosa>"+glosa+"</glosa>"+
                "<usuario_rut_numero>"+this.rutSVE+"</usuario_rut_numero>"+
                "<usuario_rut_dv>"+this.digitoverificadorSVE+"</usuario_rut_dv>"+
                "<puerto_embarque_codigo>651</puerto_embarque_codigo>"+
                "<tipo_tramite_codigo>N</tipo_tramite_codigo>"+
                "<ubicacion_destino_codigo>RA-98-009A</ubicacion_destino_codigo>"+
                "<moneda_codigo>"+moneda_codigo+"</moneda_codigo>"+
                "<medio_transporte_codigo>1</medio_transporte_codigo>"+
                "<pais_origen_codigo>"+pais_procedencia+"</pais_origen_codigo>"+
                 "<valor_fob>"+fob+"</valor_fob>"+
                 "<valor_flete>"+flete+"</valor_flete>"+
                 "<valor_seguro>"+seguro+"</valor_seguro>"+
                 "<valor_cif>"+cif+"</valor_cif>"+
                  "<clausula>"+clausula+"</clausula>"+
                  "<transbordo_nacional>N</transbordo_nacional>"+
                  "<transbordo_extranjero>N</transbordo_extranjero>"+
                       "<almacenista_codigo></almacenista_codigo>"+
                       "<ubicacion_zona_primaria></ubicacion_zona_primaria>"+
                       "</cabecera>"+
                           "<documentosadjuntos>"+
                           "<documentoadjunto>"+
                               "<tipo_codigo>ADJ001</tipo_codigo>"+
                               "<numero_documento>FACTURA_001</numero_documento>"+
                               "<fecha_documento>2009-10-28</fecha_documento>"+
                               "<emisor>JUAN PEREZ</emisor>"+
                               "<aduana_origen_codigo></aduana_origen_codigo>"+
                            "</documentoadjunto>"+
                          "</documentosadjuntos>"+
                          "<bultos>"+
                             "<bulto>"+
                                  "<tipo_bulto_codigo>TIP001</tipo_bulto_codigo>"+
                                  "<cantidad_bulto>332</cantidad_bulto>"+
                                  "<peso_bulto>1000</peso_bulto>"+
                                  "<descripcion_bulto>Cajas</descripcion_bulto>"+
                             "</bulto>"+
                          "</bultos>"+
                          "<contenedores>"+
                              "<contenedor>"+
                                   "<contenedor_tipo_codigo>TCON_CONT</contenedor_tipo_codigo>"+
                                   "<contenedor_numero>FIGU1521</contenedor_numero>"+
                               "</contenedor>"+
                               "<contenedor>"+
                                   "<contenedor_tipo_codigo>TCON_CONT</contenedor_tipo_codigo>"+
                                   "<contenedor_numero>XLS2145</contenedor_numero>"+
                               "</contenedor>"+
                           "</contenedores>"+
                           "<detalle>"+
                                    "<item>"+
                                          "<nro_item>1</nro_item>"+
                                          "<codigo_arancelario>48041110</codigo_arancelario>"+
                                          "<cantidad_unidad_medida_arancelaria>1</cantidad_unidad_medida_arancelaria>"+
                                          "<unidad_medida_codigo>10</unidad_medida_codigo>"+
                                          "<unidades_set>0</unidades_set>"+
                                          "<cantidad>120.00</cantidad>"+
                                          "<total_valor_cif>0</total_valor_cif>"+
                                          "<total_valor_ingreso>32.00</total_valor_ingreso>"+
                                          "<descriptores>"+
                                               "<descriptor>"+
                                                     "<descriptor_codigo>1</descriptor_codigo>"+
                                                     "<descriptor_valor>PLIEGOS DE PAPEL</descriptor_valor>"+
                                               "</descriptor>"+
                                               "<descriptor>"+
                                                     "<descriptor_codigo>2</descriptor_codigo>"+
                                                     "<descriptor_valor>POLICOLOR</descriptor_valor>"+
                                               "</descriptor>"+
                                               "<descriptor>"+
                                                     "<descriptor_codigo>3</descriptor_codigo>"+
                                                     "<descriptor_valor>DE REGALO</descriptor_valor>"+
                                               "</descriptor>"+
                                               "<descriptor>"+
                                                     "<descriptor_codigo>4</descriptor_codigo>"+
                                                     "<descriptor_valor>1</descriptor_valor>"+
                                               "</descriptor>"+
                                               "<descriptor>"+
                                                     "<descriptor_codigo>17</descriptor_codigo>"+
                                                     "<descriptor_valor>LIBRERIA</descriptor_valor>"+
                                               "</descriptor>"+
                                               "<descriptor>"+
                                                     "<descriptor_codigo>24</descriptor_codigo>"+
                                                     "<descriptor_valor>T/OCASION</descriptor_valor>"+
                                               "</descriptor>"+
                                          "</descriptores>"+
                                    "</item>"+
                               "</detalle>"+
                         "</documento>"+
                         	"<URI />"+
				"<TmstFirma />"+
				"<Signature xmlns=\"http://www.w3.org/2000/09/xmldsig#\">"+
					"<SignedInfo>"+
               "<CanonicalizationMethod Algorithm=\"http://www.w3.org/TR/2001/REC-xml-c14n-20010315\"/>"+
               "<SignatureMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#rsa-sha1\"/>"+
               "<Reference URI=\"#Documento101\">"+
                  "<DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"/>"+
                  "<DigestValue/>"+
               "</Reference>"+
            "</SignedInfo>"+
					"<SignatureValue />"+
					"<KeyInfo>"+
						"<KeyValue>"+
							"<RSAKeyValue>"+
								"<Modulus />"+
								"<Exponent />"+
							"</RSAKeyValue>"+
						"</KeyValue>"+
						"<X509Data>"+
							"<X509Certificate />"+
						"</X509Data>"+
					"</KeyInfo>"+
				"</Signature>"+
			"</sve>"+
		"</Content>"+
	"</Document>"+
"</Documents>";
     return   true;
}

    public String Visar101EXT(String id101ext) {
        String salida = "";

        if (this.IniciarSesionSVE().equals("0"))
        {

            salida = "puedo continuar";
            this.XML101EXT(id101ext);
            this.parametersvisar.setDocumentoXML(this.xmlvisar);

            this.portvisar.visarDocumento(parametersvisar, token, respuestavisar, parameters0visar);

            if (this.respuestavisar.value.getResCodigo().equals("0"))
            {
           
                this.lista = parameters0visar.value.getReturn().getRespuestasVisacionEO();
                this.AgregarNumeroProvisorio101EXT(id101ext);
            }
        }
        
        return respuestavisar.value.getResMensaje();

    }

/*************************TODOS LOS AGREGAR NUMEROS PROVISORIOS Y OBTENER NUMERO PROVISORIO*/
public Boolean AgregarNumeroProvisorio101EXT(String id101ext) {
        bd101.AgregarNumeroProvisorio101EXT(id101ext, this.lista.get(0).getNumeroProvisorio());
        return true;
    }
public Boolean AgregarNumeroProvisorio101RDP(String id101rdp) {
        bd101.AgregarNumeroProvisorio101RDP(id101rdp, this.lista.get(0).getNumeroProvisorio());
        return true;
    }
public Boolean AgregarNumeroProvisorio101OZF(String id101ozf) {
        bd101.AgregarNumeroProvisorio101OZF(id101ozf, this.lista.get(0).getNumeroProvisorio());
        return true;
    }
 public Long ObtenerNumeroProvisorio() {        
        return this.lista.get(0).getNumeroProvisorio();
    }


/**************************************************************TODO ESTO DEL RDP*************************************************************************************/

public Boolean XML101RDP(String id101rdp) {
String informacion_adicional="";
String region="";
String glosa="";
String monto_operacion="";
String clausula="";

List li = bd101.Devolver101RDP(id101rdp);
Iterator it = li.iterator();
                                while (it.hasNext()) {
Rdp101 rdp101 = (Rdp101) it.next();
informacion_adicional = rdp101.getCabecera101().getOrdenDeCompra().getOcInfadicional();
region = rdp101.getRdpRegioncodigo();
glosa = rdp101.getCabecera101().getOrdenDeCompra().getOcGlosa();
monto_operacion = rdp101.getRdpMontoperacion().toString();
//clausula = ext101.getExtClausula();                               // }
        this.xmlvisar= "<Documents>"  +
                "<Document Domain=\"ZofriSVE\" Type=\"101\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"xsd\\DocIngresoRaiz.xsd\">"+
                "<Signers>"+
                "<Signer>"+
                "<PI Type=\"Rut\"/>"+
                "</Signer>"+
                "</Signers>"+
                "<Content>"+
                "   <sve>"+
                "<documento ID=\"Documento101\" xmlns=\"http://zofri.cl/sve/doc/ingreso\">" +
                "<cabecera>"+
                "<informacion_adicional>"+informacion_adicional+"</informacion_adicional>"+
                "<procedencia_codigo>RDP</procedencia_codigo>"+
                "<region_codigo>"+region+"</region_codigo>"+
                "<numero_interno_usuario>1</numero_interno_usuario>"+
                "<zona_franca_extension_codigo></zona_franca_extension_codigo>"+
                "<zona_franca_exportacion_codigo></zona_franca_exportacion_codigo>"+
                "<zona_franca_otra_codigo></zona_franca_otra_codigo>"+
                "<glosa>"+glosa+"</glosa>" +
                "<usuario_rut_numero>90000009</usuario_rut_numero>"+
                "<usuario_rut_dv>0</usuario_rut_dv>"+
                "<puerto_embarque_codigo></puerto_embarque_codigo>"+
                "<tipo_tramite_codigo>34</tipo_tramite_codigo>"+
                "<ubicacion_destino_codigo>RA-009</ubicacion_destino_codigo>"+
                "<moneda_codigo>200</moneda_codigo>"+
                "<medio_transporte_codigo></medio_transporte_codigo>"+
                "<pais_origen_codigo>33</pais_origen_codigo>"+
                 "<valor_fob>0</valor_fob>"+
                 "<valor_flete>0</valor_flete>"+
                 "<valor_seguro>0</valor_seguro>"+
                 "<valor_cif>0</valor_cif>"+
                  "<monto_operacion>300</monto_operacion>"+
                  "<clausula></clausula>"+
                  "<transbordo_nacional>N</transbordo_nacional>"+
                       "<transbordo_extranjero>N</transbordo_extranjero>"+
                       "<almacenista_codigo></almacenista_codigo>"+
                       "<ubicacion_zona_primaria></ubicacion_zona_primaria>"+
                       "</cabecera>"+
                           "<documentosadjuntos>"+
                           "<documentoadjunto>"+
                               "<tipo_codigo>adj001</tipo_codigo>"+
                               "<numero_documento>3254</numero_documento>"+
                               "<fecha_documento>2011-04-04</fecha_documento>"+
                               "<emisor>aduana</emisor>"+
                            "</documentoadjunto>"+
           "</documentosadjuntos>"+
                          "<bultos>"+
                             "<bulto>"+
                                  "<tipo_bulto_codigo>TIP001</tipo_bulto_codigo>"+
                                  "<cantidad_bulto>332</cantidad_bulto>"+
                                  "<peso_bulto>1000</peso_bulto>"+
                                  "<descripcion_bulto>Cajas</descripcion_bulto>"+
                             "</bulto>"+
                          "</bultos>"+
                          "<contenedores>"+
                              "<contenedor>"+
                                   "<contenedor_tipo_codigo>TCON_CONT</contenedor_tipo_codigo>"+
                                   "<contenedor_numero>FIGU1521</contenedor_numero>"+
                               "</contenedor>"+
                               "<contenedor>"+
                                   "<contenedor_tipo_codigo>TCON_CONT</contenedor_tipo_codigo>"+
                                   "<contenedor_numero>XLS2145</contenedor_numero>"+
                               "</contenedor>"+
                           "</contenedores>"+


                                             "<item>"+
                                            "<nro_item>1</nro_item>"+
                                          "<codigo_arancelario>48041110</codigo_arancelario>"+
                                          "<cantidad_unidad_medida_arancelaria>1</cantidad_unidad_medida_arancelaria>"+
                                          "<unidad_medida_codigo>1</unidad_medida_codigo>"+
                                          "<unidades_set>0</unidades_set>"+
                                          "<cantidad>4</cantidad>"+
                                          "<total_valor_ingreso>4</total_valor_ingreso>"+
                                           "<descriptores>"+
                                          "</descriptores>"+
                                    "</item>"+
                               "</detalle>"+
                         "</documento>"+
                         	"<URI />"+
				"<TmstFirma />"+
				"<Signature xmlns=\"http://www.w3.org/2000/09/xmldsig#\">"+
					"<SignedInfo>"+
               "<CanonicalizationMethod Algorithm=\"http://www.w3.org/TR/2001/REC-xml-c14n-20010315\"/>"+
               "<SignatureMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#rsa-sha1\"/>"+
               "<Reference URI=\"#Documento403\">"+
                  "<DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"/>"+
                  "<DigestValue/>"+
               "</Reference>"+
            "</SignedInfo>"+
					"<SignatureValue />"+
					"<KeyInfo>"+
						"<KeyValue>"+
							"<RSAKeyValue>"+
								"<Modulus />"+
								"<Exponent />"+
							"</RSAKeyValue>"+
						"</KeyValue>"+
						"<X509Data>"+
							"<X509Certificate />"+
						"</X509Data>"+
					"</KeyInfo>"+
				"</Signature>"+
			"</sve>"+
		"</Content>"+
	"</Document>"+
"</Documents>";   
                                }

return   true;
}

public String Visar101RDP(String id101rdp) {
        String salida = "";
        if (this.IniciarSesionSVE().equals("0"))
        {

            salida = "puedo continuar";
            this.XML101RDP(id101rdp);
            this.parametersvisar.setDocumentoXML(this.xmlvisar);

            this.portvisar.visarDocumento(parametersvisar, token, respuestavisar, parameters0visar);

            if (this.respuestavisar.value.getResCodigo().equals("0"))
            {

                this.lista = parameters0visar.value.getReturn().getRespuestasVisacionEO();
                //this.AgregarNumeroProvisorio101EXT(id101ext);
            }
        }

        return respuestavisar.value.getResMensaje();

    }





public String DevuelveXMLRDP(String id101rdp) {
        this.XML101RDP(id101rdp);
        return this.xmlvisar;
}

}


