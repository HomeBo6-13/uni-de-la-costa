<%@ page contentType="text/html; charset=utf-8" language="java"%>
<html>
<head>
    <title>Examen de César Unidad 3</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px)
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        input[type="text"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1);
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            margin-top: 20px;
        }

        footer {
            margin-top: 20px;
            font-size: 14px;
            color: #777;
        }

        .contact-button {
            padding: 10px 20px;
            background-color: #007BFF;
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
    <div class="form-container">
        <h1>Examen de la Unidad 3</h1>
        <p>Inserta el nombre de la base de datos que quieras crear:</p>
        <form action="Examen-Ejecutar2.jsp" method="post">
            <input type="text" name="NombreBase" id="IDbase" maxlength="10" required pattern="[a-z]{5,10}" title="Debe tener entre 5 y 10 caracteres, sin espacios ni caracteres especiales, y todo en minúsculas.">
            <input type="submit" value="Crear Base de Datos">
        </form>
        <p class="error">
            <% 
                String error = request.getParameter("error");
                if (error != null) {
                    out.println(error);
                }
            %>
        </p>
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
            <p>pagina hecha por cesar vicente</p>
            <a href="index.jsp">Regresar</a>
        </footer>
    </div>
</body>
</html>