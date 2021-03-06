u:Gem::Specification�["
1.3.7i"bunniculaU:Gem::Version["
0.2.2Iu:	Time���    :@marshal_with_utc_coercionF"SA very simple relay for moving messages from a local broker to a remote brokerU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[["=U; ["
0.6.0:
@type:runtime:@requirement@ :@prereleaseF:
@name"
bunnyo;	
;
U;[[["=U; ["
0.6.7;;;@*;F;"	amqpo;	
;
U;[[["=U; ["2.11.1;:development;@4;F;"shoulda0"hereiam@sonic.net["Nathan Stults"^Bunnicula is a simple AMQP relay implemented as a ruby daemon (a-la daemon-kit). Similar in intent to shovel, Bunnicula is intended to enable the common messaging scenario where services and applications publish messages to an AMQP broker on the local LAN for speed and reliability which are then subsequently relayed to a remote AMQP instance by a relay process which isn&#65533;t so irritable as message producers tend to be when it comes to network speed and reliability. Bunnicula can be configured via configuration file (a Ruby DSL) or, for most common configurations, through command line arguments.".http://github.com/PlasticLizard/bunniculaT@[ 