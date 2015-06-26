


<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<%
           java.sql.Connection conn = null;
           Class.forName("com.mysql.jdbc.Driver").newInstance();
           String url = "jdbc:mysql://localhost:3306/sthiam";
	   conn = DriverManager.getConnection(url, "sthiam", "robo6051gabkam"); //mysql id &  pwd
	   String tweet = request.getParameter("tweet");
           String data = request.getParameter("data");
 	   String hashtag = "";

        java.sql.Statement stmt = conn.createStatement();

	java.sql.PreparedStatement ps = conn.prepareStatement("insert into sthiam.tweets_t (tweet, user_id) values (?,?)");

        ps.setString (1,tweet);
	ps.setString (2,data);
        int status = ps.executeUpdate();                                    //attempt insert



//fix
/*

	String[] htweet = tweet.split(" ");
        for(int i = 0; i<htweet.length; i++){
                if(htweet[i].substring(0,1).equalsIgnoreCase("#")){
                        hashtag = htweet[i].substring(1);
                        int hash = stmt.executeUpdate("insert into hash_t set hashtag = '"+hashtag+"'");
                        int hashtweet = stmt.executeUpdate("insert into hashtweet_t (user_id, hash_id) values (" + data + ", (select hash_id from hash_t where hashtag = '" + hashtag + "'))");
                }




	//int rss = stmt.executeUpdate("insert into tweets_t set user_id = " + data + ", set tweet = '" + tweet +"'");
	  /* 
	   if(rss>0){ 
                 out.print("INSERTED");
            }
           else
            {
            out.print("TRY AGAIN");
            }
*/

/*	String[] htweet = tweet.split(" ");
	for(int i = 0; i<htweet.length; i++){
		if(htweet[i].substring(0,1).equalsIgnoreCase("#")){
			hashtag = htweet[i].substring(1);
		        int hash = stmt.executeUpdate("insert into hash_t set hashtag = '"+hashtag+"'");
			int hashtweet = stmt.executeUpdate("insert into hashtweet_t (user_id, hash_id) values (" + data + ", (select hash_id from hash_t where hashtag = '" + hashtag + "'))");
		}

*/	  /*
	   if(hash>0){ 
            out.print("INSERTED");
            }
           else{
            out.print("TRY AGAIN");
            }*/	
	}
	
//total_t

//	response.sendRedirect("http://compsci.dalton.org:8080/sthiam/twitter_dir/twitter-home.jsp?key=" + data );

%>
