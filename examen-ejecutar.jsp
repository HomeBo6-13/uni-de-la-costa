<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%!
    String driver = "org.postgresql.Driver";
    String url = "jdbc:postgresql://localhost:5432/";
    String user = "postgres";
    String password = "Admin";
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            text-align: center;
            margin: 0;
            padding: 20px;
        }
        .message {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
        form {
            margin-top: 20px;
        }
        input[type="submit"] {
            background-color: #dc3545;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <h1>Examen de la Unidad 3</h1>
    <div class="message">
        <%
            String nombreBD = request.getParameter("nombreBD");
            String accion = request.getParameter("accion");

            if (nombreBD != null && nombreBD.matches("[a-z]{5,10}")) {
                try {
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(url, user, password);
                    Statement stmt = conn.createStatement();
                    
                    if (accion == null || accion.equals("crear")) {
                        // Crear base de datos
                        String createDB = "CREATE DATABASE " + nombreBD;
                        stmt.executeUpdate(createDB);
                        out.println("<p class='success'>Base de datos '" + nombreBD + "' creada exitosamente.</p>");
                        out.println("<form action='examen-ejecutar.jsp' method='post'>");
                        out.println("<input type='hidden' name='nombreBD' value='" + nombreBD + "'>");
                        out.println("<input type='hidden' name='accion' value='eliminar'>");
                        out.println("<input type='submit' value='Eliminar Base de Datos'>");
                        out.println("</form>");
                    } else if ("eliminar".equals(accion)) {
                        // Borrar base de datos
                        String dropDB = "DROP DATABASE " + nombreBD;
                        stmt.executeUpdate(dropDB);
                        out.println("<p class='success'>Base de datos '" + nombreBD + "' borrada exitosamente.</p>");
                    }
                    
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                }
            } else {
                response.sendRedirect("examen-solicitar.jsp?error=Nombre de base de datos no valido.");
            }
        %>
    </div>
    <footer>
        <p>Desarrollado por Luis Enrique Contreras Gomez - TIDSM 32.</p>
        <p>Contacto via Whatsapp<br>
        <a href="https://wa.me/523232396859"><img src="whatsapp-logo.png" width="50" height="50"></a><br>
        <p>Abrir Contactar vía telegram</p>
        <a href="https://t.me/Luis_ContrerasGomez/+WVEO1afrrm04NTMx"><img src="telegram-logo.png" width="50" height="50"></a><br>
        <a href="index.jsp">Regresar</a>
    </footer>
</body>
</html>
