u:Gem::Specification�["
1.3.7i"jabbotU:Gem::Version["
0.2.0u:	TimeV��    "RSimple framework for creating Jabber/MUC bots, inspired by Sinatra and TwibotU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0.4:
@name"xmpp4r:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["2.10.1;
"shoulda;@*;F;:development0"badboy@archlinux.us["badboy"�  Jabbot is a Ruby micro-framework for creating Jabber/MUC bots,
  heavily inspired by Sinatra and Twibot.

  I modified the code of Twibot to fit my needs.
  The original Twibot code is located at:
  http://github.com/cjohansen/twibot/tree/master

  A big thank you to Christian Johansen, who wrote the code for Twibot.
  Jabbot is heavily based on his code.

  It's as easy as definig a small message handler:
    message do |message, params|
      post message.text
    end
"$http://github.com/badboy/jabbotT@[ 