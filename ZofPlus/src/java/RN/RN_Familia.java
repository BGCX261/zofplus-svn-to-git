/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package RN;

import persistencia.BD_Familia;
import java.util.HashMap;
import java.util.List;


/**
 *
 * @author Tebi
 */
public class RN_Familia {

    private String famId;
    private String famNombre;
    private String famDescripcion;
    private Character famEstado;
    BD_Familia bdfamilia = new BD_Familia();

    /*              CONSTRUCTORES               */
    public RN_Familia() {
    }

    public RN_Familia(String famid) {
        this.famId = famid;

    }

    public RN_Familia(String famId, String famNombre, String famDescripcion) {
        this.famId = famId;
        this.famNombre = famNombre;
        this.famDescripcion = famDescripcion;
    }

    public RN_Familia(String famNombre, String famDescripcion) {
        this.famNombre = famNombre;
        this.famDescripcion = famDescripcion;
    }
    /*              FIN CONSTRUCTORES               */


    
    /*              METODOS                         */
    public String AgregarFamilia() {
        if (bdfamilia.AgregarFamilia(famNombre, famDescripcion)) {
            return "Familia Agregada Exitosamente";
        }
        return "Familia No Se Pudo Agregar";
    }

    public List ListarFamilia() {
        List lgal = null;
        lgal = bdfamilia.ListarFamilia();
        return lgal;
    }

public HashMap ListarFamiliaDeshabilitada() {
        HashMap lfam = null;
        lfam = bdfamilia.ListarFamiliaDeshabilitada();
        return lfam;
    }


public String BorrarFamilia(String famId) {
        if (bdfamilia.BorrarFamilia(famId)) {
            return "Familia Eliminada Exitosamente de la Base de Datos";
        }
        return "Familia No Se Pudo Eliminar de la Base de Datos";
    }

public String DeshabilitarFamilia() {
        if (bdfamilia.DeshabilitarFamilia(famId, famNombre, famDescripcion)) {
            return "Familia Eliminada Exitosamente";
        }
        return "Familia No Se Pudo Eliminar";
    }

public String ModificarFamilia() {
        if (bdfamilia.ModificarFamilia(famId, famNombre, famDescripcion)) {
            return "Familia Modificada Exitosamente";
        }
        return "Familia No se Pudo Modificar";
    }

public Long ObtenerCorrelativoFamilia() {
    Long famId = bdfamilia.ObtenerCorrelativoFamilia();
    return famId;
}

public String getFamId() {
        return this.famId;
    }

    public void setFamId(String famId) {
        this.famId = famId;
    }
    public String getFamNombre() {
        return this.famNombre;
    }

    public void setFamNombre(String famNombre) {
        this.famNombre = famNombre;
    }
    public String getFamDescripcion() {
        return this.famDescripcion;
    }

    public void setFamDescripcion(String famDescripcion) {
        this.famDescripcion = famDescripcion;
    }
    public Character getFamEstado() {
        return this.famEstado;
    }

    public void setFamEstado(Character famEstado) {
        this.famEstado = famEstado;
    }


    /*              FIN METODOS             */
}
