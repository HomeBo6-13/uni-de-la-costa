<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.DriverManager" import="java.sql.Connection"%>
<%!
    String driver = "org.postgresql.Driver"; 
    // Controlador o Driver de PostgreSQL
    String url = "jdbc:postgresql://localhost:5432/";
    // Ruta de conexion del SuperUsuario de PostgreSQL
    String user = "postgres";
    //Usuario del SuperUsuario de PostgreSQL
    String password= "Admin"; 
    //Contraseña del SuperUsuario de PostgreSQL
    Connection conexion;
%>
<%
          out.print("<center><h2>Conexion al SuperUsuario postgres</h2>");
          try{
          	    Class.forName(driver); 
          	    //Carga el controlador o Driver de PostgreSQL
          	    conexion = DriverManager.getConnection(url, user, password);
          	    // Se hace la conexion
          	    out.print("Conexion exitosa");
          	    conexion.close();
          	    //Cerrar la conexion 
          }catch(Exception e){
          	  out.print("Ocurrio el siguiente error: "+e);
          }
          out.print("<br><a href='index.jsp'>Regresar</a></center>");    
%>          