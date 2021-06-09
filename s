[1mdiff --git a/src/main/java/BaseDatos/Base_Datos.java b/src/main/java/BaseDatos/Base_Datos.java[m
[1mindex 13df7e6..ee9130f 100644[m
[1m--- a/src/main/java/BaseDatos/Base_Datos.java[m
[1m+++ b/src/main/java/BaseDatos/Base_Datos.java[m
[36m@@ -6,21 +6,23 @@[m [mimport java.sql.*;[m
 [m
 public class Base_Datos {[m
 [m
[31m-        private static Connection con = null;[m
[32m+[m[32m        private static Connection con = null;       //Establezco la conexion como nula[m
         [m
[32m+[m[32m        //Metodo para conectase a la base de datos[m
     public static Connection obtenerConexion() throws SQLException, ClassNotFoundException {[m
         [m
         if(con == null){[m
             try {[m
[31m-                Class.forName("com.mysql.cj.jdbc.Driver");[m
[32m+[m[32m                Class.forName("com.mysql.cj.jdbc.Driver"); //Instanciacion del driver[m
[32m+[m[32m                //URL, usuario y contraseña[m
                 con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/personas?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "123456789");[m
[31m-            } catch (SQLException e) {[m
[32m+[m[32m            } catch (SQLException e) {  //Se capturan las excepciones de MYSQL[m
                 throw new SQLException(e);[m
             } catch (ClassNotFoundException e){[m
                 throw new ClassNotFoundException (e.getMessage());[m
             }[m
         }[m
[31m-        return con;[m
[32m+[m[32m        return con; //Retorno de la conexion[m
     }[m
     [m
     public static void cerrarConexcion() throws SQLException{[m
[36m@@ -30,22 +32,3 @@[m [mpublic class Base_Datos {[m
         }[m
     }[m
 }[m
[31m-//        //PASO 1 = ESTABLECER EL NOMBRE DEL DRIVER[m
[31m-//        String dbDriver = "com.mysql.cj.jdbc.Driver";[m
[31m-//        [m
[31m-//        //PASO 2 = ESTABECER URL Y BASE DE DATOS A UTILIZAR[m
[31m-//        String dbConnString = "jdbc:mysql://127.0.0.1:3306/personas?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";[m
[31m-//                                                                 [m
[31m-//        //PASO 3 = ESTABLECER EL USUARIO DE LA BASE[m
[31m-//        String dbUser = "root";[m
[31m-//        [m
[31m-//        //PASO 4 = ESTABLECER LA CONTRASEÑA[m
[31m-//        String dbPassword = "123456789";[m
[31m-//        [m
[31m-//        //PASO 5 = INSTANCIAR EL DRIVER Y LA CONEXION[m
[31m-//        Class.forName(dbDriver).newInstance();[m
[31m-//        [m
[31m-//        //PASO 6 = RETORNO LA CONEXION[m
[31m-//        Connection conn = DriverManager.getConnection(dbConnString, dbUser, dbPassword);[m
[31m-//        [m
[31m-//        return conn;[m
[1mdiff --git a/target/classes/BaseDatos/Base_Datos.class b/target/classes/BaseDatos/Base_Datos.class[m
[1mindex a06c58a..9c66b7a 100644[m
Binary files a/target/classes/BaseDatos/Base_Datos.class and b/target/classes/BaseDatos/Base_Datos.class differ
[1mdiff --git a/target/classes/BaseDatos/PersonaDAO.class b/target/classes/BaseDatos/PersonaDAO.class[m
[1mindex b412864..fff18f3 100644[m
Binary files a/target/classes/BaseDatos/PersonaDAO.class and b/target/classes/BaseDatos/PersonaDAO.class differ
[1mdiff --git a/target/classes/Servlets/registroServlet.class b/target/classes/Servlets/registroServlet.class[m
[1mindex 784ec57..2e1e795 100644[m
Binary files a/target/classes/Servlets/registroServlet.class and b/target/classes/Servlets/registroServlet.class differ
