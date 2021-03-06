u:Gem::Specification�["
0.9.4i"group_open_idU:Gem::Version["
0.1.2Iu:	Time���    :@marshal_with_utc_coercionF"0Wrapper library for myID.net's Group ID APIU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hpricot:@version_requirementsU;[[[">=U; ["0.6o;	;
0;"hoe;U;[[[">=U; ["
1.2.2"springnote"byblue@gmail.com["Bryan Kang"x== DESCRIPTION:  Wrapper library for myID.net's Group ID API  == FEATURES/PROBLEMS:  * TBD  == SYNOPSIS:  require 'group_open_id'  # Initialize a client GroupOpenID::Client.app_key = 'your_application_key' client = GroupOpenID::Client.new('user_open_id_url', 'user_key') group_id = GroupOpenID::URI.new('http://ruby.myid.net', client)  # Get the membership location puts group_id.membership_location # =&gt; 'http://some.url/'  # Get member lists puts group_id.members # =&gt; array of GroupOpenID::Member   # Determine where a given open_id is the member of a group id puts group_id.member?('http://deepblue.myid.net') # =&gt; true0T@0