package persistencia;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.HashMap;
import mapeo.DocumentoAdjunto;
import mapeo.Cabecera101;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;

public class BD_DocumentoAdjunto {
    //Familia  new Empresa();
    Session session = null;
    Transaction tx;   
    DocumentoAdjunto da= new DocumentoAdjunto();
    Cabecera101 c= new Cabecera101();
    Long idtemporal;

public boolean AgregarDocumentoAdjunto(String dadId, String id_101, String dadTipo, Date dadFecha, String dadEmisor, String dadAduana) throws ParseException{
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();

    Cabecera101 cab = (Cabecera101)session.get(Cabecera101.class,Long.valueOf(id_101));
    
    //set datos Documento Adjunto
    da.setCabecera101(cab);
    da.setDadId(Long.valueOf(dadId));
    da.setDadTipo(dadTipo);
    da.setDadFecha(dadFecha);
    da.setDadEmisor(dadEmisor);
    da.setDadAduana(dadAduana);      
    session.save(da);
    tx.commit();
    session.close();    
    return true;
}

public boolean AgregarFactura(String dadId, String id_101, String dadTipo, Date dadFecha, String dadEmisor) throws ParseException{
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();

    Cabecera101 cab = (Cabecera101)session.get(Cabecera101.class,Long.valueOf(id_101));

    //set datos Documento Adjunto
    da.setCabecera101(cab);
    da.setDadId(Long.valueOf(dadId));
    da.setDadTipo(dadTipo);
    da.setDadFecha(dadFecha);
    da.setDadEmisor(dadEmisor);
    session.save(da);
    tx.commit();
    session.close();
    return true;
}

public Long ObtenerCorrelativoDocumentoAdjunto(){
    session = NewHibernateUtil.getSessionFactory().openSession();
    tx = session.beginTransaction();
    Query query = session.createQuery("select max(dadId) from DocumentoAdjunto");
    List listaResultados = query.list();
    if(listaResultados.get(0)==null) { idtemporal=Long.valueOf("1"); }
    else { idtemporal = ((Long)listaResultados.get(0))+1; }
    return idtemporal;
}


}