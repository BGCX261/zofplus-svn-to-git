package mapeo;
// Generated 26-03-2012 12:57:47 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * DocumentoAdjunto generated by hbm2java
 */
public class DocumentoAdjunto  implements java.io.Serializable {


     private long dadId;
     private Cabecera101 cabecera101;
     private String dadTipo;
     private Date dadFecha;
     private String dadEmisor;
     private String dadAduana;

    public DocumentoAdjunto() {
    }

	
    public DocumentoAdjunto(long dadId, Cabecera101 cabecera101) {
        this.dadId = dadId;
        this.cabecera101 = cabecera101;
    }
    public DocumentoAdjunto(long dadId, Cabecera101 cabecera101, String dadTipo, Date dadFecha, String dadEmisor, String dadAduana) {
       this.dadId = dadId;
       this.cabecera101 = cabecera101;
       this.dadTipo = dadTipo;
       this.dadFecha = dadFecha;
       this.dadEmisor = dadEmisor;
       this.dadAduana = dadAduana;
    }
   
    public long getDadId() {
        return this.dadId;
    }
    
    public void setDadId(long dadId) {
        this.dadId = dadId;
    }
    public Cabecera101 getCabecera101() {
        return this.cabecera101;
    }
    
    public void setCabecera101(Cabecera101 cabecera101) {
        this.cabecera101 = cabecera101;
    }
    public String getDadTipo() {
        return this.dadTipo;
    }
    
    public void setDadTipo(String dadTipo) {
        this.dadTipo = dadTipo;
    }
    public Date getDadFecha() {
        return this.dadFecha;
    }
    
    public void setDadFecha(Date dadFecha) {
        this.dadFecha = dadFecha;
    }
    public String getDadEmisor() {
        return this.dadEmisor;
    }
    
    public void setDadEmisor(String dadEmisor) {
        this.dadEmisor = dadEmisor;
    }
    public String getDadAduana() {
        return this.dadAduana;
    }
    
    public void setDadAduana(String dadAduana) {
        this.dadAduana = dadAduana;
    }




}


