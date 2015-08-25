/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package RN;

//Persistencia
import persistencia.Conexion;
//Librerias
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistencia.Conexion;



/**
 *
 * @author Tebi
 */
public class Session {


    public String IniciarSesion(String rut, String pass, String tipo){
        String res="";
        try {
            Conexion con = new Conexion();
            Connection conex = con.Conectar();
            Statement s = conex.createStatement();
            String query = "SELECT * FROM persona WHERE RUT LIKE '"+rut+"' AND clave LIKE '"+pass+"'";
            ResultSet rs = s.executeQuery(query);
            //System.out.println (query);
             while (rs.next()){
                System.out.println (rs.getString(1));   // Print col 1
                res=tipo;
                }
            conex.close();
        } catch (SQLException ex) {
            Logger.getLogger(Session.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }



}
