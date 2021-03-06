u:Gem::Specificationd["
1.3.7i"	ruckU:Gem::Version["
0.3.0u:	Time��    "Cstrong timing for Ruby: cooperative threads on a virtual clockU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:
@name"PriorityQueue:@requirement@ :@prereleaseF:
@type:runtime0"tom@alltom.com["Tom Lieber"�      Ruck uses continuations and a simple scheduler to ensure "shreds"
      (Ruck threads) are woken at precisely the right time according
      to its virtual clock. Schedulers can map virtual time to samples
      in a WAV file, real time, time in a MIDI file, or anything else
      by overriding "sim_to" in the Shreduler class.
      
      A small library of useful unit generators and plenty of examples
      are provided. See the README or the web page for details.
""http://github.com/alltom/ruckT@[ 