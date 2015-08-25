

package RN;
import java.util.Date;
import java.util.List;
import persistencia.BD_OrdenCompra;

/**
 *
 * @author pio
 */
public class RN_OrdenCompra {
    
    /* Atributos Orden de Compra */
    private String ocId;
    private Date ocFecha;
    private String ocGlosa;
    private String ocInfadicional;
    private String ocMonedacod;
    private String ocPorigencod;
    private String provRut;
    private Double totalgralOc;

    BD_OrdenCompra bdordencompra = new BD_OrdenCompra();
    
    
    
    
   /*              CONSTRUCTORES               */
    public RN_OrdenCompra() {
    }

    public RN_OrdenCompra(String ocId) {
        // Datos Orden de Compra
       this.ocId = ocId;
    }

    public RN_OrdenCompra(String ocId,Double totalgralOc) {
       this.ocId = ocId;       
       this.totalgralOc = totalgralOc;
    }

     public RN_OrdenCompra(String ocId, Date ocFecha, String ocGlosa, String ocInfadicional, String ocMonedacod, String ocPorigencod, String provRut){
      // Datos Orden de Compra
       this.ocId = ocId;
       this.ocFecha = ocFecha;
       this.ocGlosa = ocGlosa;
       this.ocInfadicional = ocInfadicional;
       this.ocMonedacod = ocMonedacod;
       this.ocPorigencod = ocPorigencod;
       this.provRut = provRut;       
    }
/*              FIN CONSTRUCTORES               */
 

/*              METODOS                         */
    public String AgregarCabeceraOrdenCompra() {
        if (bdordencompra.AgregarCabeceraOrdenCompra(ocId, ocFecha, ocGlosa, ocInfadicional, ocMonedacod, ocPorigencod, provRut)){
            return "Familia Agregada Exitosamente";
        }
        return "Familia No Se Pudo Agregar";
    }

    public Long ObtieneCorrelativoOrdenCompra() {
        return bdordencompra.ObtieneCorrelativoOrdenCompra();
    }

    public boolean AgregarTotalGeneralOrdenCompra() {
        return bdordencompra.AgregarTotalGeneralOrdenCompra(ocId, totalgralOc);
    }

    public List ListarOrdenCompra() {
        List loc = null;
        loc = bdordencompra.ListarOrdenCompra();
        return loc;
    }

public List ObtenerOrdendeCompra() {
        List loc = null;
        loc = bdordencompra.ObtenerOrdendeCompra(this.ocId);
        return loc;
    }

}
