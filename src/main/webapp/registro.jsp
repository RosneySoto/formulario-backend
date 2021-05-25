<%-- 
    Document   : registro.jsp
    Created on : 12/05/2021, 19:54:10
    Author     : Alvarez Jaen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilo.css">
        <title>Registro</title>
    </head>
    <body>
        
        <div class="container">

        <form class="form" action="registroServlet" method="post">
            
            <h4>Formulario de Registro</h4>
            
            <!--Inicio del formulario-->
            <input class="form-input" type="text" name="nombre" id="nombre" placeholder="Ingrese su nombre">
            <input class="form-input" type="text" name="apellido" id="apellido" placeholder="Ingrese su apellido">
            <input class="form-input" type="email" name="email" id="email" placeholder="Ingrese su correo electronico">
            <input class="form-input" type="password" name="password" id="password" placeholder="Ingrese su contraseña">
           
            <p>Estoy de acuerdo con los<b><a href="#">Terminos y Condiciones</b></a></p>
            
            <input class="botton" type="submit" value="Registrarme">

            <p><b><a href="acceso.jsp">Ya estoy registrado!</b></a></p>
        </form>
    </div>
        
        <%
            if (request.getAttribute("crearUsuario") != null){
                out.print(request.getAttribute("crearUsuario"));
            }
        %>
        
    </body>
</html>
