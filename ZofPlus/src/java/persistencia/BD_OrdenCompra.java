package persistencia;
import org.hibernate.Query;
import java.util.*;

import mapeo.Proveedor;
import mapeo.OrdenDeCompra;


import mapeo.Trabajador;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class BD_OrdenCompra {    
    Session session = null;
    Transaction tx;   
    OrdenDeCompra oc = new OrdenDeCompra();
    Proveedor prov = new Proveedor();
    Long idtemporal;

public boolean AgregarCabeceraOrdenCompra(String ocId, Date ocFecha, String ocGlosa, String ocInfadicional, String ocMonedacod, String ocPorigencod, String provRut){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    
    //creacion objeto proveedor
    prov.setProvRut(provRut);
    
    //set datos cabecera orden de compra
    oc.setOcId(Long.valueOf(ocId));

    oc.setOcFecha(ocFecha);
    oc.setOcGlosa(ocGlosa);
    oc.setOcInfadicional(ocInfadicional);
    oc.setOcMonedacod(ocMonedacod);
    oc.setOcPorigencod(ocPorigencod);
    oc.setProveedor(prov);
    oc.setTotalgralOc(Double.valueOf("0"));
    oc.setOcEstado("E");

    
    //session.save(oc);
    session.saveOrUpdate(oc);
    tx.commit();
    session.close();

    return true;
}


public List ListarOrdenCompra(){
    List<OrdenDeCompra> lista = null;
    try {
        this.session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from OrdenDeCompra");
            lista = (List<OrdenDeCompra>) q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

public Long ObtieneCorrelativoOrdenCompra(){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();    
    Query query = session.createQuery("select max(ocId) from OrdenDeCompra");
    List listaResultados = query.list();
    if(listaResultados.get(0)==null) { idtemporal=Long.valueOf("1"); }
    else { idtemporal = ((Long)listaResultados.get(0))+1; }
    return idtemporal;
}

public List ObtenerOrdendeCompra(String ocId){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    Query query = session.createQuery("from OrdenDeCompra where ocId='"+ocId+"'");
    List listaResultados = query.list();
    return listaResultados;
    }


public boolean AgregarTotalGeneralOrdenCompra(String ocId,Double totalgralOc)
{
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();   
    OrdenDeCompra oc = (OrdenDeCompra)session.get(OrdenDeCompra.class,Long.valueOf(ocId));        
    oc.setTotalgralOc(totalgralOc);
    session.saveOrUpdate(oc);
    tx.commit();
    session.close();
    return true;
}

}