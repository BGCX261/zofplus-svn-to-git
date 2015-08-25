 
package RN;
import java.text.ParseException;
import java.util.Date;



import mapeo.Cabecera101;

import persistencia.BD_DocumentoAdjunto;


/**
 *
 * @author Pio
 */
public class RN_DocumentoAdjunto {
    
    
     private String dadId;
     private Cabecera101 cabecera101;
     private String dadTipo;
     private Date dadFecha;
     private String dadEmisor;
     private String dadAduana;
     private String id_101;
     private Date perFnacimiento= new Date();

    /* Atributos del cliente */
     private Date fecha_registro = new Date();

     BD_DocumentoAdjunto bddocumentoadjunto = new BD_DocumentoAdjunto();


public RN_DocumentoAdjunto() {
    
}
/* Constructor Documento Adjunto */
     public RN_DocumentoAdjunto (String dadId, String id_101, String dadTipo, Date dadFecha, String dadEmisor, String dadAduana){
     this.dadId=dadId;
     this.id_101=id_101;
     this.dadTipo=dadTipo;
     this.dadFecha=dadFecha;
     this.dadEmisor=dadEmisor;
     this.dadAduana=dadAduana;
    }

/* Constructor DocumentoAdjunto Adjunto*/
public RN_DocumentoAdjunto(String dadId){
        this.dadId=dadId;
    }
    
/*Constructor Documento Adjunto Factura*/


public RN_DocumentoAdjunto (String dadId, String id_101, String dadTipo, Date dadFecha, String dadEmisor){
     this.dadId=dadId;
     this.id_101=id_101;
     this.dadTipo=dadTipo;
     this.dadFecha=dadFecha;
     this.dadEmisor=dadEmisor;
    }



 /*********************Metodos*********************/
public String AgregarDocumentoAdjunto() throws ParseException{
     if(bddocumentoadjunto.AgregarDocumentoAdjunto(dadId, id_101, dadTipo, dadFecha, dadEmisor, dadAduana))
            return "Documento Adjunto Agregado Exitosamente";
        return "Documento Adjunto No Se Pudo Agregar";
    }

public Long ObtenerCorrelativoDocumentoAdjunto(){
     return bddocumentoadjunto.ObtenerCorrelativoDocumentoAdjunto();
    }


public String AgregarFactura() throws ParseException{
     if(bddocumentoadjunto.AgregarFactura(dadId, id_101, dadTipo, dadFecha, dadEmisor))
            return "Factura Agregada Exitosamente";
        return "Factura No Se Pudo Agregar";
    }


}


