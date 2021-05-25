package BaseDatos;

import Entidades.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PersonaDAO {
    
    public static void inserta(Persona p) throws Exception{
    
        Connection con = null;
        PreparedStatement pst = null;
        
        try {
            con = Base_Datos.obtenerConexion();
            String sql = "insert into persona (nombre, apellido, email, password) values (?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, p.getNombre());
            pst.setString(2, p.getApellido());
            pst.setString(3, p.getEmail());
            pst.setString(4, p.getPassword());
            pst.execute();
            
        } catch (SQLException e) {
            e.printStackTrace();
        
        }finally{
        
            pst.close();
            con.close();
        }
        
    }
    
}
