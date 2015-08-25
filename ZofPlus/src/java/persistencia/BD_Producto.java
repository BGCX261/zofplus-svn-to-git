/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package persistencia;
import mapeo.Producto;
import mapeo.Familia;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;
import java.util.List;

/**
 *
 * @author Tebi
 */
public class BD_Producto {
    Session session = null;
    Transaction tx;
    Producto p= new Producto();
    Familia f= new Familia();


public boolean AgregarProducto(String prodCodigo, String famId, String proNombre, String proDescripcion, Long proCantidad, Double proCifuni) {
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    Familia fam = (Familia)session.get(Familia.class,Long.valueOf(famId));
    p.setProdCodigo(prodCodigo);
    p.setFamilia(fam);
    p.setProNombre(proNombre);
    p.setProDescripcion(proDescripcion);
    p.setProCantidad(proCantidad);
    p.setProCifuni(proCifuni);
    session.save(p);
    tx.commit();
    session.close();
    return true;
}

public List ListarProducto() {
    List<Producto> lista = null;
    try {
        this.session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Producto");
            lista = (List<Producto>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

public boolean ModificarProducto(String prodCodigo, String famId, String proNombre, String proDescripcion, Long proCantidad, Double proCifuni) {
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    Familia fam = (Familia)session.get(Familia.class,Long.valueOf(famId));
    p.setProdCodigo(prodCodigo);
    p.setFamilia(fam);
    p.setProNombre(proNombre);
    p.setProDescripcion(proDescripcion);
    p.setProCantidad(proCantidad);
    p.setProCifuni(proCifuni);
    session.saveOrUpdate(p);
    tx.commit();
    session.close();
    return true;
}




}