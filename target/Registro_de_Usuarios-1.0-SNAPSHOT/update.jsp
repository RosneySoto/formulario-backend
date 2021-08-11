<%@page import="Entidades.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <form class="form" action="updateServlet" method="post">
            
            <h4>Modificación de Usuario</h4>
        
            <input class="form-input" type="text" name="nombre" id="nombre" placeholder="Ingrese su nombre">
            <input class="form-input" type="text" name="apellido" id="apellido" placeholder="Ingrese su apellido">
            <input class="form-input" type="email" name="email" id="email" placeholder="Ingrese su correo electronico">
            <input class="form-input" type="password" name="password" id="password" placeholder="Ingrese su contraseña">
            <input class="botton" type="submit" value="Modificar">
        </form>
        
        <% if(request.getAttribute("update")!= null){
		Persona p = (Persona) request.getAttribute("update");
		out.print("Se ha modificado la persona "+ p);
            }
         %>
    </body>
</html>
