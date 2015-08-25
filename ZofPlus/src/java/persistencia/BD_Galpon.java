/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package persistencia;
import mapeo.Galpon;
import mapeo.Empresa;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
/**
 *
 * @author xtian
 */
public class BD_Galpon {
    Session session = null;
    Transaction tx;
    
    Galpon g= new Galpon();
    //Empresa e= new Empresa();
    

public boolean AgregarGalpon(int idGalpon, String empRut, String recintoGalpon, String manzanaGalpon, String descripcionGalpon, Integer fonoGalpon){

    
    session = NewHibernateUtil.getSessionFactory().openSession();
    //datos de empresa
    tx = session.beginTransaction();    
    Empresa emp = (Empresa)session.get(Empresa.class,empRut);
    g.setIdGalpon(idGalpon);
    g.setEmpresa(emp);
    g.setRecintoGalpon(recintoGalpon);
    g.setManzanaGalpon(manzanaGalpon);
    g.setDescripcionGalpon(descripcionGalpon);
    g.setFonoGalpon(fonoGalpon);
    g.setEstadoGalpon("H");

    Set galponset = new HashSet(0);
    galponset.add(g);

    emp.setGalpons(galponset);


    
    session.saveOrUpdate(emp);
    session.saveOrUpdate(g);
    tx.commit();
    session.close();
    return true;
}


public List ListarGalpon(){
    List<Galpon> lista = null;
    try {
        this.session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Galpon WHERE estadoGalpon='H'");
            lista = (List<Galpon>) q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

public HashMap ListarGalponDeshabilitado() {
        HashMap  map= new HashMap();
        Galpon gg;
        session.clear();
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        Query query = session.createQuery("FROM Galpon WHERE estadoGalpon='D'");
        List<Galpon> listaResultados = query.list();
        for (int i = 0; i < listaResultados.size(); i++) {
            gg = (Galpon)listaResultados.get(i);
            map.put(gg.getIdGalpon(), gg);
            }
session.close();
return map;
}

public boolean BorrarGalpon(int idGalpon){
            session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            g.setIdGalpon(idGalpon);
            session.delete(g);
            tx.commit();
            session.close();
            return true;
     }
public boolean ModificarGalpon(int idGalpon, String empRut, String recintoGalpon, String manzanaGalpon, String descripcionGalpon, Integer fonoGalpon){
    session = NewHibernateUtil.getSessionFactory().openSession();
    //datos de empresa
    tx = session.beginTransaction();
    Empresa emp = (Empresa)session.get(Empresa.class,empRut);
    g.setIdGalpon(idGalpon);
    g.setEmpresa(emp);
    g.setRecintoGalpon(recintoGalpon);
    g.setManzanaGalpon(manzanaGalpon);
    g.setDescripcionGalpon(descripcionGalpon);
    g.setFonoGalpon(fonoGalpon);
    g.setEstadoGalpon("H");
    
    Set galponset = new HashSet(0);
    galponset.add(g);

    emp.setGalpons(galponset);



    session.saveOrUpdate(emp);
    session.saveOrUpdate(g);
    tx.commit();
    session.close();
    return true;
}


public int ObtenerCorrelativoGalpon()
{
    int idGalpon;
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    Query query = session.createQuery("select max(idGalpon) from Galpon");
    List listaResultados = query.list();
    if(listaResultados.get(0)==null) { idGalpon=1; }
    else { idGalpon = ((Integer)listaResultados.get(0))+1; }
   return idGalpon;

}



public boolean DeshabilitarGalpon(int idGalpon, String empRut, String recintoGalpon, String manzanaGalpon, String descripcionGalpon, Integer fonoGalpon){
    session = NewHibernateUtil.getSessionFactory().openSession();
    //datos de empresa
    tx = session.beginTransaction();
    Empresa emp = (Empresa)session.get(Empresa.class,empRut);
    g.setIdGalpon(idGalpon);
    g.setRecintoGalpon(recintoGalpon);
    g.setManzanaGalpon(manzanaGalpon);
    g.setDescripcionGalpon(descripcionGalpon);
    g.setFonoGalpon(fonoGalpon);
    g.setEstadoGalpon("D");
    g.setEmpresa(emp);
    session.saveOrUpdate(emp);
    session.saveOrUpdate(g);
    tx.commit();
    session.close();
    return true;
}

}
