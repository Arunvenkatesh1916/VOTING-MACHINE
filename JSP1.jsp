<%-- 
    Document   : JSP1
    Created on : Jul 19, 2017, 9:46:18 PM
    Author     : DarkPrince
--%>

<html>
<body>
<%@ page import = "java.sql.*" %>
<%! Connection con; Statement st; ResultSet rs,rs1; %>
<%
try{
int i=0; String d="";
Connection con = null;
PreparedStatement ps = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/car","root","");
String thisrno=request.getParameter("rno");             
String thisvno = request.getParameter("vno");
int thiswh = Integer.parseInt( request.getParameter("wheels") );
String thismodel = request.getParameter("model");
String thisrtono =request.getParameter("rtono");
String thisoname=request.getParameter("oname");
String thisemail=request.getParameter("email");
String  thisphone= request.getParameter("phone");
String thisaddr=request.getParameter("addr");
String thisdate=request.getParameter("date");
ps = con.prepareStatement("insert into rvehicles(rno,vno,wheels,vtype,rtono,oname,"
            + "email,phone,ownadd,regdate)  values('" +thisrno+"','"+thisvno+"',"+thiswh+
            ",'"+thismodel+"','"+thisrtono+"','"+thisoname+
            "','"+thisemail+"','"+thisphone+"','"+thisaddr+
              " ','"+thisdate+"')" );       
ps.execute();
}catch(Exception e)
{    
response.sendRedirect("duplicate.jsp");
}
%>
<%@ include file="newreg.html"  %>  
<script>alert("Registration Successful Remember the following registration number for future reference");</script>
</body>
</html>