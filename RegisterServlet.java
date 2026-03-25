package com.app;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {

   String name = request.getParameter("name");
   String email = request.getParameter("email");
   String course = request.getParameter("course");
   String regno = request.getParameter("regno");

   PrintWriter out = response.getWriter();

   try {
     Class.forName("com.mysql.cj.jdbc.Driver");

     Connection con = DriverManager.getConnection(
       "jdbc:mysql://localhost:3306/company_db",
       "root","password");

     PreparedStatement ps = con.prepareStatement(
       "INSERT INTO student VALUES(?,?,?,?)");

     ps.setString(1, name);
     ps.setString(2, email);
     ps.setString(3, course);
     ps.setString(4, regno);

     ps.executeUpdate();

     out.println("Student Registered Successfully!");

     con.close();

   } catch(Exception e){
     out.println(e);
   }
 }
}
