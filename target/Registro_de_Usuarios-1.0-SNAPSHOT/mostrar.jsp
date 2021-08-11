<%@page import="Entidades.Persona"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">

            <form class="form" action="mostrarServlet" method="POST">
                <h4>Busqueda de Usuarios</h4>
                <input class="form-input" type="text" placeholder="Correo Electrónico:" name="buscar" /><br> 
                <input class="botton" type="submit" value="Enviar">
            </form>
        </div>
        
        <% if(request.getAttribute("persona")!= null){
		Persona p = (Persona) request.getAttribute("persona");
		out.print("Se ha encontrado al usuario <br>"+ p);
	}
	 %>
        <% if (request.getAttribute("personas") != null) {
                 ArrayList<Persona> p = (ArrayList) request.getAttribute("personas");

              
                 out.print("Se encontraron los siguinetes resgistros: <br><br>" + p);
             }


         %>
         
         <% 
		if(request.getAttribute("error") != null){
			out.print(request.getAttribute("error"));
		}
	%>
    </body>
</html>
