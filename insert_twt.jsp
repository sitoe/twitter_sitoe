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
	int tweet_id = 0;
	int hash_id = 0;
	int hashcon = -1;
	
	if(tweet.equals("")){
		response.sendRedirect("http://compsci.dalton.org:8080/sthiam/twitter_dir/twitter-home.jsp?key=" + data );
	}
	
	else{
	
	out.println(" tweet is: "  + tweet); //WORKS
	out.println(" user is: " + data); //WORKS


	java.sql.Statement stmt = conn.createStatement();

	java.sql.PreparedStatement contains = conn.prepareStatement("SELECT count(*) FROM hash_t WHERE hashtag = ?");
	java.sql.PreparedStatement ps4 = conn.prepareStatement("insert into hashtweet_t (tweet_id, hash_id) values (?,?)");
    java.sql.PreparedStatement ps5 = conn.prepareStatement("select hash_id from sthiam.hash_t where hashtag = ?");
    java.sql.ResultSet rs2;
	
	java.sql.PreparedStatement ps = conn.prepareStatement("insert into sthiam.tweets_t (tweet, user_id) values (?,?)");
	ps.setString (1,tweet);
	ps.setString (2,data);
	int status = ps.executeUpdate();                                    //attempt insert

	java.sql.PreparedStatement ps2 = conn.prepareStatement("select tweet_id from sthiam.tweets_t where tweet = ?");
	ps2.setString (1,tweet);
	java.sql.ResultSet rs = ps2.executeQuery();
	while (rs.next()){
	tweet_id = rs.getInt(1);
	}
	out.println(" tweet_id is: " + tweet_id); //WORKS
	//Hashtag time
	/*
	So now I essentially have to break up the tweet into words. If the first char is #, its a hashtag. Add is to the table with the tweet_id.
	*/
	
	String[] htweet = tweet.split(" ");
        for(int i = 0; i<htweet.length; i++){
            if(htweet[i].substring(0,1).equalsIgnoreCase("#")){
            	hashtag = htweet[i].substring(1);
            	contains.setString (1,hashtag);
            	java.sql.ResultSet con = contains.executeQuery();
            	while(con.next()){
            		hashcon = con.getInt(1);
            		}out.println(" hashcon is: " + hashcon);
           
            if(hashcon==0){
            
                java.sql.PreparedStatement ps3 = conn.prepareStatement("insert into hash_t set hashtag = '"+hashtag+"'");
                int status3 = ps3.executeUpdate();
				ps5.setString (1,hashtag);
				rs2 = ps5.executeQuery();
				while (rs2.next()){
					hash_id = rs2.getInt(1);
				}out.println(" hash_id is: " + hash_id);
            	
            	ps4.setInt (1, tweet_id);
            	ps4.setInt (2, hash_id);
            	int status4 = ps4.executeUpdate();

          }
            else{  
				ps5.setString (1,hashtag);
				rs2 = ps5.executeQuery();
				while (rs2.next()){
					hash_id = rs2.getInt(1);
				}out.println(" hash_id is: " + hash_id);
				
				ps4.setInt (1, tweet_id);
            	ps4.setInt (2, hash_id);
            	int status4 = ps4.executeUpdate();

            }
        }
        }
    out.println(" hash is: " + hashtag); //WORKS
	response.sendRedirect("http://compsci.dalton.org:8080/sthiam/twitter_dir/twitter-home.jsp?key=" + data );
	}

//also, for acsl, make a hashmap with Arraylist of 4 for keys so you can do both back and forward possibilities
%>
