

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class bookevent extends HttpServlet {

    /**
     *
     * @param req
     * @param res
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        String name = req.getParameter("FIRST NAME");
        String email = req.getParameter("EMAIL");
        String eventname = req.getParameter("EVENT NAME");
        String eventtime = req.getParameter("EVENT TIME");
       String eventdate = req.getParameter("EVENT DATE");
       String mobileno = req.getParameter("MOBILE NO.");
       
            try {
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080/acadview","root","");
                    Class.forName("com.mysql.jdbc.Driver");
                String query="insert into history (FIRST NAME,EMAIL,EVENT NAME,EVENT DATE,EVENT TIME,MOBILE NO.) values ('"+name+"','"+email+"','"+eventname+"','"+eventtime+"','"+eventdate+"','"+mobileno+"')";
                Statement st=con.createStatement();
                int i= st.executeUpdate(query);
            if(i>0)
                res.sendRedirect("newwelcome.html");
            }
        catch(IOException | ClassNotFoundException | SQLException e)
        {
        out.println(e.getMessage());
        }
    }

}


