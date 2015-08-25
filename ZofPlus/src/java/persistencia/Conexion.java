package persistencia;

import java.sql.Connection;
import java.sql.*;

public class Conexion {
    static String bd = "zofplus";
    static String login = "ccastro";
    static String password = "pajilla";
    static String url = "jdbc:postgresql://localhost:5432/"+bd;
    //static String url = "jdbc:postgresql://sith.unap.cl:5432/"+bd;
    //static String url = "jdbc:postgresql://acinfo.unap.cl/"+bd;

    public static Connection Conectar() throws SQLException {

      Connection conn = null;

      try {
	   // cargar el driver
	   String driver = "org.postgresql.Driver"; // postgreSQL driver
	   Class.forName(driver);

	   // Crea una conexion a la bd
	   conn = DriverManager.getConnection(url, login, password);
	   if (conn != null)
             {
	      System.out.println("CONEXION A LA BD "+url+" ... [Ok]");
	     }
          }
      catch(ClassNotFoundException e) {
	      System.out.println("Error en el driver");
	 }

      return conn;
    }

    public String getBd() {
        return bd;
    }

    public void setBd(String val) {
        this.bd = val;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String val) {
        this.login = val;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String val) {
        this.password = val;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String val) {
        this.url = val;
    }
}