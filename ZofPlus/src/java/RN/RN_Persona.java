/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package RN;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import persistencia.BD_Persona;


/**
 *
 * @author Pio
 */
public class RN_Persona {
    
    /* Atributos de Persona */
     private String perRut;
     private String perNombre;
     private String perApellido;
     private String perDireccion;
     private String perFono;
     private String perEmail;

     private Date perFnacimiento= new Date();
     

    /* Atributos del cliente */
     private Date fecha_registro = new Date();
     private String usuarioZonafr;

     /*Atributos del trabajador*/
     private String areaTrabajo;
     private Date fechaContrato;
     private String pass;

     
     BD_Persona bdpersona = new BD_Persona();
     

public RN_Persona() {
    }
/* Constructor Cliente */
     public RN_Persona (String perRut, String perNombre, String perApellido, String perDireccion, String perFono, String perEmail, Date perFnacimiento, Date fecha_registro, String usuarioZonafr){
      this.perRut = perRut;
      this.perNombre = perNombre;
      this.perApellido = perApellido;
      this.perDireccion = perDireccion;
      this.perFono = perFono;
      this.perEmail = perEmail;
      this.perFnacimiento = perFnacimiento;
      //Datos Clientes
      this.fecha_registro = fecha_registro;
      this.usuarioZonafr = usuarioZonafr;      
    }
/*Constructor Trabajador*/
     public RN_Persona (String perRut, String perNombre, String perApellido, String perDireccion, String perFono, String perEmail, Date perFnacimiento, String areaTrabajo,String pass ){
      this.perRut = perRut;
      this.perNombre = perNombre;
      this.perApellido = perApellido;
      this.perDireccion = perDireccion;
      this.perFono = perFono;
      this.perEmail = perEmail;
      this.perFnacimiento = perFnacimiento;
      //Datos Trabajador
      this.areaTrabajo = areaTrabajo;
      this.pass = pass;
    }



/* Constructor Persona*/
public RN_Persona(String perRut){
        this.perRut=perRut;
    }


 /*********************Metodos*********************/
public String AgregarCliente() throws ParseException{
     if(bdpersona.AgregarCliente(perRut, perNombre, perApellido, perDireccion, perFono, perEmail, perFnacimiento, fecha_registro, usuarioZonafr))
            return "Cliente Agregado Exitosamente";
        return "Cliente No Se Pudo Agregar";
    }

public List ListarCliente() {
        List lcli = null;
        lcli = bdpersona.ListarCliente();
        return lcli;
    }

    public String EliminarCliente(String perRut) {
        if (bdpersona.EliminarCliente(perRut)) {
            return "Cliente Eliminado Exitosamente de la Base de Datos";
        }
        return "Cliente No Se Pudo Eliminar de la Base de Datos";
    }

public String ModificarCliente(){
     if(bdpersona.ModificarCliente(perRut, perNombre, perApellido, perDireccion, perFono, perEmail, perFnacimiento, fecha_registro,usuarioZonafr))
            return "Cliente Modificado Exitosamente";
        return "Cliente No se Pudo Modificar";
    }
/*
public String DeshabilitarCliente(){
     if(bdpersona.DeshabilitarCliente(perRut, perNombre, perApellido, perDireccion, perFono, perEmail, perFnacimiento, fecha_registro,usuarioZonafr))
            return "Cliente Eliminado Exitosamente";
        return "Cliente No se Pudo Eliminar";
    }
*/

public String AgregarTrabajador(){
     if(bdpersona.AgregarTrabajador(perRut,  perNombre, perApellido, perDireccion, perFono, perEmail, perFnacimiento, areaTrabajo,pass ))
            return "Trabajador Agregado exitosamente";
        return "Trabajador no se pudo Agregar";
    }

public List ListarTrabajador(){
        List ltra = null;
        ltra = bdpersona.ListarTrabajador();
        return ltra;
     }
public String EliminarTrabajador(String perRut) {
        if (bdpersona.EliminarTrabajador(perRut)) {
            return "Trabajador Eliminado Exitosamente de la Base de Datos";
        }
        return "Trabajador No Se Pudo Eliminar de la Base de Datos";
    }


public String ModificarTrabajador(){
     if(bdpersona.ModificarCliente(perRut, perNombre, perApellido, perDireccion, perFono, perEmail, perFnacimiento, fecha_registro, usuarioZonafr))
            return "Trabajador Modificado Exitosamente";
        return "Trabajador No se Pudo Modificar";
    }
}
