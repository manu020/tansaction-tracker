<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: transparent; /* Remove background color */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Change shadow color here */
            border-radius: 5px;
            text-align: center;
            color: #000; /* Set text color to black or any color you prefer */
            border: 2px solid #007BFF; /* Add a prominent border */
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="date"],
        input[type="radio"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        /* Style for radio button container */
        .horizontal-radio {
            display: flex;
            gap: 10px;
        }

        /* Style for individual radio buttons */
        .radio-button {
            flex-grow: 1;
            cursor: pointer;
            padding: 6px 16px;
            background-color: #eee;
            color: #333;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
        }

        /* Style for selected radio button */
        .radio-button.selected {
            background-color: #007BFF;
            color: #fff;
        }

        .form-group:last-child {
            text-align: center;
        }

        input[type="submit"] {
            background-color: #007BFF; /* Change button color here */
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        textarea {
            max-height: 200px; /* Set a maximum height */
            overflow-y: auto; /* Enable vertical scrolling if content exceeds max height */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Transaction Form</h1>
        <form method="post">
            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="transaction_date" required>
            </div>
            <div class="form-group">
                <label>Transaction Type:</label>
                <div class="horizontal-radio">
                    <label class="radio-button">
                        <input type="radio" name="transaction_type" value="credit" required> Credit
                    </label>
                    <label class="radio-button">
                        <input type="radio" name="transaction_type" value="debit" required> Debit
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="amount">Amount:</label>
                <input type="text" id="amount" name="transaction_amount" required>
            </div>
            <div class="form-group">
                <label for="note">Note:</label>
                <textarea rows="5" cols="40" name="transaction_note" required></textarea>
            </div>
            <div class="form-group">
                <input type="submit" value="Save Transaction">
            </div>
        </form>
        <%
        try{
        if (request.getMethod().equalsIgnoreCase("post")){
            String date=request.getParameter("transaction_date");
            String type=request.getParameter("transaction_type");
            float amount=Float.parseFloat(request.getParameter("transaction_amount"));
            String note=request.getParameter("transaction_note");
         String url = "jdbc:mysql://localhost:3306/bank";

    			String uname = "root";
    			String pass = "939164";
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con = DriverManager.getConnection(url, uname, pass);
               // Connection con=ConnectionProvider.getCon();
                String insert="insert into transactions(transaction_date,transaction_type,transaction_amount,transaction_note)values (?,?,?,?);";
                PreparedStatement pst=con.prepareStatement(insert);
                
                pst.setString(1, date);
                pst.setString(2, type);
                pst.setFloat(3, amount);
                pst.setString(4, note);
                int rows=pst.executeUpdate();
                if(rows>0)
                    out.println("Inserted successfully");
                else 
                    out.println("Not inserted");
                
                con.close();
            }
        }
            catch(SQLException e){
                e.printStackTrace();
            }  
            
        %>
        <a class="main-button" href="home.jsp">Back To Home Page</a>
    </div>
</body>
</html>
