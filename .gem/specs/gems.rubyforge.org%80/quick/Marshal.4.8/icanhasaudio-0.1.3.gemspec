u:Gem::Specification=["
1.2.0i"icanhasaudioU:Gem::Version["
0.1.3Iu:	TimeG$�    :@marshal_with_utc_coercionF"Licanhasaudio is a lame/vorbis wrapper for decoding ur mp3s and ur oggs.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.7.0"seattlerb"aaronp@rubyforge.org["Aaron Patterson"Hai! icanhasaudio? is an interface to lame for decoding ur MP3s.  I iz in ur computer. Decodin ur mp3s.  Whatevs!  I also decodin ur OGGz!  I kin also encodin' ur WAV and AIFF to mp3z!  == SYNOPSYS ROFLOL  require 'icanhasaudio'  reader = Audio::MPEG::Decoder.new File.open(ARGV[0], 'rb') { |input_lol| File.open(ARGV[1], 'wb') { |output_lol| reader.decode(input_lol, output_lol) } }"http://icanhasaudio.com/
T@0