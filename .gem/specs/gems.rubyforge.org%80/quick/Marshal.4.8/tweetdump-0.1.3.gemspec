u:Gem::Specification@["
1.3.6i"tweetdumpU:Gem::Version["
0.1.3Iu:	Time���    :@marshal_with_utc_coercionF"fSimple CLI program to dump X number of tweets as raw JSON from Twitter's Search or Streaming APIsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:@requirement@ :
@type:development:@prereleaseF:
@name"thoughtbot-shouldao;	
;
U;[[[">=U; ["0.7;@*;:runtime;F;"optiflago;	
;
U;[[[">=U; ["0;@4;;;F;"tweetstreamo;	
;
U;[[[">=U; ["0;@>;;;F;"eventmachineo;	
;
U;[[[">=U; ["0;@H;;;F;"hashieo;	
;
U;[[[">=U; ["0;@R;;;F;"twitter0"logan@logankoester.com["Logan Koester"L
      Initially I created this because I wanted to compare the Streaming and Search APIs.
      It turns out that completely by accident it can also do the neat trick of connecting indefinitely to either API,
      and feeding fresh tweets to whatever program you pipe the output to.

      % tweetdump -h # Usage instructions
    "-http://github.com/logankoester/tweetdumpT@[ 