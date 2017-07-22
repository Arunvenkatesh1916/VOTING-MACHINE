<%-- 
    Document   : STOLEN
    Created on : Jul 19, 2017, 9:47:29 PM
    Author     : DarkPrince
--%>

<html>
    <head>
    <Title> CARD project </title> 
    </head>
    <body>
<%@ page import = "java.sql.*" %>
<%! Connection con; Statement st; ResultSet rs,rs1; %>
<%
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/car","root","");
      String sql = "select * from rvehicles where rno='"+ request.getParameter("rno")+"'";
      st=con.createStatement();
       rs=st.executeQuery(sql);
if(!rs.next())
{ %>
<script>alert("Wrong Registration Number. Retype");</script>
<%@ include file="stolen.html" %>
<%
} else
{
String rno=request.getParameter("rno");
String vno=request.getParameter("vno");
String date=request.getParameter("date");
String cmd= "insert into stolenlist values('"+rno+"','"+vno+"','"+date+"')";
st.execute(cmd); 
}
%>
<%@ include file="stolen.html" %>
<script>alert("Your vehicle registered in 'stolen vehicles' database. When information about it is available we will inform you to the email");</script>
</body>
</html>

