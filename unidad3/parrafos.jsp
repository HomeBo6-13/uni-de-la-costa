<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Parrafos</title>
</head>
<body>
<%
    // Definimos las palabras o enunciados
    String palabra1 = "Mi nombre es Luis Contreras Gomez";
    String palabra2 = "Voy en la carrera de TSU en TIC area Sistemas en Informaticos";
    String palabra3 = "En la Universidad de la Costa en Santiago Ixcuincla";
    
    // Definimos el número de repeticiones para cada párrafo
    int longitudParrafo1 = 50;
    int longitudParrafo2 = 60;
    int longitudParrafo3 = 70;

    // Imprimimos el primer párrafo
    out.print("<p>");
    for(int i = 0; i < longitudParrafo1; i++) {
        out.print(palabra1 + " ");
    }
    out.print("</p>");

    // Imprimimos el segundo párrafo
    out.print("<p>");
    for(int i = 0; i < longitudParrafo2; i++) {
        out.print(palabra2 + " ");
    }
    out.print("</p>");

    // Imprimimos el tercer párrafo
    out.print("<p>");
    for(int i = 0; i < longitudParrafo3; i++) {
        out.print(palabra3 + " ");
    }
    out.print("</p>");
%>
</body>
</html>