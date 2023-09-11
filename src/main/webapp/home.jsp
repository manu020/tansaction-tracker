<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Transaction Details</title>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	margin: 0;
	padding: 0;
	background-image: url(images/background.jpg);
	width: 100%;
	height: 100vh;
	background-position: center;
	background-size: cover; /* Added to make the image fit and cropped */
}

h1 {
	margin: 0;
}

.container {
	max-width: 960px;
    margin: 20px auto;
    padding: 20px;
    background-color: #e3eef0b0;
    border-radius: 10px;
    box-shadow: 0 2px 9px 3px #698996;
}

nav ul {
	list-style: none;
	padding: 0;
	display: flex;
	justify-content: flex-end;
}

nav li {
	margin: 0 10px;
}

nav a {
	text-decoration: none;
	color: #555;
	font-weight: bold;
}

.main-content {
	margin-top: 30px;
}

.main-button {
	    display: inline-block;
    padding: 12px 24px;
    background-color: #1A237E;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.main-button:hover {
	background-color: #66000a;
}
.feature-cards {
            display: flex;
            justify-content: space-around;
            margin-top: 40px;
        }

        .feature-card {
               background-color: #F5F5F5;
    border-radius: 19px;
    padding: 20px;
    margin: 10px 4px;
    width: 30%;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s;
}
        

        .feature-card:hover {
            transform: scale(1.05);
        }
</style>
</head>
<body>
	<div class="container">
		<div class="main-content">
			<h2>Transaction Tracker</h2>
			  <a class="main-button" href="transaction.jsp">Add New Transaction</a> 
			  <a class="main-button" href="history.jsp">Transaction History</a>
		</div>
		<h3>Our daily transaction management platform empowers you to effortlessly track your finances</h3>
		<h3> Keep Your financial data Secure and Confidential</h3>
		 
       
	</div>
</body>
</html>
