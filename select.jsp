<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<HTML>
<HEAD>
<TITLE>Select Student</TITLE>
</HEAD>
<BODY BGCOLOR="white">
<img src = "dalton.jpg">
<H3> OPTIONS MENU </H3>
<%
	int count = 0;     

//	String data = request.getParameter("key"); 	
//	out.println(data);
String data = "1";
      try {
	out.println("the key is: " + data);

	java.sql.Connection con = null;
         String url = "http://compsci.dalton.org:8080/sthiam/twitter_dir/select.jsp";

         //sql query:
	 String query = "select * from users_t where user_id = " + data; //get all rows int he student database

	 //open sql:
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         url = "jdbc:mysql://localhost:3306/sthiam";   //your db ex) ljadow
         con = DriverManager.getConnection(url, "sthiam", "robo6051gabkam"); //mysql id &  pwd
         java.sql.Statement stmt = con.createStatement();
         
	 //executes the query:
	 java.sql.ResultSet rs = stmt.executeQuery(query);


	//loop through result set until there is not a next:
         while(rs.next())
	 {
		tweet_count = rs.getString("tweet_count");
	 	count = count +1;

	 } //end while

      } catch (Exception e) {
         out.println(e);
      }

%>

	<h1> count is: <%=count%>

</BODY>
</HTML>


