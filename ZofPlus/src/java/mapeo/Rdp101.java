package mapeo;
// Generated 26-03-2012 12:57:47 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Rdp101 generated by hbm2java
 */
public class Rdp101  implements java.io.Serializable {


     private long id101;
     private Cabecera101 cabecera101;
     private Long ocId;
     private Date fecha101;
     private Integer nprovi101;
     private Double rdpMontoperacion;
     private String rdpRegioncodigo;

    public Rdp101() {
    }

	
    public Rdp101(long id101, Cabecera101 cabecera101) {
        this.id101 = id101;
        this.cabecera101 = cabecera101;
    }
    public Rdp101(long id101, Cabecera101 cabecera101, Long ocId, Date fecha101, Integer nprovi101, Double rdpMontoperacion, String rdpRegioncodigo) {
       this.id101 = id101;
       this.cabecera101 = cabecera101;
       this.ocId = ocId;
       this.fecha101 = fecha101;
       this.nprovi101 = nprovi101;
       this.rdpMontoperacion = rdpMontoperacion;
       this.rdpRegioncodigo = rdpRegioncodigo;
    }
   
    public long getId101() {
        return this.id101;
    }
    
    public void setId101(long id101) {
        this.id101 = id101;
    }
    public Cabecera101 getCabecera101() {
        return this.cabecera101;
    }
    
    public void setCabecera101(Cabecera101 cabecera101) {
        this.cabecera101 = cabecera101;
    }
    public Long getOcId() {
        return this.ocId;
    }
    
    public void setOcId(Long ocId) {
        this.ocId = ocId;
    }
    public Date getFecha101() {
        return this.fecha101;
    }
    
    public void setFecha101(Date fecha101) {
        this.fecha101 = fecha101;
    }
    public Integer getNprovi101() {
        return this.nprovi101;
    }
    
    public void setNprovi101(Integer nprovi101) {
        this.nprovi101 = nprovi101;
    }
    public Double getRdpMontoperacion() {
        return this.rdpMontoperacion;
    }
    
    public void setRdpMontoperacion(Double rdpMontoperacion) {
        this.rdpMontoperacion = rdpMontoperacion;
    }
    public String getRdpRegioncodigo() {
        return this.rdpRegioncodigo;
    }
    
    public void setRdpRegioncodigo(String rdpRegioncodigo) {
        this.rdpRegioncodigo = rdpRegioncodigo;
    }




}


