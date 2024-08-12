<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Día Evaluado</title>
</head>
<body>
<%
    String dia = request.getParameter("dia").toLowerCase();
    String mensaje = "";

    switch(dia) {
        case "domingo":
            mensaje = "Domingo es el septimo dia de la semana.";
            break;
        case "lunes":
            mensaje = "Lunes es el primero dia de la semana.";
            break;
        case "martes":
            mensaje = "Martes es el segundo dia de la semana.";
            break;
        case "miércoles":
        case "miercoles":
            mensaje = "Miercoles es el tercer dia de la semana.";
            break;
        case "jueves":
            mensaje = "Jueves es el cuarto dia de la semana.";
            break;
        case "viernes":
            mensaje = "Viernes es el quinto dia de la semana.";
            break;
        case "sábado":
        case "sabado":
            mensaje = "Sabado es el sexto dia de la semana.";
            break;
        default:
            mensaje = "El dia introducido no es valido.";
            break;
    }
%>
<p><%= mensaje %></p>
<a href="index.jsp">Regresar</a>
</body>
</html>
