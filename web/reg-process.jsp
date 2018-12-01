<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String number=request.getParameter("number");
String password=request.getParameter("password");
String confirmpassword=request.getParameter("confirmpassword");
try
{
    Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/acadview", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into hardeep(name,email,number,password,conmfirmpassword)values('"+name+"','"+email+"','"+number+"','"+password+"','"+confirmpassword+"')");
out.println("Thank you for register ! Please <a href='meralogin.html'>Login</a> to continue.");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>


