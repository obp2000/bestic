u:Gem::Specification!["
0.9.4i"awis4rubyU:Gem::Version["
0.9.0Iu:	Time���    :@marshal_with_utc_coercionF">Simple Ruby client for the Alexa Web Information Service.U:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.3.0"awis4ruby"owack.j@gmail.com["Jay Owack"�== FEATURES/PROBLEMS:  * Up-to-date Ruby client * Allows simple access to most popular AWIS data  == SYNOPSIS:  ACCESS_KEY_ID = &quot;05RTY5ESSE0EDGR68G2&quot; SECRET_ACCESS_KEY = &quot;1tmO+Tgvp0YU/ZOTwUTRYui7JppEc/lSMSD&quot; host = 'votanweb.com' info = AWIS4Ruby::get_url_info(ACCESS_KEY_ID, SECRET_ACCESS_KEY, host) p info.online_since.strftime('%m-%d-%Y') p info.rank   # traffic rank  == REQUIREMENTS:"(http://labs.votanweb.com/awis4ruby/T@0