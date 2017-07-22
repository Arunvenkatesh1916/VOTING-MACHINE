<%-- 
    Document   : CHANGE
    Created on : Jul 19, 2017, 9:44:08 PM
    Author     : DarkPrince
--%>

<html>
    <head>
        <title>Change is Owners' details </title >
<%@ page import = "java.sql.*" %>
<%! Connection con; Statement st; ResultSet rs; %>
<%
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/car","root","");
String rno=request.getParameter("rno");
String cmd = "Select oname,email,phone,ownadd,vno  from rvehicles where rno='" +rno+"'";
st=con.createStatement();
rs=st.executeQuery(cmd);
if(rs.next())
{ %>
<script language="javascript">
function check()
{
if(document.form1.oname.value=="")
{
alert("Owner name should be entered!");
document.form1.oname.focus();
return;
}
if(document.form1.email.value=="")
{
alert("E-mail should be entered!");
document.form1.email.focus();
return;
}
if(document.form1.phone.value=="")
{
alert("Owners phone number should be entered!");
document.form1.phone.focus();
return;
}
if(document.form1.addr.value=="")
{
alert("Owners address should be entered!");
document.form1.addr.focus();
return;
}

document.form1.submit();

}
</script>
    </head>
<body>
<form name=form1 method=post  action="UPDATE.jsp">
    <center><h1> Vehicle Investigation System </h1> </center>
<font color=red>
<h3>Change necessary Details </h3></font>
<font size=4 color=Blue> <table>
<tr><td>Owner Name : 
<td> <input type=text name=oname value="<%= rs.getString(1) %>">
<tr> <td> E-mail     : 
<td> <input type=text name=email value="<%= rs.getString(2) %>">
<tr> <td>Phone      : 
<td> <input type=text name=phone value="<%= rs.getString(3) %>"> 
<tr> <td>Address    : 
<td><input type=text name=addr value="<%= rs.getString(4) %>">
</tr></table></font>
<input type=hidden name=myvno value="<%= rs.getString(5) %>">
<input type=button value=" Go " onClick="check()">
</form>
<%
} else {
%>
<%@include file="change.html" %>
<script>alert("Invalid Register Number! Retype."); </script>
<% } %>
</body>
</html>
