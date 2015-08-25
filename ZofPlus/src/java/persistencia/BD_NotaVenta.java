package persistencia;


import org.hibernate.Query;
import java.util.*;

import mapeo.Cliente;
import mapeo.NotaDeVenta;



import org.hibernate.Session;
import org.hibernate.Transaction;

public class BD_NotaVenta {    
    Session session = null;
    Transaction tx;   
    NotaDeVenta nv = new NotaDeVenta();
    //Proveedor prov = new Proveedor();
    Long idtemporal;

public boolean AgregarCabeceraNotaVenta(String nvId, Date nvFecha, String nvGlosa, String nvCodigomoneda, String nvFormapago, String nvPaisdestino, String cliRut){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    
    //creacion objeto proveedor
    //prov.setProvRut("1");
    
    //set datos cabecera orden de compra

    nv.setNvId(Long.valueOf(nvId));
    nv.setNvFecha(nvFecha);
    nv.setNvGlosa(nvGlosa);    
    nv.setNvCodigomoneda(nvCodigomoneda);
    nv.setNvFormapago(nvFormapago);
    nv.setNvPaisdestino(nvPaisdestino);
    nv.setCliRut(cliRut);    
    nv.setNvEstado("E");    
    session.save(nv);    
    tx.commit();
    session.close();

    return true;
}


public List ListarNotaVenta(){
    List<NotaDeVenta> lista = null;
    try {
        this.session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from NotaDeVenta");
            lista = (List<NotaDeVenta>) q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

public Long ObtieneCorrelativoNotaVenta(){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    Query query = session.createQuery("select max(nvId) from NotaDeVenta");
    List listaResultados = query.list();
    if(listaResultados.get(0)==null) { idtemporal=Long.valueOf("1"); }
    else { idtemporal = ((Long)listaResultados.get(0))+1; }
    return idtemporal;
}


public boolean AgregarTotalGeneralNotaVenta(String ocId,Double totalgralOc)
{
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    NotaDeVenta nv = (NotaDeVenta)session.get(NotaDeVenta.class,Long.valueOf(ocId));
    nv.setTotalgralNv(totalgralOc);
    session.saveOrUpdate(nv);
    tx.commit();
    session.close();
    return true;
}



}