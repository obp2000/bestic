u:Gem::Specification6["
1.2.0i"earwormU:Gem::Version["
0.0.2Iu:	Time��    :@marshal_with_utc_coercionF"BEarworm can identify unknown music using MusicDNS and libofa.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"icanhasaudio:@version_requirementsU;[[[">=U; ["
0.1.1o;		;
:development;0;"hoe;U;[[[">=U; ["
1.7.0"earworm["aaronp@rubyforge.org["Aaron Patterson"GEarworm can identify unknown music using MusicDNS and libofa.  == FEATURES/PROBLEMS:  * Identifies mp3, ogg, and wav files.  == SYNOPSIS:  Identify an unknown audio file:  ew = Earworm::Client.new('MY Music DNS Key') info = ew.identify(:file =&gt; '/home/aaron/unknown.wav') puts &quot;#{info.artist_name} - #{info.title}&quot;"!http://earworm.rubyforge.orgT@0