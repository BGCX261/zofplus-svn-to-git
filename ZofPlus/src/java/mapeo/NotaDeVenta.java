package mapeo;
// Generated 26-03-2012 12:57:47 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * NotaDeVenta generated by hbm2java
 */
public class NotaDeVenta  implements java.io.Serializable {


     private long nvId;
     private String nvGlosa;
     private String nvCodigomoneda;
     private String nvFormapago;
     private String nvPaisdestino;
     private String nvCiudaddestino;
     private Date nvFecha;
     private String nvEstado;
     private String cliRut;
     private Double totalgralNv;
     private Set items = new HashSet(0);
     private Set cabecera201s = new HashSet(0);

    public NotaDeVenta() {
    }

	
    public NotaDeVenta(long nvId) {
        this.nvId = nvId;
    }
    public NotaDeVenta(long nvId, String nvGlosa, String nvCodigomoneda, String nvFormapago, String nvPaisdestino, String nvCiudaddestino, Date nvFecha, String nvEstado, String cliRut, Double totalgralNv, Set items, Set cabecera201s) {
       this.nvId = nvId;
       this.nvGlosa = nvGlosa;
       this.nvCodigomoneda = nvCodigomoneda;
       this.nvFormapago = nvFormapago;
       this.nvPaisdestino = nvPaisdestino;
       this.nvCiudaddestino = nvCiudaddestino;
       this.nvFecha = nvFecha;
       this.nvEstado = nvEstado;
       this.cliRut = cliRut;
       this.totalgralNv = totalgralNv;
       this.items = items;
       this.cabecera201s = cabecera201s;
    }
   
    public long getNvId() {
        return this.nvId;
    }
    
    public void setNvId(long nvId) {
        this.nvId = nvId;
    }
    public String getNvGlosa() {
        return this.nvGlosa;
    }
    
    public void setNvGlosa(String nvGlosa) {
        this.nvGlosa = nvGlosa;
    }
    public String getNvCodigomoneda() {
        return this.nvCodigomoneda;
    }
    
    public void setNvCodigomoneda(String nvCodigomoneda) {
        this.nvCodigomoneda = nvCodigomoneda;
    }
    public String getNvFormapago() {
        return this.nvFormapago;
    }
    
    public void setNvFormapago(String nvFormapago) {
        this.nvFormapago = nvFormapago;
    }
    public String getNvPaisdestino() {
        return this.nvPaisdestino;
    }
    
    public void setNvPaisdestino(String nvPaisdestino) {
        this.nvPaisdestino = nvPaisdestino;
    }
    public String getNvCiudaddestino() {
        return this.nvCiudaddestino;
    }
    
    public void setNvCiudaddestino(String nvCiudaddestino) {
        this.nvCiudaddestino = nvCiudaddestino;
    }
    public Date getNvFecha() {
        return this.nvFecha;
    }
    
    public void setNvFecha(Date nvFecha) {
        this.nvFecha = nvFecha;
    }
    public String getNvEstado() {
        return this.nvEstado;
    }
    
    public void setNvEstado(String nvEstado) {
        this.nvEstado = nvEstado;
    }
    public String getCliRut() {
        return this.cliRut;
    }
    
    public void setCliRut(String cliRut) {
        this.cliRut = cliRut;
    }
    public Double getTotalgralNv() {
        return this.totalgralNv;
    }
    
    public void setTotalgralNv(Double totalgralNv) {
        this.totalgralNv = totalgralNv;
    }
    public Set getItems() {
        return this.items;
    }
    
    public void setItems(Set items) {
        this.items = items;
    }
    public Set getCabecera201s() {
        return this.cabecera201s;
    }
    
    public void setCabecera201s(Set cabecera201s) {
        this.cabecera201s = cabecera201s;
    }




}


