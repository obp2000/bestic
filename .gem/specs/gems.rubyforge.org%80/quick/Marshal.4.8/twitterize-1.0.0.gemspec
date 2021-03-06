u:Gem::Specificationz["
0.9.2i"twitterizeU:Gem::Version["
1.0.0Iu:	Time���    :@marshal_with_utc_coercionF"JA command-line program for posting multiple feeds to twitter accountsU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[
o:Gem::Dependency:@version_requirement0:
@name"activerecord:@version_requirementsU;[[[">=U; ["1.15.0o;	;
0;"feedtools;U;[[[">=U; ["0.2.26o;	;
0;"htmlentities;U;[[[">=U; ["
4.0.0o;	;
0;"shorturl;U;[[["=U; ["
0.8.2o;	;
0;"hoe;U;[[[">=U; ["
1.2.0"
nycrb"harrisj@schizopolis.net["Jacob Harris"Twitterize is a quick and dirty hack I did in a few hours to play with the Twitter API (seriously, there are no tests and I'm sure there is code crude enough in there to make you recant any friendship we might have). It allows you to take any number of RSS feeds and post them to one or more Twitter accounts. An example of this is how various RSS feeds from the New York Times are sent to twitter accounts nytimes, nyt_arts, nyt_biz, etc. This is accomplished via a command-line script that requires a separate configuration file (see below). Since Twitter is a rapidly growing (read somewhat flaky) service, twitterize also uses a database to store twitters to be posted and recover later if twitter is down. This also allows the app to retain feed GUIDs and avoid duplicate posts."6http://www.zenspider.com/ZSS/Products/twitterize/T@0