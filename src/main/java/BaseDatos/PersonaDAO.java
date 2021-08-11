package BaseDatos;

import Entidades.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PersonaDAO {

    public static void inserta(Persona p) throws Exception {

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
            pst.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {

            pst.close();
            con.close();
        }

    }

    //Modificar un Registro
    public static int actualizar(Persona p) throws Exception {

        Connection con = null;
        PreparedStatement pst = null;
        int registros = 0;

        try {
            con = Base_Datos.obtenerConexion();
            String sql = "UPDATE persona SET nombre =?, apellido=?, email=?, password=? WHERE idpersona=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, p.getNombre());
            pst.setString(2, p.getApellido());
            pst.setString(3, p.getEmail());
            pst.setString(4, p.getPassword());
            pst.setInt(5, p.getId());
            registros = pst.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {

            pst.close();
            con.close();
        }
        return registros;
    }

    //Elimina a una persona por su ID
    public static void eliminar(int id) throws Exception {

        Connection con = null;
        PreparedStatement pst = null;
        //int registros = 0;

        try {
            con = Base_Datos.obtenerConexion();
            String sql = "DELETE FROM persona WHERE idpersona = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.execute();
        } catch (SQLException e) {
            System.out.println("ERROR " + e.getMessage());
            e.printStackTrace();

        } finally {
            pst.close();
            con.close();
        }
        //return registros;
    }

    //Muestra toda la lista de personas/objetos creados
    public static ArrayList<Persona> obtenerPersona() {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        ArrayList<Persona> personas = new ArrayList<>();

        try {
            con = Base_Datos.obtenerConexion();
            Persona p = null;
            String sql = "SELECT * FROM persona";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idpersona");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String email = rs.getString("email");
                String pass = rs.getString("password");

                p = new Persona(id, nombre, apellido, email, pass);
                personas.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            try {
                rs.close();
                pst.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return personas;
    }
    
    public int validar(Persona p) throws SQLException{
    
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        int r=0;
        
        String sql = "SELECT * FROM persona WHERE email=? and password=?";
        
        try {
            con=Base_Datos.obtenerConexion();
            pst=con.prepareStatement(sql);
            pst.setString(1, p.getEmail());
            pst.setString(2, p.getPassword());
            rs=pst.executeQuery();
            
            while(rs.next()){
                r=r+1;
                p.setEmail(rs.getString("email"));
                p.setPassword(rs.getString("password"));
            }
            if(r==1){
                return 1;
            }else{
                return 0;
            }
            
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            return 0;
        }
    }
    
    public static Persona obtenerPersona(String email) throws SQLException{
    
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Persona p = null;
        
        try {
            con = Base_Datos.obtenerConexion();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String sql = "SELECT * FROM persona WHERE email = ?";
        pst = con.prepareStatement(sql);
        pst.setString(1, email);
        rs = pst.executeQuery();
        
        if(rs.next()){
            int id = rs.getInt("idpersona");
            String nomb = rs.getString("nombre");
            String apell = rs.getString("apellido");
            String mail = rs.getString("email");
            String pass = rs.getString("password");
            p = new Persona();
            p.setId(id);
            p.setNombre(nomb);
            p.setApellido(apell);
            p.setEmail(mail);
            p.setPassword(pass);
        }
        
        try {
            rs.close();
            pst.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return p;   
    }
    
}
   