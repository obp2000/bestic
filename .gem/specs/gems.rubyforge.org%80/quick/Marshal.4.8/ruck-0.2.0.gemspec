u:Gem::Specificationr["
1.3.6i"	ruckU:Gem::Version["
0.2.0Iu:	TimeG��    :@marshal_with_utc_coercionF"Cstrong timing for Ruby: cooperative threads on a virtual clockU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"tom@alltom.com["Tom Lieber"O      Ruck uses continuations and a simple scheduler to ensure "shreds"
      (Ruck threads) are woken at precisely the right time according
      to its virtual clock. Schedulers can map virtual time to samples
      in a WAV file, real time, time in a MIDI file, or anything else
      by overriding "sim_to" in the Shreduler class.
""http://github.com/alltom/ruckT@[ 