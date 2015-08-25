/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package persistencia;
import mapeo.Item;
import mapeo.Producto;
import mapeo.OrdenDeCompra;
import mapeo.NotaDeVenta;
import org.hibernate.Transaction;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Tebi
 */
public class BD_Item {
    Session session = null;
    Transaction tx;
    Item i= new Item();
    int iditem=1;



public boolean AgregarItemCompra(int itmNumero, String prodCodigo, Double itmCantidad, Double itmCifunivta, Double itmCiftotal, String ocID) {
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    Query query = session.createQuery("select max(itmNumero) from Item");
    List listaResultados = query.list();
    if(listaResultados.get(0)==null) { iditem=1; }
    else { iditem = ((Integer)listaResultados.get(0))+1; }

    Producto pro = (Producto)session.get(Producto.class,prodCodigo);
    OrdenDeCompra oc = (OrdenDeCompra)session.get(OrdenDeCompra.class,Long.valueOf(ocID));
    //i.setItmNumero(itmNumero);
    i.setItmNumero(iditem);
    i.setProducto(pro);
    i.setItmCantidad(itmCantidad);
    i.setItmCifunivta(itmCifunivta);
    i.setItmCiftotal(itmCiftotal);
    i.setOrdenDeCompra(oc);
    session.saveOrUpdate(i);
    tx.commit();
    session.close();
    return true;
}

public List ListarItemOc() {
List<Item> lista = null;
    try {
        this.session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Item where oc_id='2'"); 
            lista = (List<Item>) q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
}


public List ObtenerItemSegunOC(String ocID) {
List<Item> lista = null;
    try {
        this.session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Item WHERE oc_id='"+ocID+"'");
            lista = (List<Item>) q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
}



public boolean AgregarItemVenta(int itmNumero, String prodCodigo, Double itmCantidad, Double itmCifunivta, Double itmCiftotal, String ocID) {
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    Query query = session.createQuery("select max(itmNumero) from Item");
    List listaResultados = query.list();
    if(listaResultados.get(0)==null) { iditem=1; }
    else { iditem = ((Integer)listaResultados.get(0))+1; }

    Producto pro = (Producto)session.get(Producto.class,prodCodigo);
    NotaDeVenta nv = (NotaDeVenta)session.get(NotaDeVenta.class,Long.valueOf(ocID));
    //i.setItmNumero(itmNumero);
    i.setItmNumero(iditem);
    i.setProducto(pro);
    i.setItmCantidad(itmCantidad);
    i.setItmCifunivta(itmCifunivta);
    i.setItmCiftotal(itmCiftotal);
    i.setNotaDeVenta(nv);
    session.saveOrUpdate(i);
    tx.commit();
    session.close();
    return true;
}


}

