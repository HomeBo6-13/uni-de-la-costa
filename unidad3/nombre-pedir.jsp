<%@ page contentType="text/html; charset=utf-8" language="java"%>
<center>
	<h4 style="color:#2231C6">Uso del Metodo Get</h4>
	<form action="nombre-leer.jsp" method="post">
		<table>
			<tr>
				<td>Nombre:</td>
				<td><input type="text" name="nom" required="ture" maxlength="30" pattern="[a-zA-Z\s]{1,50}" placeholder="No numeros"></td>
			</tr>
			<tr>
				<td><center><input type="submit" name="enviar"></center></td>
				<td><center><input type="reset" name="borrar"></center></td>
			</tr>
		</table>
	</form>
	<a href="index.jsp">Regresar</a>
</center>