<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<%
     // try {
	
	
	java.sql.Connection conn = null;
	String total_t = "";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String url = "jdbc:mysql://localhost:3306/sthiam";
	conn = DriverManager.getConnection(url, "sthiam", "robo6051gabkam"); //mysql id &  pwd
	//String tweet = request.getParameter("tweet");
	String data = request.getParameter("user");
	String thishash_id = request.getParameter("hash_id");
	java.sql.Statement stmt = conn.createStatement();
       
	int count = 0;
	int count2 = -1;
	int count3 = -1;

	java.sql.ResultSet tweetnum = stmt.executeQuery("select * from tweets_t where user_id = " +data );
	while(tweetnum.next()){
		total_t = tweetnum.getString("tweet_id");
		count+=1;
	}
	java.sql.ResultSet stalkees = stmt.executeQuery("select * from stalk_t where stalkee = " +data );
	String following = "";
	while(stalkees.next()){
 		following = stalkees.getString("stalker");
		count2+=1;
	}
    java.sql.ResultSet stalkers = stmt.executeQuery("select * from stalk_t where stalker = " +data );
	String followers = "";
	while(stalkers.next()){
                followers = stalkers.getString("stalker");
                count3+=1;
        }
	
	String new_tweet = "";	
       
    //String data = request.getParameter("data");

	java.sql.ResultSet myName = stmt.executeQuery("select * from users_t where user_id = " + data);
	String maName = "";
	while(myName.next()){	
		maName = myName.getString("username");
	}
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <meta name="description" content="">
    <meta name="author" content="">
    <style type="text/css">
    	body {
    		padding-top: 60px;
    		padding-bottom: 40px;
    	}
    	.sidebar-nav {
    		padding: 9px 0;
    	}
    </style>    
    <link rel="stylesheet" href="css/gordy_bootstrap.min.css">
</head>
<body class="user-style-theme1">
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
                <i class="nav-home"></i> <a href="#" class="brand">!Twitter</a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right">Logged in as <a href="#" class="navbar-link">Username</a>
					</p>
					<ul class="nav">
						<li class="active"><a href="index.html">Home</a></li>
						<li><a href="queries.html">Test Queries</a></li>
						<li><a href="twitter-signin.jsp">Main sign-in</a></li>
					</ul>
				</div><!--/ .nav-collapse -->
			</div>
		</div>
	</div>

    <div class="container wrap">
        <div class="row">

            <!-- left column -->
            <div class="span4" id="secondary">
                <div class="module mini-profile">
                    <div class="content">
                        <div class="account-group">
                            <a href="#">
                                <img class="avatar size32" src="images/pirate_normal.jpg" alt="Gordy">
                                <b class="fullname"><%=maName%></b>
		                <small class="metadata">View my profile page</small>
                            </a>
                        </div>
                    </div>
                    <div class="js-mini-profile-stats-container">
                        <ul class="stats">
                            <li><a href="#"><strong><%=count%></strong>Tweets</a></li>
                            <li><a href="twitter-following.html"><strong><%=count3%></strong>Following</a></li>
			    <li><a href="#"><strong><%=count2%></strong>Followers</a></li>
                        </ul>
                    </div>
<%
//<input type="text" name="tweet">
//<textarea class="tweet-box" placeholder="Compose new Tweet..." id="tweet-box-mini-home-profile"></textarea>
%>

        <form name="tweeting" action="insert_twt.jsp">
            <input type="text" name= "tweet" placeholder ="Compose new Tweet" id="tweet-box-mini-home-profile">
           	<input type= "submit" value="Tweet">
			<input type="hidden" value="<%=data%>" name="data">		
		    </form>
                </div>
                <div class="module other-side-content">
                    <div class="content">
                        <p>Some other content here</p>
                    </div>
                </div>
            </div>

            <!-- right column -->
            <div class="span8 content-main">
                <div class="module">
                <div class="module">
            <!-- right column -->
            <div class="span8 content-main">
                <div class="module">
                    <div class="content-header">
                        <div class="header-inner">
                            <h2 class="js-timeline-title">Tweets</h2>
                        </div>
                    </div>

                    <!-- new tweets alert -->
                    <div class="stream-item hidden">
                        <div class="new-tweets-bar js-new-tweets-bar well">
                            2 new Tweets
                        </div>
                    </div>

                    <!-- all tweets -->
                    <div class="stream home-stream">
<%
int twtid = 0;
String usern = "";
String s = "";
String name = "";
java.sql.PreparedStatement userstuffs = conn.prepareStatement("select name from users_t where user_id = (select user_id from tweets_t where tweet_id = ?)");
java.sql.PreparedStatement userstuffs2 = conn.prepareStatement("select username from users_t where user_id = (select user_id from tweets_t where tweet_id = ?)");
java.sql.PreparedStatement hashrel = conn.prepareStatement("select tweet_id from sthiam.hashtweet_t where hash_id = ? ");
java.sql.PreparedStatement prnthash = conn.prepareStatement("select tweet from sthiam.tweets_t where tweet_id = ? ");

hashrel.setString (1, thishash_id);
java.sql.ResultSet rel = hashrel.executeQuery();
	while(rel.next()){
		twtid = rel.getInt(1);

   		userstuffs.setInt (1,twtid);
    	userstuffs2.setInt (1,twtid);
    	prnthash.setInt (1,twtid);
    
   		java.sql.ResultSet user = userstuffs.executeQuery();
		while(user.next()){
			name = user.getString(1);
		}
	
		java.sql.ResultSet user2 = userstuffs2.executeQuery();
		while(user2.next()){
			usern = user2.getString(1);
		}

		java.sql.ResultSet print = prnthash.executeQuery();
		while(print.next()){
			s = print.getString(1);
		}


%>
                        <!-- start tweet -->
                        <div class="js-stream-item stream-item expanding-string-item">
                            <div class="tweet original-tweet">
                                <div class="content">
                                    <div class="stream-item-header">
                                        <small class="time">
                                            <a href="#" class="tweet-timestamp" title="10:15am - 16 Nov 12">
                                                <span class="_timestamp">6m</span>
                                            </a>
                                        </small>
                                        <a class="account-group">
                                            <img class="avatar" src="images/obama.png" alt="Barak Obama">
                                            <strong class="fullname"><%=name%></strong>
                                            <span>&rlm;</span>
                                            <span class="username">
                                                <s>@</s>
                                                <b><%=usern%></b>
                                            </span>
                                        </a>
                                    </div>

                                   
					 <p class="js-tweet-text">
                                  <%
String hashtag = "";
String hash_id = "";

String[] twtsplt = s.split(" ");
for(int a =0; a<twtsplt.length; a++){
	hash: if(twtsplt[a].substring(0,1).equalsIgnoreCase("#")){
	if(twtsplt[a].substring(1).contains("#")){
		%>
			<%=twtsplt[a]+" "%>
			<%
			break hash;
		}
	hashtag = twtsplt[a].substring(1);
	java.sql.PreparedStatement hashid = conn.prepareStatement("select hash_id from hash_t where hashtag = ?");
   	hashid.setString (1,hashtag);

java.sql.ResultSet hash = hashid.executeQuery();

while(hash.next()){
	hash_id = hash.getString(1);
}
%> 
	<a href="http://compsci.dalton.org:8080/sthiam/twitter_dir/hash-list.jsp?user=<%=data%>&hash_id=<%=hash_id%>">#<%=hashtag%></a>
<%
	}
	else{
%> 
<%=twtsplt[a]+" "%>
<%
	}
}
%>
                                            <span class="invisible">http://</span>
                                            <%
                                           // <span class="js-display-url">OFA.BO/xRSG9n</span>
                                            %>
                                            <span class="invisible"></span>
                                            <span class="tco-ellipsis">
                                                <span class="invisible">&nbsp;</span>
                                            </span>
                                        </a>
                                    </p>
                                </div>
                            </a>
                                <div class="expanded-content js-tweet-details-dropdown"></div>
                            </div>
                        </div><!-- end tweet -->
<%
					
	}
%>
                    <div class="stream-footer"></div>
                    <div class="hidden-replies-container"></div>
                    <div class="stream-autoplay-marker"></div>
                </div>
                </div>
               
            </div>
        </div>
    </div>
     <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
     <script type="text/javascript" src="js/main-ck.js"></script>
  </body>
</html>
