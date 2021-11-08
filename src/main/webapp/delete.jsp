<%@page import="Entidades.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Eliminar Usuario</h1>
        
        <form action="eliminarServlet" method="POST">
            Ingrese el mail a eliminar <input type="text" name="email" /><br> 
            <input type="submit" value="Eliminar">
	</form>
        
        <h2>Resultado de la eliminacion</h2><hr>
        
        <% if(request.getAttribute("correo")!= null){
		out.print("Se ha borrado a la persona con correo electronico: "+ request.getAttribute("correo")); 
	}
	
	 %>

	<% 
		if(request.getAttribute("mensaje") != null){
			out.print(request.getAttribute("mensaje"));
		}
	%>
        
        
    </body>
</html>
