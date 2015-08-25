
package RN;
import java.util.Set;
import java.util.Date;
import java.util.HashSet;
import java.util.List;



import persistencia.BD_NotaVenta;

/**
 *
 * @author pio
 */
public class RN_NotaVenta {
    
    
    // Atributos Nota de Venta
     private String nvId;
     private String nvGlosa;     
     private String nvCodigomoneda;
     private String nvFormapago;
     private String nvPaisdestino;
     private String nvCiudaddestino;
     private Date nvFecha;
     private String cliRut;
     private Double totalgralNv;

    
    BD_NotaVenta bdnotaventa = new BD_NotaVenta();
    
    
    
   /*              CONSTRUCTORES               */
    public RN_NotaVenta() {
    }

    public RN_NotaVenta(String nvId,Double totalgralNv){
        this.nvId = nvId;
        this.totalgralNv = totalgralNv;
    }


     public RN_NotaVenta(String nvId, Date nvFecha, String nvGlosa, String nvCodigomoneda, String nvFormapago, String nvPaisdestino, String cliRut){
      // Datos Orden de Compra
     this.nvId = nvId;
     this.nvFecha = new Date();
     this.nvGlosa = nvGlosa;
     this.nvCodigomoneda = nvCodigomoneda;
     this.nvFormapago = nvFormapago;
     this.nvPaisdestino = nvPaisdestino;
     this.cliRut = cliRut;
     

    }

 
/*              FIN CONSTRUCTORES               */
 

/*              METODOS                         */
    public String AgregarCabeceraNotaVenta() {
        if (bdnotaventa.AgregarCabeceraNotaVenta(nvId, nvFecha, nvGlosa, nvCodigomoneda,  nvFormapago, nvPaisdestino, cliRut)){
            return "Nota de Venta Agregada Exitosamente";
        }
        return "Nota de Venta No Se Pudo Agregar";
    }

    public long ObtieneCorrelativoNotaVenta() {
        return bdnotaventa.ObtieneCorrelativoNotaVenta();
    }

    public List ListarNotaVenta() {
        List loc = null;
        loc = bdnotaventa.ListarNotaVenta();
        return loc;
    }

    public boolean AgregarTotalGeneralNotaVenta() {
        return bdnotaventa.AgregarTotalGeneralNotaVenta(nvId, totalgralNv);
    }

}
