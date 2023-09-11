<%@page import="java.sql.DriverManager"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="dbconnection.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Details</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:nth-child(odd) {
            background-color: #e6f7ff;
        }

        th {
            background-color: #007BFF;
            color: white;
        }
    </style>
</head>
<body>
    <h2 align="center">Your Transaction History</h2>
    
    <br/>
    <table>
        <tr>
            <th>Transaction ID</th>
            <th>Transaction Date</th>
            <th>Transaction Type</th>
            <th>Transaction Amount</th>
            <th>Transaction Note</th>
        </tr>
        <%
            try {
            	String url = "jdbc:mysql://localhost:3306/bank";

    			String uname = "root";
    			String pass = "939164";
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con = DriverManager.getConnection(url, uname, pass);
                //Connection con = ConnectionProvider.getCon();
                String query = "select * from transactions;";
                PreparedStatement pst = con.prepareStatement(query);

                ResultSet set = pst.executeQuery();

                while (set.next()) {
                    int transactionId = set.getInt("transaction_id");
                    java.sql.Date transactionDate = set.getDate("transaction_date");
                    String date = transactionDate.toString();
                    LocalDate localDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                    DateTimeFormatter date1 = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
                    String s = date1.format(localDate);
                    String transactionType = set.getString("transaction_type");
                    float transactionAmount = set.getFloat("transaction_amount");
                    String transactionNote = set.getString("transaction_note");
        %>
                    <tr>
                        <td><%= transactionId %></td>
                        <td><%= s %></td>
                        <td><%= transactionType %></td>
                        <td><%= transactionAmount %></td>
                        <td><%= transactionNote != null ? transactionNote : "" %></td>
                    </tr>
        <%
                }
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>
    <a class="main-button" href="home.jsp">Back To Home Page</a>   
</body>
</html>
