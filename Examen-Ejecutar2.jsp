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
            background-color: #28a745; /* Verde */
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        .contact-button {
            padding: 10px 20px;
            background-color: #007BFF; /* Azul */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        .contact-button:hover {
            background-color: #0056b3;
        }

        .contact-popup {
            display: none;
            position: absolute;
            bottom: 120px;
            left: 50%;
            transform: translateX(-50%);
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            padding: 20px;
            text-align: center;
        }

        .contact-popup a {
            display: inline-block;
            margin: 10px;
        }
    </style>
    <script>
        function toggleContactPopup() {
            var popup = document.getElementById('contact-popup');
            if (popup.style.display === 'none' || popup.style.display === '') {
                popup.style.display = 'block';
            } else {
                popup.style.display = 'none';
            }
        }
    </script>
</head>
<body>
    <h1>Examen de la Unidad 3</h1>
    <div class="message">
        <%
            String NombreBase = request.getParameter("NombreBase");
            String accion = request.getParameter("accion");

            if (NombreBase != null && NombreBase.matches("[a-z]{5,10}")) {
                try {
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(url, user, password);
                    Statement stmt = conn.createStatement();
                    
                    if (accion == null || accion.equals("crear")) {
                        // Crear base de datos
                        String createDB = "CREATE DATABASE " + NombreBase;
                        stmt.executeUpdate(createDB);
                        out.println("<p class='success'>Base de datos '" + NombreBase + "' creada exitosamente.</p>");
                        out.println("<form action='Examen-Ejecutar2.jsp' method='post'>");
                        out.println("<input type='hidden' name='NombreBase' value='" + NombreBase + "'>");
                        out.println("<input type='hidden' name='accion' value='eliminar'>");
                        out.println("<input type='submit' value='Eliminar Base de Datos'>");
                        out.println("</form>");
                    } else if ("eliminar".equals(accion)) {
                        // Borrar base de datos
                        String dropDB = "DROP DATABASE " + NombreBase;
                        stmt.executeUpdate(dropDB);
                        out.println("<p class='success'>Base de datos '" + NombreBase + "' borrada exitosamente.</p>");
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
    <button class="contact-button" onclick="toggleContactPopup()">CONTÁCTAME</button>
    <div id="contact-popup" class="contact-popup">
        <a href="https://wa.me/523237291378">
            <img src="whatsapp-logo.png" width="50" height="50" alt="WhatsApp">
        </a>
        <a href="https://t.me/Ionized37/+WVEO1afrrm04NTMx">
            <img src="telegram-logo.png" width="50" height="50" alt="Telegram">
        </a>
    </div>
    <footer>
        <p>Página hecha por César Vicente</p>
        <a href="index.jsp">Regresar</a>
    </footer>
</body>
</html>