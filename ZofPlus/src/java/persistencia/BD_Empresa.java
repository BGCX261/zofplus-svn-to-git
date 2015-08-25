/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package persistencia;
import mapeo.Empresa;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.HashMap;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author Tebi
 */
public class BD_Empresa {
    //Familia z= new Empresa();
    Session session = null;
    Transaction tx;
    Empresa e= new Empresa();

public boolean AgregarEmpresa(String empRut, String empNfantasia, String empRsocial, String empGcomercial, String empDireccion, String empCiudad, String empFono, String empReplegal, String empNomreplegal){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    e.setEmpRut(empRut);
    e.setEmpNfantasia(empNfantasia);
    e.setEmpRsocial(empRsocial);
    e.setEmpGcomercial(empGcomercial);
    e.setEmpDireccion(empDireccion);
    e.setEmpCiudad(empCiudad);
    e.setEmpFono(empFono);
    e.setEmpReplegal(empReplegal);
    e.setEmpNomreplegal(empNomreplegal);
    e.setEmpEstado("H");
    session.save(e); // pseudo insert or update
    tx.commit();
    session.close();
    return true;
}


public List ListarEmpresa() {
    List<Empresa> lista = null;
    try {
        this.session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
            session.clear();
            Query q = session.createQuery("from Empresa where empEstado='H'");
            lista = (List<Empresa>) q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

public HashMap ListarEmpresaDeshabilitada() {
HashMap  map= new HashMap();
Empresa ee;
        session = NewHibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        Query query = session.createQuery("FROM Familia WHERE EmpEstado ='D'");
        //query.l
        List<Empresa> listaResultados = query.list();
        for (int i = 0; i < listaResultados.size(); i++) {
            ee = (Empresa)listaResultados.get(i);
            map.put(ee.getEmpRut(), ee);
            }
session.close();

return map;
}

public boolean Eliminar(String empRut){
            session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            e.setEmpRut(empRut);
            session.delete(e);
            tx.commit();
            session.close();
            return true;
     }

public boolean DeshabilitarEmpresa(String empRut, String empNfantasia, String empRsocial, String empGcomercial, String empDireccion, String empCiudad, String empFono, String empReplegal, String empNomreplegal){
            session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            e.setEmpRut(empRut);
            e.setEmpNfantasia(empNfantasia);
            e.setEmpRsocial(empRsocial);
            e.setEmpGcomercial(empGcomercial);
            e.setEmpDireccion(empDireccion);
            e.setEmpCiudad(empCiudad);
            e.setEmpFono(empFono);
            e.setEmpReplegal(empReplegal);
            e.setEmpNomreplegal(empNomreplegal);
            e.setEmpEstado("H");
            session.saveOrUpdate(e);
            tx.commit();
            session.close();
            return true;
     }

public boolean BorrarEmpresa(String emprut){
            session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            e.setEmpRut(emprut);
            session.delete(e);
            tx.commit();
            session.close();
            return true;
     }
public boolean ModificarEmpresa(String empRut, String empNfantasia, String empRsocial, String empGcomercial, String empDireccion, String empCiudad, String empFono, String empReplegal, String empNomreplegal){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    e.setEmpRut(empRut);
    e.setEmpNfantasia(empNfantasia);
    e.setEmpRsocial(empRsocial);
    e.setEmpGcomercial(empGcomercial);
    e.setEmpDireccion(empDireccion);
    e.setEmpCiudad(empCiudad);
    e.setEmpFono(empFono);
    e.setEmpReplegal(empReplegal);
    e.setEmpNomreplegal(empNomreplegal);
    e.setEmpEstado("H");
    session.saveOrUpdate(e); // pseudo insert or update
    tx.commit();
    session.close();
    return true;
}



}