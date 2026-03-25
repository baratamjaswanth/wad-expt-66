<%@ page import="java.sql.*" %>
<%@ page import="DBConnection" %>

<html>
<head>
<title>Registered Students</title>
</head>
<body>

<h2>📋 Registered Students List</h2>

<!-- 🔍 SEARCH -->
<form method="get">
    Search by Name:
    <input type="text" name="search">
    <input type="submit" value="Search">
</form>

<br>

<table border="1" cellpadding="10">
<tr>
    <th>S.No</th>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Course</th>
</tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

int count = 1;

try {
    con = DBConnection.getConnection();

    String search = request.getParameter("search");

    if(search != null && !search.trim().equals("")) {
        ps = con.prepareStatement(
            "SELECT * FROM students WHERE name LIKE ?"
        );
        ps.setString(1, "%" + search + "%");
    } else {
        ps = con.prepareStatement("SELECT * FROM students");
    }

    rs = ps.executeQuery();

    boolean hasData = false;

    while(rs.next()){
        hasData = true;
%>

<tr>
    <td><%= count++ %></td>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("course") %></td>
</tr>

<%
    }

    if(!hasData){
%>
<tr>
    <td colspan="5">❌ No students registered</td>
</tr>
<%
    }

} catch(Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e){}
    try { if(ps != null) ps.close(); } catch(Exception e){}
    try { if(con != null) con.close(); } catch(Exception e){}
}
%>

</table>

<br>
<a href="index.html">➕ Add New Student</a>

</body>
</html>
