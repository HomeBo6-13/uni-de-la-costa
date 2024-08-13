<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.DriverManager,java.sql.Connection" %>
<%!
 String driver = "org.postgresql.Driver"; 
 String url = "jdbc:postgresql://localhost:5432/";
 String user = "postgres";
 String password = "Admin"; 
 Connection connect;
%>
<center>
<h2 style="color:blue">Conexion a la BD tienda</h2>
<%
try {
    Class.forName(driver);
    connect = DriverManager.getConnection(url, user, password);
%>
<h3 style="color: green">Exito en la conexión:</h3>
<%
    connect.close();
} catch(Exception e) {
%>
<h3 style="color: red">¡Ups! Ocurrio un error: <%=e%></h3>
<%
}
%>
<a href="index.jsp">Regresar</a>
</center>