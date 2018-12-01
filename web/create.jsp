<%@page import="java.sql.Time"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String Name=request.getParameter("Name");   
String ID=request.getParameter("ID");
String Time=request.getParameter("Enter Time");
String Contact=request.getParameter("Contact No.");

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/acadview", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into createform(Name,ID,Time,Contact)values('"+Name+"','"+ID+"','"+Time+"','"+Contact+"')");
out.println("Thank you for register ! Please <a href='newwelcome.html'>Login</a> to continue.");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>


