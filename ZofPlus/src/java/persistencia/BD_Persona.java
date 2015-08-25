package persistencia;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import mapeo.Persona;
import mapeo.Cliente;
import mapeo.Trabajador;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;

public class BD_Persona {
    //Familia  new Empresa();
    Session session = null;
    Transaction tx;   
    Persona p= new Persona();
    Cliente c= new Cliente();
    Trabajador t= new Trabajador();
public boolean AgregarCliente(String perRut, String perNombre, String perApellido, String perDireccion, String perFono, String perEmail, Date perFnacimiento, Date fecha_registro, String usuarioZonafr) throws ParseException{
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();    
    //set datos persona    
    p.setPerRut(perRut);
    p.setPerNombre(perNombre);
    p.setPerApellido(perApellido);
    p.setPerDireccion(perDireccion);
    p.setPerFono(perFono);
    p.setPerEmail(perEmail);
    p.setPerFnacimiento(perFnacimiento);
    //set datos cliente
    c.setPerRut(perRut);  
    c.setPersona(p);
    c.setFechaRegistro(fecha_registro);
    c.setUsuarioZonafr(usuarioZonafr);
    session.saveOrUpdate(p);
    session.saveOrUpdate(c);
    tx.commit();
    session.close();
    return true;
}


public List ListarCliente(){
    List<Cliente> lista = null;
    try {
        this.session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Cliente");
            lista = (List<Cliente>) q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

public boolean EliminarCliente(String perRut){
            session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            c.setPerRut(perRut);
            session.delete(c);
            tx.commit();
            session.close();
            return true;
     }


public boolean ModificarCliente(String perRut, String perNombre, String perApellido, String perDireccion, String perFono, String perEmail, Date perFnacimiento, Date fecha_registro, String usuarioZonafr){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    //set datos persona
    p.setPerRut(perRut);
    p.setPerNombre(perNombre);
    p.setPerApellido(perApellido);
    p.setPerDireccion(perDireccion);
    p.setPerFono(perFono);
    p.setPerEmail(perEmail);
    p.setPerFnacimiento(perFnacimiento);
    //set datos cliente
    c.setPerRut(perRut);
    c.setPersona(p);
    c.setFechaRegistro(fecha_registro);
    c.setUsuarioZonafr(usuarioZonafr);
    session.saveOrUpdate(p);
    session.saveOrUpdate(c);
    tx.commit();
    session.close();
    return true;
}


public boolean AgregarTrabajador(String perRut, String perNombre, String perApellido, String perDireccion, String perFono, String perEmail, Date perFnacimiento, String areaTrabajo,String pass ){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    //set datos persona
    p.setPerRut(perRut);
    p.setPerNombre(perNombre);
    p.setPerApellido(perApellido);
    p.setPerDireccion(perDireccion);
    //set datos trabajador
    t.setAreaTrabajo(areaTrabajo);
    t.setPass(pass);
    t.setFechaContrato(new Date());
    t.setPersona(p);

    session.saveOrUpdate(p);
    session.saveOrUpdate(t);
    tx.commit();
    session.close();
    return true;
}


public List ListarTrabajador(){
    List<Trabajador> lista = null;
    try {
        this.session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Trabajador");
            lista = (List<Trabajador>) q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

public boolean EliminarTrabajador(String perRut){
            session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            t.setPerRut(perRut);
            session.delete(t);
            tx.commit();
            session.close();
            return true;
     }


}