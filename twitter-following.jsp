<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<%
String data = request.getParameter("key");
String id = request.getParameter("id");


     // try {
	int count = 0;
	int scount = 0;
    int count2 = -1;
    int scount2 = -1;
	int count3 = -1;
	int scount3 = -1;

    java.sql.Connection con = null;
	String total_t = "";
	String url = "";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	url = "jdbc:mysql://localhost:3306/sthiam"; 
        con = DriverManager.getConnection(url, "sthiam", "robo6051gabkam"); //mysql id &  pwd
        java.sql.Statement stmt = con.createStatement();

	
	//User tweet count
	java.sql.ResultSet tweetnum = stmt.executeQuery("select * from tweets_t where user_id = " +data);
	while(tweetnum.next()){
		total_t = tweetnum.getString("tweet_id");
		count+=1;
	}
	//Stalkee tweet count
	java.sql.ResultSet stweetnum = stmt.executeQuery("select * from tweets_t where user_id = " +id);
	while(stweetnum.next()){
		total_t = stweetnum.getString("tweet_id");
		scount+=1;
	}
	//
	java.sql.ResultSet stalkees = stmt.executeQuery("select * from stalk_t where stalkee = " +data);
	String following = "";
	while(stalkees.next()){
 		following = stalkees.getString("stalker");
		count2+=1;
	}
	java.sql.ResultSet sstalkees = stmt.executeQuery("select * from stalk_t where stalkee = " +id);
	following = "";
	while(sstalkees.next()){
 		following = sstalkees.getString("stalker");
		scount2+=1;
	}
    
    java.sql.ResultSet stalkers = stmt.executeQuery("select * from stalk_t where stalker = " +data);
	String followers = "";
	while(stalkers.next()){
        followers = stalkers.getString("stalker");
        count3+=1;
    }
	
	java.sql.ResultSet sstalkers = stmt.executeQuery("select * from stalk_t where stalker = " +id);
	followers = "";
	while(sstalkers.next()){
        followers = sstalkers.getString("stalker");
        scount3+=1;
    }
	
	String new_tweet = "";	
       
       
//Username search for logged in user
	java.sql.ResultSet myName = stmt.executeQuery("select * from users_t where user_id = " + data);
	String maName = "";
	while(myName.next()){	
		maName = myName.getString("username");
	}

//Username and full name search for stalkee
	java.sql.ResultSet theirName = stmt.executeQuery("select * from users_t where user_id = " + id);
	String stalkName = "";
	while(theirName.next()){	
		stalkName = theirName.getString("username");
	}
	java.sql.ResultSet sFullName = stmt.executeQuery("select * from users_t where user_id = " + id);
	String fullName = "";
	while(sFullName.next()){	
		fullName = sFullName.getString("name");
	}
	//while(myName.next()){
	
// java.sql.ResultSet newtwt = stmt.executeQuery("insert into tweets_t set user_id = " +data + ", set tweet = " +new_tweet );

/*
	//Dis goes right before the tweets are being displayed
	if(rs.next())
		total_t = rs.getString(1);
*/
	//catch at the end of all java stuffs
	//for this Friday (12.19.14), be able to insert a tweet, display amount of tweets of this user, display stalkers and stalkees, yatayatayata. YOU CAN DO IT!!! 
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
                    <p class="navbar-text pull-right">Logged in as <a href="#" class="navbar-link"><%=maName%></a>
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
                    <form>
                        <textarea class="tweet-box" placeholder="Compose new Tweet..." id="tweet-box-mini-home-profile"></textarea>
                    </form>
                </div>

                <div class="module other-side-content">
                    <div class="content"
                        <p>Some other content here</p>
                    </div>
                </div>
            </div>

            <!-- right column -->
            <div class="span8 content-main">
                <div class="module">
                    <div class="content">
                        <div class="profile-header-inner" data-background-image="url('images/grey-header-web.png')">
                            <a href="#" class="profile-picture media-thumbnail">
                                <img src="images/profileThumb.jpeg" alt="Barack Obama" class="avatar size73">
                            </a>
                            <div class="profile-card-inner">
                                <h1 class="fullname"><%=fullName%></h1>
                                <h2 class="username">@<%=stalkName%></h2>
                                <div class="bio-container">
                                    <p class="bio profile-field">ACCOUNT BIO</p>
                                </div>
                            </div>
                        </div>
                        <div class="flex-module profile-banner-footer clearfix">
                            <div class="default-footer">
                                <ul class="stats js-mini-profile-stats" style="float:left">
                                    <li>
                                        <a class="js-nav" href="#">
                                            <strong><%=scount%></strong>
                                            Tweets
                                        </a>
                                    </li>
                                    <li>
                                        <a class="js-nav" href="#">
                                            <strong><%=scount3%></strong>
                                            Following
                                        </a>
                                    </li>
                                    <li>
                                        <a class="js-nav" href="#">
                                            <strong><%=scount2%></strong>
                                            Followers
                                        </a>
                                    </li>
                                </ul>
                                <a href="#dm" class="btn dm-button pull-right" type="button" title"Direct Messages" data-toggle="modal">
                                    <i class="icon-envelope"></i>
                                </a>
                                <div id="dm" class="modal hide fade">
                                    <div class="modal-header twttr-dialog-header">
                                        <div class="twttr-dialog-close" data-dismiss="modal" aria-hidden="true">&nbsp;</div>
                                        <h3>Direct Messages</h3>
                                    </div>
                                    <div class="modal-body">
                                        <!-- direct messages start -->
                                      

                                        <!-- direct messages end -->
                                    </div>
                                    <div class="twttr-dialog-footer">
                                        Tip: you can send a message to anyone who follows you. <a href="#" target="_blank" class="learn-more">Learn more</a>
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                    <div class="stream following-stream">
<%
//java.sql.ResultSet rs = stmt.executeQuery("select * from tweets_t where user_id in (select stalkee from stalk_t where stalker = " +data + ")");
int twtid = 0;
String usern = stalkName;
String s = "";
String name = "";
java.sql.PreparedStatement userstuffs = con.prepareStatement("select name from users_t where user_id = (select user_id from tweets_t where tweet_id = ?)");
java.sql.PreparedStatement userstuffs2 = con.prepareStatement("select username from users_t where user_id = (select user_id from tweets_t where tweet_id = ?)");

java.sql.ResultSet rs = stmt.executeQuery("select * from tweets_t where user_id in (select stalkee from stalk_t where stalker = " +data + " )");


while(rs.next()) {
	s = rs.getString("tweet");
	twtid = rs.getInt("tweet_id");
   	userstuffs.setInt (1,twtid);
    userstuffs2.setInt (1,twtid);
    
    java.sql.ResultSet user = userstuffs.executeQuery();
	while(user.next()){
		name = user.getString(1);
	}
	
	java.sql.ResultSet user2 = userstuffs2.executeQuery();
	while(user2.next()){
		usern = user2.getString(1);
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
	java.sql.PreparedStatement hashid = con.prepareStatement("select hash_id from hash_t where hashtag = ?");
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


                                   	<%//=s%>
					     <a href="http://t.co/xOqdhPgH" class="twitter-timeline-link" target="_blank" title="http://OFA.BO/xRSG9n" dir="ltr">
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

                    </div>
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