<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Statement"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRS</title>
    <link rel="stylesheet" href="upreservestyle.css">
</head>
<body>
    <div class="container">
        <h1>Update Reservations</h1>
        <table class="reservations-table">
            <thead>
                <tr>
                    <th>Reservation ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Room Type</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Room no.</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <%try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db","root","1234");
            Statement st = con.createStatement();
            String str = "select * from reservation";
            ResultSet rs= st.executeQuery(str);
            while(rs.next()){
            	%>
            <tbody>
                <!-- Placeholder for dynamic data -->
                <tr>
                    <td><%=rs.getInt("gid") %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(3) %></td>
                    <td><%=rs.getString(4) %></td>
                    <td><%=rs.getString(5) %></td>
                    <td><%=rs.getString(6) %></td>
                    <td><%=rs.getString(7) %></td>
                    <% 
                // Loop to generate random numbers
                Random random = new Random();
        int roomNo = 100 + random.nextInt(20);
             %>
             <td>
             <%= roomNo %>
             </td>
       
                    <td><a href="editreservation.jsp" class="edit-btn">Edit</a></td>
                </tr>
            <%
            
            } 
            
            }catch (Exception e){
            
        } %>
        </table>
        <a href="adminDashboard.html" class="back-btn">Back to Dashboard</a>
    </div>
</body>
</html>
