<%-- 
    Document   : SECONDS
    Created on : Jul 19, 2017, 9:46:58 PM
    Author     : DarkPrince
--%>

<html> <Title> Checking Second-hand vehicle status </title>
<%@ page import ="java.sql.*" %>
<%! Connection con; ResultSet rs; Statement st; %>
<%
try{
      Connection con = null;
        PreparedStatement ps = null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/car","root","");
         String sql = "select rno from stolenlist where vno='"+ request.getParameter("vno")+"'";
        st=con.createStatement();
       rs=st.executeQuery(sql);
if(rs.next())
{
String thisrno=request.getParameter("rno");             
String thisvno = request.getParameter("vno");
int thiswh = Integer.parseInt( request.getParameter("wheels") );
String thismodel = request.getParameter("model");
String thisoname=request.getParameter("oname");
String thisemail=request.getParameter("email");
String  thisphone=request.getParameter("phone");
String thisaddr=request.getParameter("addr");
String thisdate=request.getParameter("date");
String usrnme=request.getParameter("uname");
String usradd=request.getParameter("uaddr");
String usrpho=request.getParameter("uphone");
String usrmail=request.getParameter("uemail");
ps = con.prepareStatement("insert into foundlist values('" +thisrno+"','"+thisvno+"',"+thiswh+
            ",'"+thismodel+"','"+thisoname+
            "','"+thisaddr+" ','"+thisemail+"',"
            + "'"+thisphone+"','"+usrnme+
              " ','"+usradd+" ','"+usrmail+
              " ','"+usrpho+" ','"+thisdate+"')" );
ps.execute();
%>
<% response.sendRedirect("complaint.jsp"); %>
<%
}
else
{
%>
<%@ include file="seconds.html" %>
    <script>alert("No complaint against the vehicle is registered it can be purchased...");</script>
<%
}
}catch(Exception e)
{
e.printStackTrace();
out.println(e);

}
%>
</body>
</html>