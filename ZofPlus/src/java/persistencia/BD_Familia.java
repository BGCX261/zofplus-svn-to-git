/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package persistencia;
import mapeo.Familia;
import org.hibernate.Transaction;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import java.util.HashMap;


/**
 *
 * @author Tebi
 */
public class BD_Familia {    
    Session session = null;
    Transaction tx;
    Familia f= new Familia();


public boolean AgregarFamilia(String famNombre, String famDescripcion){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    f.setFamId(this.ObtenerCorrelativoFamilia());
    f.setFamNombre(famNombre);
    f.setFamDescripcion(famDescripcion);
    f.setFamEstado("H");
    session.save(f); 
    tx.commit();
    session.close();
    return true;
}

public Long ObtenerCorrelativoFamilia()
{
    Long famId;
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    Query query = session.createQuery("select max(famId) from Familia");
    List listaResultados = query.list();
    if(listaResultados.get(0)==null) { famId=Long.valueOf("1"); }
    else { famId = ((Long)listaResultados.get(0))+1; }
   return famId;

}

public List ListarFamilia() {
List<Familia> lista = null;
    try {
        this.session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Familia WHERE famEstado='H'");
            lista = (List<Familia>) q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
}

public HashMap ListarFamiliaDeshabilitada() {
HashMap  map= new HashMap();
Familia ff;
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        Query query = session.createQuery("FROM Familia WHERE FamEstado ='D'");
        //query.l
        List<Familia> listaResultados = query.list();
        for (int i = 0; i < listaResultados.size(); i++) {
            ff = (Familia)listaResultados.get(i);
            map.put(ff.getFamId(), ff);
            }
session.close();

return map;
        
}
public boolean BorrarFamilia(String famid){
            session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            //f.setFamId(famid);
            session.delete(f);
            tx.commit();
            session.close();
            return true;
     }

public boolean DeshabilitarFamilia(String famId, String famNombre, String famDescripcion){
            session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            f.setFamId(Long.valueOf(famId));
            f.setFamNombre(famNombre);
            f.setFamDescripcion(famDescripcion);
            f.setFamEstado("D");
            session.saveOrUpdate(f);            
            tx.commit();
            session.close();
            return true;
     }





public boolean ModificarFamilia(String famId, String famNombre, String famDescripcion){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    f.setFamId(Long.valueOf(famId));
    f.setFamNombre(famNombre);
    f.setFamDescripcion(famDescripcion);
    f.setFamEstado("H");
    session.saveOrUpdate(f);
    tx.commit();
    session.close();
    return true;
}



}










