<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement"%>
<%@ include file ="../bdconection/parametros.jsp" %>
<%!
   Connection con_postgres = null, con_aerolinea = null;
   String sql_bd = "create database aerolinea";
   String sql_tabla_cliente =
   "create table cliente (id serial primary key, nombre character varying (30) not null, edad integer not null, domicilio character varying (100) not null, telefono character varying (10) not null)";
   String sql_tabla_vuelo =
   "create table vuelo (numero_vuelo integer primary key, origen character varying (20) not null, destino character varying (20) not null, hora_salida time with zone not null, avion character varying (10) not null)";
   String url2 = "jdbc:postgresql://localhost:5432/aerolinea";
   Statement bdcrear = null, crear_tablas = null;
%>
<center>
    <h2 style="color:blue;">Creación de la BD Aerolínea y sus tablas Cliente y Vuelo</h2>
<%
    try {
        Class.forName(driver);
        con_postgres = DriverManager.getConnection(url, user, password);
        bdcrear = con_postgres.createStatement();
        bdcrear.execute(sql_bd);
        con_aerolinea = DriverManager.getConnection(url2, user, password);
        crear_tablas = con_aerolinea.createStatement();
        crear_tablas.execute(sql_tabla_cliente);
        crear_tablas.execute(sql_tabla_vuelo);
%>
    <h3 style="color:green;">Se creó la BD Aerolínea y sus Tablas Cliente y Vuelo</h3>
<%
    } catch (Exception e) {
%>
    <h3 style="color:red;"><%=e.getMessage()%></h3>
<%
    } finally {
        if (bdcrear != null) {
            try {
                bdcrear.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (con_postgres != null) {
            try {
                con_postgres.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (crear_tablas != null) {
            try {
                crear_tablas.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (con_aerolinea != null) {
            try {
                con_aerolinea.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>
    <a href="index.jsp">Regresar</a>
</center>