
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<%

String error = request.getParameter("error");
if(error.equals("true")){
%>
<!DOCTYPE html>
<html>
<body>

<p>Click the button to display an alert box:</p>

<button onclick="myFunction()">Try it</button>

<script>
function myFunction() {
    alert("I am an alert box!");
}
</script>

</body>
</html>

<%
}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Sign in &middot; Twitter Bootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
     <link rel="stylesheet" href="css/gordy_bootstrap.min.css">
     
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <body class="twitter-signin">
    <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container">
                <i class="nav-home"></i> <a href="#" class="brand">!Twitter</a>
        <div class="nav-collapse collapse">
          <p class="navbar-text pull-right">Logged in as <a href="#" class="navbar-link">Username</a>
          </p>
          <ul class="nav">
            <li><a href="index.html">Home</a></li>
            <li><a href="queries.jsp">Test Queries</a></li>
            <li class="active"><a href="twitter-signin.jsp">Main sign-in</a></li>
          </ul>
        </div><!--/ .nav-collapse -->
      </div>
    </div>
  </div>
  <div class="front-bg">
    <img class="front-image" src="images/jp-mountain@2x.jpg">
  </div>
  <div class="front-card">
    <div class="front-welcome">
      <div class="front-welcome-text">
        <h1>Welcome to Twitter</h1>
        <p>Find out what's happening now, the the people and organizations you care about.</p>
      </div>
    </div>

    <div class="front-signin">
      <form action="sign-in.jsp" class="signin" method="post">
        <div class="placeholding-input username hasome">
          <input type="text" class="text-input email-input" name="userin" title="Username or email" autocomplete="on" tabindex="1" placeholder="Username or email">
        </div>
        <table class="flex-table password-signin">
          <tbody>
            <tr>
              <td class="flex-table-primary">
                <div class="placeholding-input password flex hasome">
                  <input type="password" name="password" id="signin-password" class="text-input flext-table-input" title="Password" tabindex="2" placeholder="Password">
                </div>
              </td>
              <td class="flex-table-secondary">
                  <button type="submit" class="submit btn btn-primary flex-table-btn">Sign-in</button>
              </td>
            </tr>
          </tbody>
        </table>
        <div class="remember-forgot">
          <label class="remember">
            <input type="checkbox" name="remember_me" tabindex="3">
            <span>Remember me</span>
          </label>
          <span class="separator">.</span>
          <a href="#" class="forgot">Forgot password?</a>
        </div>
      </form>
    </div>

    <div class="front-signup">
      <h2><strong>New to Twitter?</strong> Sign up</h2>
      <form action="sign-up.jsp" class="signup" method="post">
        <div class="fullname">
          <input type="text" id="signup-full-name" autocomplete="off" maxlength="20" name="username" placeholder="Username">
        </div>
        <div class="email">
          <input type="text" id="signup-user-email" autocomplete="off" maxlength="20" name="email" placeholder="Email">
        </div>
        <div class="password">
          <input type="password" id="signup-user-password" autocomplete="off" maxlength="20" name="password" placeholder="Password">
        </div>
        <button type="submit" class="btn btn-signup">
          Sign up for Twitter
        </button>
      </form>
    </div>

  </div>
<%  
/**if(error = true){

	
<html>
<body>

<script>
    alert("Wrong password!");
</script>

</body>
</html>


}
*/

%>

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
     <script type="text/javascript" src="js/main-ck.js"></script>
  </body>
</html>
