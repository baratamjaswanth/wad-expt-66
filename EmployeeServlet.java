package com.app;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class EmployeeServlet extends HttpServlet {

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {

   String empId = request.getParameter("emp_id");
   PrintWriter out = response.getWriter();

   try {
     Class.forName("com.mysql.cj.jdbc.Driver");

     Connection con = DriverManager.getConnection(
       "jdbc:mysql://localhost:3306/company_db",
       "root","password");

     PreparedStatement ps = con.prepareStatement(
       "SELECT * FROM employee WHERE emp_id=?");

     ps.setInt(1, Integer.parseInt(empId));

     ResultSet rs = ps.executeQuery();

     if(rs.next()){
       out.println("<h2>Employee Details</h2>");
       out.println("ID: "+rs.getInt("emp_id")+"<br>");
       out.println("Name: "+rs.getString("emp_name")+"<br>");
       out.println("Dept: "+rs.getString("department")+"<br>");
       out.println("Salary: "+rs.getDouble("salary"));
     } else {
       out.println("No Employee Found");
     }

     con.close();

   } catch(Exception e){
     out.println(e);
   }
 }
}
