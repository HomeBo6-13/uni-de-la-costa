<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.DriverManager, java.sql.Connection, java.sql.Statement"%>
<%@ include file = "../bdconection/parametros.jsp"%>
<%!
    Connection connect;
    Statement crearbd;
    String sql = "create database hotel";
%>
<center>
	<h2 style="color: blur;">Creacion de la BD Hotel</h2>
<%
     try{
     	  Class.forName(driver);
     	  connect = DriverManager.getConnection(url, user, password);
     	  crearbd = connect.createStatement();
     	  crearbd.execute(sql);
%>
          <h3 style="color: green;">La BD hotel fue creada con exito</h3>
<%               	  
     }catch(Exception x){
%>
          <h3 style="color: red;"><%=x.getMessage()%></h3>
<%               	
     } finally{
     	crearbd.close();
     	connect.close();
     }
%>
     <a href="index.jsp">Regresar</a>     	
</center>    