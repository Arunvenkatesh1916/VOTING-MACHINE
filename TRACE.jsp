<%-- 
    Document   : TRACE
    Created on : Jul 19, 2017, 9:48:07 PM
    Author     : DarkPrince
--%>

<html><title>Tracing stolen vehicle</title>
<%@ page import = "java.sql.*" %>
<%! Connection con; ResultSet rs; Statement st;  %>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/car","root","");
String rno=request.getParameter("rno");
String cmd = "select * from foundlist where rno='"+rno+"'";
st=con.createStatement();
rs=st.executeQuery(cmd);
if(rs.next())
{
    %>
    <%@ include file="trace.html" %>
    <%
out.println("<font color=red size=4><center>");
out.println("Whereabouts of the vehicle can be");
out.println("obtained from the following addresses :<br>");
out.println("<u>First Address</u> : <br>");
out.println("<br>Name : "+rs.getString(5));
out.println("<br>Address:"+rs.getString(6));
out.println("<br>E-mail:"+ rs.getString(7));
out.println("<br>Phone:"+rs.getString(8));
out.println("<br><u>Second address</u>: <br>");
out.println("<br>Name:"+rs.getString(9));
out.println("<br>Address:"+rs.getString(10));
out.println("<br>E-mail:"+rs.getString(11));
out.println("<br>Phone:"+rs.getString(12));
out.println("</font></center><hr>");
%>  <%

}
else
{
response.sendRedirect("notrace.jsp");
%>
<%
}
}
catch(Exception e)
{
e.printStackTrace();
out.println(e);
}
%>
</body></html>