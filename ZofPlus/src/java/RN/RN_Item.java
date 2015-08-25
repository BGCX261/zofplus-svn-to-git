/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package RN;
import persistencia.BD_Item;
import java.util.List;

/**
 *
 * @author Tebi
 */
public class RN_Item {

     private int itmNumero;
     private String prodCodigo;
     private String ocID;
     private Double itmCantidad;
     private Double itmCifunivta;
     private Double itmCiftotal;
     BD_Item bditem = new BD_Item();


/*              CONSTRUCTORES*/
public RN_Item() {
    }
public RN_Item(int itmNumero) {
        this.itmNumero = itmNumero;
    }

public RN_Item(String ocID) {
        this.ocID = ocID;
    }

//PARA LA COMPRA//
public RN_Item(int itmNumero, String prodCodigo, Double itmCantidad, Double itmCifunivta, Double itmCiftotal, String ocID) {
        this.itmNumero = itmNumero;
        this.prodCodigo = prodCodigo;
        this.itmCantidad = itmCantidad;
        this.itmCifunivta = itmCifunivta;
        this.itmCiftotal = itmCiftotal;
        this.ocID = ocID;
    }

/*              FIN CONSTRUCTORES*/
/*              METODOS             */

    public String AgregarItemCompra() {
        if (bditem.AgregarItemCompra(itmNumero, prodCodigo, itmCantidad, itmCifunivta, itmCiftotal, ocID)) {
            return "Item Agregado Exitosamente";
        }
        return "Item no se Pudo Agregar";
    }

    public String AgregarItemVenta() {
        if (bditem.AgregarItemVenta(itmNumero, prodCodigo, itmCantidad, itmCifunivta, itmCiftotal, ocID)) {
            return "Item Agregado Exitosamente";
        }
        return "Item no se Pudo Agregar";
    }



    public List ObtenerItemSegunOC() {
        List litem = null;
        litem = bditem.ObtenerItemSegunOC(this.ocID);
        return litem;
    }


}
