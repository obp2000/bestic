u:Gem::Specification�["
1.3.5i"date_toolsU:Gem::Version["
0.0.2Iu:	Time7o�    :@marshal_with_utc_coercionF"HSome tools to handle dates (compare to time, locales, new creators)U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"knut@lickert.net["Knut Lickert"�Little helper for the classes Date, DateTime and Time.
//
date_time_compare.rb:
Allows to compare Date and Time objects (allows to sort by mixed Date/Time-keys).
//
date_creator.rb:
New date creations:
Date#new_by_mday: Allows "Third sunday in june 2010"...
//
date_locale.rb:
Localization of Date, DateTime and Time.
strftime gets a optional parameter to determine the language.
Default is en, or if locale is used the current locale.
"http://www.rubypla.net/T@[ 