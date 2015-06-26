<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<%
	java.sql.Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String url = "jdbc:mysql://localhost:3306/sthiam";
	conn = DriverManager.getConnection(url, "sthiam", "robo6051gabkam"); //mysql id &  pwd
	String userin = request.getParameter("userin");
	String password = request.getParameter("password");
	String truepw = "";
	String user_id = "";
	java.sql.PreparedStatement find = conn.prepareStatement("select user_id from users_t where password = ? and (username = ? or email = ?)");

	//java.sql.PreparedStatement name = conn.prepareStatement("select user_id from sthiam.users_t where username = ?");
	//java.sql.PreparedStatement pass = conn.prepareStatement("select password from sthiam.users_t where user_t = ?");
	
	
	//if(userin.contains("@")){
		find.setString (1,password);
		find.setString (2,userin);
		find.setString (3,userin);
		java.sql.ResultSet rs = find.executeQuery();
		if(rs.next()){
			user_id = rs.getString(1);
			response.sendRedirect("http://compsci.dalton.org:8080/sthiam/twitter_dir/twitter-home.jsp?key=" + user_id );
		}	
		else{
			response.sendRedirect("http://compsci.dalton.org:8080/sthiam/twitter_dir/twitter-signin.jsp?error=true ");
		}
	//}
	/**
	else{
		find.setString (1,userin);
		java.sql.ResultSet rs1 = find.executeQuery();
		while (rs1.next()){
			user_id = rs1.getString(1);
		}
	}
	*/
%>
