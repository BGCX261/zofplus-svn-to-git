/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package RN;
import persistencia.BD_Proveedor;
import java.util.HashSet;
import java.util.Set;
import java.util.HashMap;
import java.util.List;
/**
 *
 * @author Tebi
 */
public class RN_Proveedor {

private String provRut;
     private String provNombre;
     private String provDireccion;
     private String provCiudad;
     private String provEmail;
     private String provEstado;
     BD_Proveedor bdproveedor = new BD_Proveedor();


/*              CONSTRUCTORES*/
    public RN_Proveedor() {
    }

    public RN_Proveedor(String provRut) {
        this.provRut = provRut;
    }
    public RN_Proveedor(String provRut, String provNombre, String provDireccion, String provCiudad, String provEmail) {
       this.provRut = provRut;
       this.provNombre = provNombre;
       this.provDireccion = provDireccion;
       this.provCiudad = provCiudad;
       this.provEmail = provEmail;       
    }
/*              FIN CONSTRUCTORES*/

/*              METODOS             */

    public String AgregarProveedor() {
        if (bdproveedor.AgregarProveedor(provRut, provNombre, provDireccion,  provCiudad, provEmail)) {
            return "Proveedor Agregado Exitosamente";
        }
        return "Proveedor no se Pudo Agregar";
    }

    public List ListarProveedor() {
        List lgal = null;
        lgal = bdproveedor.ListarProveedor();
        return lgal;
    }
    
    public HashMap ListarProveedorDeshabilitada() {
        HashMap lprov = null;
        lprov = bdproveedor.ListarProveedorDeshabilitada();
        return lprov;
    }

    public String BorrarProveedor(String provRut) {
        if (bdproveedor.BorrarProveedor(provRut)) {
            return "Proveedor Eliminado Exitosamente de la Base de Datos";
        }
        return "Proveedor No Se Pudo Eliminar de la Base de Datos";
    }

    public String DeshabilitarProveedor() {
        if (bdproveedor.DeshabilitarProveedor(provRut, provNombre, provDireccion,  provCiudad, provEmail)) {
            return "Proveedor Eliminado Exitosamente";
        }
        return "Proveedor No Se Pudo Eliminar";
    }

    public String ModificarProveedor() {
        if (bdproveedor.ModificarProveedor(provRut, provNombre, provDireccion,  provCiudad, provEmail)) {
            return "Proveedor Modificada Exitosamente";
        }
        return "Proveedor No se Pudo Modificar";
    }

    public String getProvRut() {
        return this.provRut;
    }
    public void setProvRut(String provRut) {
        this.provRut = provRut;
    }

    public String getProvNombre() {
        return this.provNombre;
    }
    public void setProvNombre(String provNombre) {
        this.provNombre = provNombre;
    }

    public String getProvDireccion() {
        return this.provDireccion;
    }
    public void setProvDireccion(String provDireccion) {
        this.provDireccion = provDireccion;
    }

    public String getProvCiudad() {
        return this.provCiudad;
    }
    public void setProvCiudad(String provCiudad) {
        this.provCiudad = provCiudad;
    }

    public String getProvEmail() {
        return this.provCiudad;
    }
    public void setProvEmail(String provEmail) {
        this.provEmail = provEmail;
    }

    public String getProvEstado() {
        return this.provEstado;
    }

    public void setProvEstado(String provEstado) {
        this.provEstado = provEstado;
    }


    /*              FIN METODOS             */
}
