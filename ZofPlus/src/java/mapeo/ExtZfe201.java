package mapeo;
// Generated 26-03-2012 12:57:47 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * ExtZfe201 generated by hbm2java
 */
public class ExtZfe201  implements java.io.Serializable {


     private long id201;
     private Cabecera201 cabecera201;
     private Long nvId;
     private Integer nprovi201;
     private Date fecha201;
     private String extzfeCodzfe;
     private Date extzfeFecfoliora;
     private String extzfeFoliora;

    public ExtZfe201() {
    }

	
    public ExtZfe201(long id201, Cabecera201 cabecera201) {
        this.id201 = id201;
        this.cabecera201 = cabecera201;
    }
    public ExtZfe201(long id201, Cabecera201 cabecera201, Long nvId, Integer nprovi201, Date fecha201, String extzfeCodzfe, Date extzfeFecfoliora, String extzfeFoliora) {
       this.id201 = id201;
       this.cabecera201 = cabecera201;
       this.nvId = nvId;
       this.nprovi201 = nprovi201;
       this.fecha201 = fecha201;
       this.extzfeCodzfe = extzfeCodzfe;
       this.extzfeFecfoliora = extzfeFecfoliora;
       this.extzfeFoliora = extzfeFoliora;
    }
   
    public long getId201() {
        return this.id201;
    }
    
    public void setId201(long id201) {
        this.id201 = id201;
    }
    public Cabecera201 getCabecera201() {
        return this.cabecera201;
    }
    
    public void setCabecera201(Cabecera201 cabecera201) {
        this.cabecera201 = cabecera201;
    }
    public Long getNvId() {
        return this.nvId;
    }
    
    public void setNvId(Long nvId) {
        this.nvId = nvId;
    }
    public Integer getNprovi201() {
        return this.nprovi201;
    }
    
    public void setNprovi201(Integer nprovi201) {
        this.nprovi201 = nprovi201;
    }
    public Date getFecha201() {
        return this.fecha201;
    }
    
    public void setFecha201(Date fecha201) {
        this.fecha201 = fecha201;
    }
    public String getExtzfeCodzfe() {
        return this.extzfeCodzfe;
    }
    
    public void setExtzfeCodzfe(String extzfeCodzfe) {
        this.extzfeCodzfe = extzfeCodzfe;
    }
    public Date getExtzfeFecfoliora() {
        return this.extzfeFecfoliora;
    }
    
    public void setExtzfeFecfoliora(Date extzfeFecfoliora) {
        this.extzfeFecfoliora = extzfeFecfoliora;
    }
    public String getExtzfeFoliora() {
        return this.extzfeFoliora;
    }
    
    public void setExtzfeFoliora(String extzfeFoliora) {
        this.extzfeFoliora = extzfeFoliora;
    }




}


