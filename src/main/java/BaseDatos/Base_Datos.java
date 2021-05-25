package BaseDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

public class Base_Datos {

        private static Connection con = null;
        
    public static Connection obtenerConexion() throws SQLException, ClassNotFoundException {
        
        if(con == null){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/personas?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "123456789");
            } catch (SQLException e) {
                throw new SQLException(e);
            } catch (ClassNotFoundException e){
                throw new ClassNotFoundException (e.getMessage());
            }
        }
        return con;
    }
    
    public static void cerrarConexcion() throws SQLException{
    
        if (con != null){
            con.close();
        }
    }
}
//        //PASO 1 = ESTABLECER EL NOMBRE DEL DRIVER
//        String dbDriver = "com.mysql.cj.jdbc.Driver";
//        
//        //PASO 2 = ESTABECER URL Y BASE DE DATOS A UTILIZAR
//        String dbConnString = "jdbc:mysql://127.0.0.1:3306/personas?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
//                                                                 
//        //PASO 3 = ESTABLECER EL USUARIO DE LA BASE
//        String dbUser = "root";
//        
//        //PASO 4 = ESTABLECER LA CONTRASEÑA
//        String dbPassword = "123456789";
//        
//        //PASO 5 = INSTANCIAR EL DRIVER Y LA CONEXION
//        Class.forName(dbDriver).newInstance();
//        
//        //PASO 6 = RETORNO LA CONEXION
//        Connection conn = DriverManager.getConnection(dbConnString, dbUser, dbPassword);
//        
//        return conn;
