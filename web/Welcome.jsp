<%-- 
    Document   : Welcome
    Created on : 1 Nov, 2018, 9:30:14 AM
    Author     : hardeep
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        <style>
		@font-face
		{
			font-family: DS Digi;
			src: url('sources/DS-DIGI.TTF')
		}
		@font-face
		{
			font-family: Orange Juice;
			src: url('sources/orange juice 2.0.ttf');
		}
		*
		{
			font-family: Segoe UI;
		}
		legend
		{
			color: crimson;
		}
		iframe
		{
			border: 10px solid grey;
			border-radius: 10px;
		}
		button
		{
			padding: 10px 10px 10px 10px;
			border-radius: 5px;
			background-color: crimson;
			color: white;
			float: right;
			font-size: 20px;
			font-family: Impact;
			margin: 0px 5px 5px 0px;
		}
		button:hover
		{
			background-color: black;
		}
		#timebox
		{
			background-color: black;
			color: white;
			font-family: DS Digi;
			font-size: 20px;
			text-align: right;
			padding: 12px;
			border-radius: 10px;
		}
		h2
		{
			float: right;
			color: crimson;
			font-family: Segoe Print;
			background-color: white;
			border-radius: 10px;
			padding: 10px;
		}
		h2:hover
		{
			color: black;
			cursor: default;
		}
		</style>

    </head>
    <body background = "sources/wedding_couple.jpg" style = "background-attachment: fixed;">
        <%
     String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
            
            
            try
            {
                String myUrl = "jdbc:mysql://localhost:3306/acadview";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(myUrl,"root","");
            //out.println("Hello 1");

                String query = "Select userid,password from user1 where userid='"+uname+"' and password ='"+pass+"'";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                
               if(rs.next())
                {
                    out.println("Logged in successfully");
                   out.print("Hello "+uname);}
               else
                  // out.println("Username or Password does not exists");
                st.close();
            }
            catch(ClassNotFoundException e)
            {
                out.print(e);
            }
            catch(SQLException e)
            {
                out.print(e);
            }
            
           %>
           <div style = "margin: 50px 100px 100px 100px;">
		
		
		<br><br>
                <pre> <B><I>Welcome to this website: <%=uname%>! </B></I></pre>
                <iframe src = "buttons_admin.html" name = "tabs" width = "100%" height = "44px"> iframe1 </iframe><br><br>
          	<iframe src = "dashboard.html" name = "output" width = "100%" height = "600px"> iframe2 </iframe>
 
           		<a href = "logout.jsp" target = "_top"><button type="button"> Logout </button></a>

           
           </body>
</html>
