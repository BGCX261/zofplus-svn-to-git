/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package RN;
import java.util.HashSet;
import java.util.Set;
import java.util.List;
import java.util.HashMap;
import org.hibernate.Query;
import java.util.Vector;
import java.math.BigDecimal;
import persistencia.BD_Producto;

/**
 *
 * @author Tebi
 */
public class RN_Producto {

    private String prodCodigo;
    private String idFam;
    private String proNombre;
    private String proDescripcion;
    private Long proCantidad;
    private Double proCifuni;
    BD_Producto bdproducto = new BD_Producto();

    /**********CONSTRUCTORES**********/
    public RN_Producto() {
    }

    public RN_Producto(String prodCodigo) {
        this.prodCodigo = prodCodigo;
    }

    public RN_Producto(String prodCodigo, String idFam, String proNombre, String proDescripcion, Long proCantidad, Double proCifuni) {
        this.prodCodigo = prodCodigo;
        this.idFam = idFam;
        this.proNombre = proNombre;
        this.proDescripcion = proDescripcion;
        this.proCantidad = proCantidad;
        this.proCifuni = proCifuni;
    }




    /**********FIN CONSTRUCTORES**********/
/*              METODOS*/
    public String AgregarProducto() {
            if (bdproducto.AgregarProducto(prodCodigo, idFam, proNombre, proDescripcion, proCantidad, proCifuni)) {
                return "Producto Agregado Exitosamente";
            }
            return "Producto No se pudo Agregar";
        }

     public List ListarProducto() {
            List lgal = null;
            lgal = bdproducto.ListarProducto();
            return lgal;
        }

     public String ModificarProducto() {
        if (bdproducto.ModificarProducto(prodCodigo, idFam, proNombre, proDescripcion, proCantidad, proCifuni)) {
            return "Producto Modificado Exitosamente";
        }
        return "Producto No se Pudo Modificar";
    }

/*    public HashMap ListarProductoDeshabilitado() {
        HashMap lgal = null;
        lgal = bdproducto.ListarProductoDeshabilitado();
        return lgal;
        }

    public String BorrarProducto(String prodCodigo) {
        if (bdproducto.BorrarProducto(prodCodigo)) {
            return "Producto Eliminado Exitosamente de la Base de Datos";
        }
        return "Producto No Se Pudo Eliminar de la Base de Datos";
    }

    public String DeshabilitarProducto() {
        if (bdproducto.DeshabilitarProducto(prodCodigo, idFam, proNombre, proDescripcion, proCantidad, proCifuni)) {
            return "Producto Eliminado Exitosamente";
        }
        return "Producto No Se Pudo Eliminar";
    }

    

  */

public String getProdCodigo() {
        return this.prodCodigo;
    }

    public void setProdCodigo(String prodCodigo) {
        this.prodCodigo = prodCodigo;
    }


    public String getProNombre() {
        return this.proNombre;
    }

    public void setProNombre(String proNombre) {
        this.proNombre = proNombre;
    }
    public String getProDescripcion() {
        return this.proDescripcion;
    }

    public void setProDescripcion(String proDescripcion) {
        this.proDescripcion = proDescripcion;
    }
    public Long getProCantidad() {
        return this.proCantidad;
    }

    public void setProCantidad(Long proCantidad) {
        this.proCantidad = proCantidad;
    }
    public Double getProCifuni() {
        return this.proCifuni;
    }

    public void setProCifuni(Double proCifuni) {
        this.proCifuni = proCifuni;
    }


}

