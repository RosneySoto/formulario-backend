package BaseDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

public class Base_Datos {

        private static Connection con = null;       //Establezco la conexion como nula
        
        //Metodo para conectase a la base de datos
    public static Connection obtenerConexion() throws SQLException, ClassNotFoundException {
        
        if(con == null){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); //Instanciacion del driver
                //URL, usuario y contraseña
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/personas?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "123456789");
            } catch (SQLException e) {  //Se capturan las excepciones de MYSQL
                throw new SQLException(e);
            } catch (ClassNotFoundException e){
                throw new ClassNotFoundException (e.getMessage());
            }
        }
        return con; //Retorno de la conexion
    }
    
    public static void cerrarConexcion() throws SQLException{
    
        if (con != null){
            con.close();
        }
    }
}
