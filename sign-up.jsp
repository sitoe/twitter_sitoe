<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>
<%
	java.sql.Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String url = "jdbc:mysql://localhost:3306/sthiam";
	conn = DriverManager.getConnection(url, "sthiam", "robo6051gabkam"); //mysql id &  pwd
	String name = request.getParameter("username");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String user_id = "";
	
	java.sql.Statement stmt = conn.createStatement();
	java.sql.PreparedStatement ps = conn.prepareStatement("insert into sthiam.users_t (username, email, password, name) values (?,?,?,?)");
	ps.setString (1,name);
	ps.setString (2,email);
	ps.setString (3,password);
	ps.setString (4,name);



	int status = ps.executeUpdate();                                    //attempt insert

	java.sql.PreparedStatement ps2 = conn.prepareStatement("select user_id from sthiam.users_t where username = ?");
	ps2.setString (1,name);
	java.sql.ResultSet rs = ps2.executeQuery();
	while (rs.next()){
		user_id = rs.getString(1);
	}
	
	java.sql.PreparedStatement ps3 = conn.prepareStatement("insert into stalk_t (stalker, stalkee) values (?,?)");
	ps3.setString (1,user_id);
	ps3.setString (2,user_id);
	int status2 = ps3.executeUpdate();                                    //attempt insert

	
	out.println(user_id);

	out.println(email);
	out.println(name);
	out.println(password);


	int data = Integer.parseInt(user_id);
	
	response.sendRedirect("http://compsci.dalton.org:8080/sthiam/twitter_dir/twitter-home.jsp?key=" + data );

//also, for acsl, make a hashmap with Arraylist of 4 for keys so you can do both back and forward possibilities
%>
