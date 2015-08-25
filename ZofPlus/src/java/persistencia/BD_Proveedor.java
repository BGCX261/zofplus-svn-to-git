/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package persistencia;
import mapeo.Proveedor;
import org.hibernate.Transaction;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import java.util.HashMap;

/**
 *
 * @author Tebi
 */
public class BD_Proveedor {
    Session session = null;
    Transaction tx;
    Proveedor p= new Proveedor();

public boolean AgregarProveedor(String provRut, String provNombre, String provDireccion, String provCiudad, String provEmail) {
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    p.setProvRut(provRut);
    p.setProvNombre(provNombre);
    p.setProvDireccion(provDireccion);
    p.setProvCiudad(provCiudad);
    p.setProvEmail(provEmail);
    p.setProvEstado("H");
    session.save(p);
    tx.commit();
    session.close();
    return true;
}

public List ListarProveedor() {
List<Proveedor> lista = null;
    try {
        this.session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Proveedor WHERE provEstado='H'");
            lista = (List<Proveedor>) q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
}

public HashMap ListarProveedorDeshabilitada() {
HashMap  map= new HashMap();
Proveedor pp;
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        Query query = session.createQuery("FROM Proveedor WHERE provEstado ='D'");
        //query.l
        List<Proveedor> listaResultados = query.list();
        for (int i = 0; i < listaResultados.size(); i++) {
            pp = (Proveedor)listaResultados.get(i);
            map.put(pp.getProvRut(), pp);
            }
session.close();

return map;

}
public boolean BorrarProveedor(String provrut){
            session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            p.setProvRut(provrut);
            session.delete(p);
            tx.commit();
            session.close();
            return true;
     }

public boolean DeshabilitarProveedor(String provRut, String provNombre, String provDireccion, String provCiudad, String provEmail) {
            session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
                p.setProvRut(provRut);
                p.setProvNombre(provNombre);
                p.setProvDireccion(provDireccion);
                p.setProvCiudad(provCiudad);
                p.setProvEmail(provEmail);
                p.setProvEstado("H");
            session.saveOrUpdate(p);
            tx.commit();
            session.close();
            return true;
     }





public boolean ModificarProveedor(String provRut, String provNombre, String provDireccion, String provCiudad, String provEmail) {
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
                p.setProvRut(provRut);
                p.setProvNombre(provNombre);
                p.setProvDireccion(provDireccion);
                p.setProvCiudad(provCiudad);
                p.setProvEmail(provEmail);
                p.setProvEstado("H");
    session.saveOrUpdate(p);
    tx.commit();
    session.close();
    return true;
}

}
