/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import mapeo.Cabecera101;
import mapeo.Ext101;
import mapeo.Rdp101;
import mapeo.Zfe101;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;
import java.util.Date;
import org.hibernate.Query;
import mapeo.OrdenDeCompra;

/**
 *
 * @author Tebi
 */
public class BD_101 {

    Session session = null;
    Transaction tx;
    Cabecera101 c101 = new Cabecera101();
    Rdp101 rdp101 = new Rdp101();
    Zfe101 zfe101 = new Zfe101();
    Ext101 ext101 = new Ext101();

    public List Listar101() {
        List<Cabecera101> lista = null;
        try {
            this.session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Cabecera101");
            lista = (List<Cabecera101>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public List Listar101EXT() {
        List<Ext101> lista = null;
        try {
            this.session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Ext101");
            lista = (List<Ext101>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public List Devolver101EXT(String id101ext) {
        List<Ext101> lista = null;
        try {
            this.session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Ext101 where id101='" + id101ext + "'");
            lista = (List<Ext101>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }


    public List Devolver101RDP(String id101rdp) {
        List<Rdp101> lista = null;
        try {
            this.session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Rdp101 where id101='" + id101rdp + "'");
            lista = (List<Rdp101>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }


/*********************************TODOS LOS AGREGAR NUMERO PROVISORIO*///////////
    public boolean AgregarNumeroProvisorio101EXT(String id101ext, Long NumeroProvirio) {
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        Ext101 cab101ext = (Ext101) session.get(Ext101.class, Long.valueOf(id101ext));
        cab101ext.setNprovi101(NumeroProvirio.intValue());
        session.saveOrUpdate(cab101ext);
        tx.commit();
        session.close();
        return true;
    }

public boolean AgregarNumeroProvisorio101RDP(String id101rdp, Long NumeroProvirio) {
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        Rdp101 cab101rdp = (Rdp101) session.get(Rdp101.class, Long.valueOf(id101rdp));
        cab101rdp.setNprovi101(NumeroProvirio.intValue());
        session.saveOrUpdate(cab101rdp);
        tx.commit();
        session.close();
        return true;
    }    


public boolean AgregarNumeroProvisorio101OZF(String id101ozf, Long NumeroProvirio) {
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        Rdp101 cab101ozf = (Rdp101) session.get(Rdp101.class, Long.valueOf(id101ozf));
        cab101ozf.setNprovi101(NumeroProvirio.intValue());
        session.saveOrUpdate(cab101ozf);
        tx.commit();
        session.close();
        return true;
    }


/****************************************FIN DE AGREGAR NUMERO PROVISRIO *************************/


    public List ListarRechazados101EXT() {
        List<Ext101> lista = null;
        try {
            this.session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Ext101 nprovi101 <> null");
            lista = (List<Ext101>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public List ListarRechazados101RDP() {
        List<Ext101> lista = null;
        try {
            this.session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Ext101 nprovi101 <> null");
            lista = (List<Ext101>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public Long ObtenerCorrelativo101() {
        long id101;
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        Query query = session.createQuery("select max(id101) from Cabecera101");
        List listaResultados = query.list();
        if (listaResultados.get(0) == null) {
            id101 = Long.valueOf("1");
        } else {
            id101 = ((Long) listaResultados.get(0)) + 1;
        }
        return id101;

    }

    public boolean AgregarCabecera101(String id101, String ocId) {
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        OrdenDeCompra oc = (OrdenDeCompra) session.get(OrdenDeCompra.class, Long.valueOf(ocId));
        c101.setId101(Long.valueOf(id101));
        c101.setOrdenDeCompra(oc);
        c101.setEstado101("E");
        c101.setFecha101(new Date());
        c101.setNprovi101(0);

        session.save(c101);
        tx.commit();
        session.close();
        return true;
    }

    public boolean Agregar101RDP(String id101, String ocId, Double rdpMontoperacion, String rdpRegioncodigo) {
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        OrdenDeCompra oc = (OrdenDeCompra) session.get(OrdenDeCompra.class, Long.valueOf(ocId));
        rdp101.setId101(Long.valueOf(id101));
        rdp101.setOcId(Long.valueOf(ocId));
        rdp101.setFecha101(new Date());
        rdp101.setNprovi101(0);
        rdp101.setRdpMontoperacion(rdpMontoperacion);
        rdp101.setRdpRegioncodigo(rdpRegioncodigo);
        session.saveOrUpdate(rdp101);
        tx.commit();
        session.close();
        return true;
    }

    public boolean Agregar101OZF(String id101, String ocId, Double zfemonto) {
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        OrdenDeCompra oc = (OrdenDeCompra) session.get(OrdenDeCompra.class, Long.valueOf(ocId));
        zfe101.setId101(Long.valueOf(id101));
        zfe101.setOcId(Long.valueOf(ocId));
        zfe101.setFecha101(new Date());
        zfe101.setNprovi101(0);
        zfe101.setZfeMontooperacion(zfemonto);
        session.saveOrUpdate(zfe101);
        tx.commit();
        session.close();
        return true;
    }
    
public List Listar101EXTParaVisar() {
        List<Ext101> lista = null;
        try {
            this.session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Ext101 where nprovi101 = 0");
            lista = (List<Ext101>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

public List Listar101RDPParaVisar() {
        List<Rdp101> lista = null;
        try {
            this.session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Rdp101 where nprovi101 = 0");
            lista = (List<Rdp101>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }



public List Listar101OZFParaVisar() {
        List<Zfe101> lista = null;
        try {
            this.session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Zfe101 where nprovi101 = 0");
            lista = (List<Zfe101>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }


public boolean Agregar101EXT(String id101,String ocId, String extPembarque, String extPaisproced, String extClausula, Double extFob, Double extFlete, Double extSeguro, Double extCif, String extTransext, String extTransnacional, String extMediotranscod2){
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        OrdenDeCompra oc = (OrdenDeCompra) session.get(OrdenDeCompra.class, Long.valueOf(ocId));
        ext101.setId101(Long.valueOf(id101));
        ext101.setOcId(Long.valueOf(ocId));
        ext101.setFecha101(new Date());
        ext101.setNprovi101(0);
        ext101.setExtPembarque(extPembarque);
        ext101.setExtPaisproced(extPaisproced);
        ext101.setExtClausula(extClausula);
        ext101.setExtFob(extFob);
        ext101.setExtFlete(extFlete);
        ext101.setExtSeguro(extSeguro);
        ext101.setExtCif(extCif);
        ext101.setExtTransext(extTransext);
        ext101.setExtTransnacional(extTransnacional);
        ext101.setExtMediotranscod2(extMediotranscod2);
        session.saveOrUpdate(ext101);
        tx.commit();
        session.close();
        return true;
    }


}
