<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <--<!-- <link href="css/estilo.css" rel="stylesheet" type="text/css"/>-->
        <title>Bienvenido</title>
    </head>
    <body>
               
        <div class="container">
                <a href="mostrar.jsp">Mostrar Registros</a>
                <a href="update.jsp">Editar Usuario</a>
                <a href="delete.jsp">Eliminar</a>
        </div>
        
        <h1>Bienvenido al Sitio Web!! <%=request.getAttribute("acceso")%></h1>
        <%=new Date()%>
        
    </body>
</html>
