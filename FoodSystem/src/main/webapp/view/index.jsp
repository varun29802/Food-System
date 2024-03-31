
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    // Check if user is logged in
    jakarta.servlet.http.HttpSession userSession = request.getSession(false); // do not create session if it doesn't exist
    if (userSession == null || userSession.getAttribute("useremail") == null) {
        // User is not logged in, display a message using JavaScript
%>
<head>

  <script>
    window.onload = function() {
        alert("You need to log in first to access this page.");
        window.location.href = "/";
    };
</script>
</head>
<body>
  <%
    } else {
        // User is logged in, serve the page content
        
%>
<header>
  <a href="#">HOME</a>
  <a href="/viewFoodProduct" class="two">MENU </a>
  <a href="/helpP">HELP</a>
  <a href="/userLogOut">LOGOUT</a>
</header>
<div class="one">
  <nav>
      <h2>WELCOME TO FOOD SYSTEM</h2>
      <br>
      <br>
      <p>Order delicious food online, 100% tasty,quality and safety assured. </p>
      <br>
      <h3>CALL 9876543210 FOR ORDERING</h3>
      <br>

      <h2>OR</h2>
      <br>
      <form action="/viewFoodProduct" method="post">
      <button style="color: red">ORDER NOW</button></form>
  </nav>
</div>

<%
    }
%>
</body>
<style>
 * {
            margin: 0;
        }
        
        body {
        position:fixed;
            background-image: url(https://i.pinimg.com/originals/6e/58/1f/6e581fb70982e576c488457628c72604.jpg) ; background-size: 100% 100%;background-repeat: no-repeat;
        }
        
        header {
        width: 230%;
            padding-top: 10px;
            text-align: center;
            display: flex;
            background-color: #00000080;
            justify-content: center;
        }
        
        .one {
          
            width: 60%;
            height: 100vh;
            color:white;
            margin-left:340px;
            padding: 30px 0 0 30px;
            text-align: center;
            font-size: 20px;
        }
        
        header a {
            display: block;
            text-decoration: none;
            color: white;
            padding: 10px 20px;
            font-size: larger;
        }
        
        button {
            padding: 12px 25px;
            letter-spacing: 1px;
            font-weight: 650;
            border-radius: 6px;
            font-size: large;
        }
        
        p {
            font-size:15px;
            font-style: italic;
        }
        
        button:hover {
            cursor: grab;
            background-color: skyblue;
        }
   a:hover {
     background-color:#b6412c
        
     

</style>