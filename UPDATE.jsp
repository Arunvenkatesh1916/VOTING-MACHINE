<%-- 
    Document   : UPDATE
    Created on : Jul 19, 2017, 9:48:33 PM
    Author     : DarkPrince
--%>
<html><title> Update in progress...</title>

<%@ page import = "java.sql.*" %>
<%! Connection con; Statement st; ResultSet rs; %>

<%
        Connection con = null;
        PreparedStatement ps = null;
        Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost/car","root","");
String s1=request.getParameter("oname");
String s2=request.getParameter("email");
String s3=request.getParameter("phone");
String s4=request.getParameter("addr");
String s5=request.getParameter("myvno");
ps = con.prepareStatement("update rvehicles set oname='"+s1+"',email='"+
 s2+"',phone="+ s3 +",ownadd='"+ s4 +"' where vno='"+s5+"'");
%>
<%
ps.execute();
%>
<%@include file="change.html" %>
<script>alert("Record Updated");
</script>
</body>
</html>

     
