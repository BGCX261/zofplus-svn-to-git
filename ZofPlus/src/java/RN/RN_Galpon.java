/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package RN;

import persistencia.BD_Galpon;
import mapeo.Galpon;
import mapeo.Empresa;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author xtian
 */
public class RN_Galpon {

    private int idGalpon;
    private String empRut;
    private String recintoGalpon;
    private String manzanaGalpon;
    private String descripcionGalpon;
    private Integer fonoGalpon;
    BD_Galpon bdgalpon = new BD_Galpon();

    /*              CONSTRUCTORES*/
    public RN_Galpon() {
    }

    public RN_Galpon(int idGalpon, String empRut, String recintoGalpon, String manzanaGalpon, String descripcionGalpon, Integer fonoGalpon) {
        this.idGalpon = idGalpon;
        this.empRut = empRut;
        this.recintoGalpon = recintoGalpon;
        this.manzanaGalpon = manzanaGalpon;
        this.descripcionGalpon = descripcionGalpon;
        this.fonoGalpon = fonoGalpon;
    }

    /*              FIN CONSTRUCTORES*/

    /*              METODOS*/
    public String AgregarGalpon() {
        if (bdgalpon.AgregarGalpon(idGalpon, empRut, recintoGalpon, manzanaGalpon, descripcionGalpon, fonoGalpon)) {
            return "Galpon Agregado Exitosamente";
        }
        return "Galpon no se pudo Agregar";
    }

    public List ListarGalpon() {
        List lgal = null;
        lgal = bdgalpon.ListarGalpon();
        return lgal;
    }
    

    public HashMap ListarGalponDeshabilitado() {
        HashMap lgal = null;
        lgal = bdgalpon.ListarGalponDeshabilitado();
        return lgal;
    }

    public String BorrarGalpon(Integer idGalpon) {
        if (bdgalpon.BorrarGalpon(idGalpon)) {
            return "Galpon Eliminado Exitosamente de la Base de Datos";
        }
        return "Galpon No Se Pudo Eliminar de la Base de Datos";
    }
public String DeshabilitarGalpon() {
    if (bdgalpon.DeshabilitarGalpon(idGalpon, empRut, recintoGalpon, manzanaGalpon, descripcionGalpon, fonoGalpon)) {
    return "Galpon Eliminado Exitosamente";
    }
    return "Galpon No Se Pudo Eliminar";
    }
   

    public String ModificarGalpon() {
        if (bdgalpon.ModificarGalpon(idGalpon, empRut, recintoGalpon, manzanaGalpon, descripcionGalpon, fonoGalpon)) {
            return "Galpon Modificado Exitosamente";
        }
        return "Galpon No se Pudo Modificar";
    }

public Integer ObtenerCorrelativoFamilia() {
    Integer galId = bdgalpon.ObtenerCorrelativoGalpon();
    return galId;
}

    public int getIdGalpon() {
        return this.idGalpon;
    }

    public void setIdGalpon(int idGalpon) {
        this.idGalpon = idGalpon;
    }

    public String getRecintoGalpon() {
        return this.recintoGalpon;
    }

    public void setRecintoGalpon(String recintoGalpon) {
        this.recintoGalpon = recintoGalpon;
    }

    public String getManzanaGalpon() {
        return this.manzanaGalpon;
    }

    public void setManzanaGalpon(String manzanaGalpon) {
        this.manzanaGalpon = manzanaGalpon;
    }

    public String getDescripcionGalpon() {
        return this.descripcionGalpon;
    }

    public void setDescripcionGalpon(String descripcionGalpon) {
        this.descripcionGalpon = descripcionGalpon;
    }

    public Integer getFonoGalpon() {
        return this.fonoGalpon;
    }

    public void setFonoGalpon(Integer fonoGalpon) {
        this.fonoGalpon = fonoGalpon;
    }
    /*              FIN METODOS*/
}
