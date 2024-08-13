<%@ page contentType="text/html; charset=utf-8" language="java"%>
<center>
	<h2 style="color: blueviolet;">Examen de la Unidad 3 - Solicitar el Base de Datos</h2>
	<body>
    <h1>Examen de la Unidad 3</h1>
    <p>Por favor, introduce el nombre de la Base de Datos:</p>
    <form action="examen-ejecutar.jsp" method="post">
        <input type="text" name="nombreBD" id="nombreBD" maxlength="10" required pattern="[a-z]{5,10}" title="Debe tener entre 5 y 10 caracteres, sin espacios ni caracteres especiales, y todo en minusculas.">
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
    <footer><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <p>Desarrollado por Luis Enrique Contreras Gomez - TIDSM 32.</p>
        <p>Contacto via Whatsapp<br>
	    <a href="https://wa.me/523232396859"><img src="whatsapp-logo.png" width="50" height="50"></a><br>
	    <p>Abrir Contactar vía telegram</p>
		<a href="https://t.me/Luis_ContrerasGomez/+WVEO1afrrm04NTMx"><img src="telegram-logo.png" width="50" height="50"></a><br>
        <a href="index.jsp">Regresar</p>
    </footer>
</body>
</html>
