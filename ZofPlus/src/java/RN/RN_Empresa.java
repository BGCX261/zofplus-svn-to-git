/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package RN;

import persistencia.BD_Empresa;
import java.util.HashSet;
import java.util.Set;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author xtian
 */
public class RN_Empresa {

    private String empRut;
    private String empNfantasia;
    private String empRsocial;
    private String empGcomercial;
    private String empDireccion;
    private String empCiudad;
    private String empFono;
    private String empReplegal;
    private String empNomreplegal;
    private String empEstado;
    BD_Empresa bdempresa = new BD_Empresa();
/*              CONSTRUCTORES*/
    public RN_Empresa() {
    }

    public RN_Empresa(String empRut) {
        this.empRut = empRut;
    }

    public RN_Empresa(String empRut, String empNfantasia, String empRsocial, String empGcomercial, String empDireccion, String empCiudad, String empFono, String empReplegal, String empNomreplegal) {
        this.empRut = empRut;
        this.empNfantasia = empNfantasia;
        this.empRsocial = empRsocial;
        this.empGcomercial = empGcomercial;
        this.empDireccion = empDireccion;
        this.empCiudad = empCiudad;
        this.empFono = empFono;
        this.empReplegal = empReplegal;
        this.empNomreplegal = empNomreplegal;

    }
/*              FIN CONSTRUCTORES*/


/*              METODOS             */

    public String AgregarEmpresa() {
        if (bdempresa.AgregarEmpresa(empRut, empNfantasia, empRsocial, empGcomercial, empDireccion, empCiudad, empFono, empReplegal, empNomreplegal)) {
            return "Empresa Agregada Exitosamente";
        }
        return "Empresa no se Pudo Agregar";
    }

    public List ListarEmpresa() {
        List lgal = null;
        lgal = bdempresa.ListarEmpresa();
        return lgal;
    }

    public HashMap ListarEmpresaDeshabilitada() {
        HashMap lemp = null;
        lemp = bdempresa.ListarEmpresaDeshabilitada();
        return lemp;
    }

    public String BorrarEmpresa(String empRut) {
        if (bdempresa.BorrarEmpresa(empRut)) {
            return "Empresa Eliminada Exitosamente de la Base de Datos";
        }
        return "Empresa No Se Pudo Eliminar de la Base de Datos";
    }

    public String DeshabilitarEmpresa() {
        if (bdempresa.DeshabilitarEmpresa(empRut, empNfantasia, empRsocial, empGcomercial, empDireccion, empCiudad, empFono, empReplegal, empNomreplegal)) {
            return "Familia Eliminada Exitosamente";
        }
        return "Familia No Se Pudo Eliminar";
    }

    public String ModificarEmpresa() {
        if (bdempresa.ModificarEmpresa(empRut, empNfantasia, empRsocial, empGcomercial, empDireccion, empCiudad, empFono, empReplegal, empNomreplegal)) {
            return "Empresa Modificada Exitosamente";
        }
        return "Empresa no se Pudo Modificar";
    }


    public String getEmpRut() {
        return this.empRut;
    }

    public void setEmpRut(String empRut) {
        this.empRut = empRut;
    }
    public String getEmpNfantasia() {
        return this.empNfantasia;
    }

    public void setEmpNfantasia(String empNfantasia) {
        this.empNfantasia = empNfantasia;
    }
    public String getEmpRsocial() {
        return this.empRsocial;
    }

    public void setEmpRsocial(String empRsocial) {
        this.empRsocial = empRsocial;
    }
    public String getEmpGcomercial() {
        return this.empGcomercial;
    }

    public void setEmpGcomercial(String empGcomercial) {
        this.empGcomercial = empGcomercial;
    }
    public String getEmpDireccion() {
        return this.empDireccion;
    }

    public void setEmpDireccion(String empDireccion) {
        this.empDireccion = empDireccion;
    }
    public String getEmpCiudad() {
        return this.empCiudad;
    }

    public void setEmpCiudad(String empCiudad) {
        this.empCiudad = empCiudad;
    }
    public String getEmpFono() {
        return this.empFono;
    }

    public void setEmpFono(String empFono) {
        this.empFono = empFono;
    }
    public String getEmpReplegal() {
        return this.empReplegal;
    }

    public void setEmpReplegal(String empReplegal) {
        this.empReplegal = empReplegal;
    }
    public String getEmpNomreplegal() {
        return this.empNomreplegal;
    }

    public void setEmpNomreplegal(String empNomreplegal) {
        this.empNomreplegal = empNomreplegal;
    }
    public String getEmpEstado() {
        return this.empEstado;
    }

    public void setEmpEstado(String empEstado) {
        this.empEstado = empEstado;
    }
 /*             FIN METODOS*/

}
