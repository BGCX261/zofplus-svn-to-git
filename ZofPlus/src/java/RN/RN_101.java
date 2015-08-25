/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package RN;

import persistencia.BD_101;
import java.util.List;
import java.util.Date;
/**
 *
 * @author Tebi
 */
public class RN_101 {

////////////DATOS CABECERA 101////////////
     private String id101;
     private String ocId;
     private Date fecha101;
     private Integer nprovi101;
     private String estado101;
     BD_101 bd101 = new BD_101();



////////////DATOS 101 RDP////////////
     private Double rdpMontoperacion;
     private String rdpRegioncodigo;



     ////////////DATOS 101 EXT/////

     private String extPembarque;
     private String extPaisproced;
     private String extClausula;
     private Double extFob;
     private Double extFlete;
     private Double extSeguro;
     private Double extCif;
     private String extTransext;
     private String extTransnacional;
     private String extMediotranscod2;


  ///////////////Datos 101 zf3/////
     private Double zfemonto;


     /*              CONSTRUCTORES               */
    public RN_101() {
    }

    public RN_101(String id101) {
        this.id101 = id101;
    }

    public RN_101(String id101, String ocId) {
        this.id101 = id101;
        this.ocId = ocId;
    }
///CONSTRUCTOR 101 RDP/////
    public RN_101(String id101,String ocId, Double rdpMontoperacion, String rdpRegioncodigo){
        this.id101 = id101;
        this.ocId =  ocId;
        this.rdpMontoperacion = rdpMontoperacion;
        this.rdpRegioncodigo =  rdpRegioncodigo;
    }
/////CONSTRUCTOR 101 OZF////
    public RN_101(String id101,String ocId, Double zfemonto){
        this.id101 = id101;
        this.ocId =  ocId;        
        this.zfemonto =  zfemonto;
    }

////////////CONSTRUCTOR 101 EXT/////
public RN_101(String id101,String ocId, String extPembarque, String extPaisproced, String extClausula, Double extFob, Double extFlete, Double extSeguro, Double extCif, String extTransext, String extTransnacional, String extMediotranscod2){
        this.id101 = id101;
        this.ocId =  ocId;
        this.extPembarque= extPembarque;
        this.extPaisproced = extPaisproced;
        this.extClausula = extClausula;
        this.extFob = extFob;
        this.extFlete = extFlete;
        this.extSeguro = extSeguro;
        this.extCif = extCif;
        this.extTransext = extTransext;
        this.extTransnacional = extTransnacional;
        this.extMediotranscod2 = extMediotranscod2;




    }

    public List Listar101() {
        List l101 = null;
        l101 = bd101.Listar101();
        return l101;
    }


public List Listar101EXT() {
        List l101 = null;
        l101 = bd101.Listar101EXT();
        return l101;
    }


public List ListarRechazados101EXT() {
        List l101 = null;
        l101 = bd101.Listar101EXT();
        return l101;
    }

public Long ObtenerCorrelativo101() {
        return bd101.ObtenerCorrelativo101();
    }

public Boolean AgregarCabecera101() {
        return bd101.AgregarCabecera101(id101,ocId);    
     
    }


public List Listar101RDPParaVisar() {
        List l101 = null;
        l101 = bd101.Listar101RDPParaVisar();
        return l101;
    }


public List Listar101EXTParaVisar() {
        List l101 = null;
        l101 = bd101.Listar101EXTParaVisar();
        return l101;
    }


public List Listar101OZFParaVisar() {
        List l101 = null;
        l101 = bd101.Listar101OZFParaVisar();
        return l101;
    }

public String Agregar101RDP() {
if (bd101.Agregar101RDP(id101,ocId, rdpMontoperacion, rdpRegioncodigo)) {
            return "101 Resto del Pais Agregado Exitosamente";
        }
        return "101 Resto del Pais Agregado no se Pudo Agregar";
    }

public String Agregar101OZF() {
if (bd101.Agregar101OZF(id101,ocId, zfemonto)) {
            return "101 Otra Zona Franca Agregada Exitosamente";
        }
        return "101 Otra Zona Franca no se Pudo Agregar";
    }


public String Agregar101EXT() {
if (bd101.Agregar101EXT(id101, ocId, extPembarque, extPaisproced, extClausula, extFob, extFlete, extSeguro, extCif, extTransext, extTransnacional, extMediotranscod2)){
            return "101 Extranjero Agregada Exitosamente";
        }
        return "101 Extranjero  no se Pudo Agregar";
    }



}
