<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Beca Promedio</title>
</head>
<body>
<form action="beca-promedio.jsp" method="post">
    <label>Calificacion 1: <input type="text" name="cal1" /></label><br>
    <label>Calificacion 2: <input type="text" name="cal2" /></label><br>
    <label>Calificacion 3: <input type="text" name="cal3" /></label><br>
    <label>Calificacion 4: <input type="text" name="cal4" /></label><br>
    <label>Calificacion 5: <input type="text" name="cal5" /></label><br>
    <label>Calificacion 6: <input type="text" name="cal6" /></label><br>
    <label>Calificacion 7: <input type="text" name="cal7" /></label><br>
    <input type="submit" value="Calcular Promedio" />
</form>

<%
if (request.getMethod().equalsIgnoreCase("POST")) {
    try {
        float cal1 = Float.parseFloat(request.getParameter("cal1"));
        float cal2 = Float.parseFloat(request.getParameter("cal2"));
        float cal3 = Float.parseFloat(request.getParameter("cal3"));
        float cal4 = Float.parseFloat(request.getParameter("cal4"));
        float cal5 = Float.parseFloat(request.getParameter("cal5"));
        float cal6 = Float.parseFloat(request.getParameter("cal6"));
        float cal7 = Float.parseFloat(request.getParameter("cal7"));

        float[] calificaciones = {cal1, cal2, cal3, cal4, cal5, cal6, cal7};
        float suma = 0.0f;
        for (int i = 0; i < calificaciones.length; i++) {
            suma += calificaciones[i];
        }
        float promedio = suma / calificaciones.length;

        String mensajeBeca = "";
        if (promedio >= 80 && promedio <= 85.99) {
            mensajeBeca = "Tienes derecho a una beca de $300";
        } else if (promedio >= 86 && promedio <= 90.99) {
            mensajeBeca = "Tienes derecho a una beca de $500";
        } else if (promedio >= 91 && promedio <= 95.99) {
            mensajeBeca = "Tienes derecho a una beca de $700";
        } else if (promedio >= 96 && promedio <= 100) {
            mensajeBeca = "Tienes derecho a una beca de $1,000";
        } else {
            mensajeBeca = "No tienes derecho una a beca";
        }
%>
        <h2>Promedio: <%= promedio %></h2>
        <p><%= mensajeBeca %></p>
<%
    } catch (NumberFormatException e) {
        out.println("<p>Por favor, ingrese todas las calificaciones en un formato valido.</p>");
    }
}
%>
<a href="index.jsp">Regresar</a>
</body>
</html>

