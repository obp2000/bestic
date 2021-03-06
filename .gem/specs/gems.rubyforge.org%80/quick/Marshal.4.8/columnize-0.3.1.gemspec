u:Gem::Specification�["
1.3.4i"columnizeU:Gem::Version["
0.3.1Iu:	TimeD[�    :@marshal_with_utc_coercionF"Read file with cachingU:Gem::Requirement[[[">=U; ["
1.8.2U;[[[">=U; ["0"	ruby[ "rocky-hacks"rockyb@rubyforge.net["R. Bernstein"�Return a list of strings as a set of arranged in columns.

For example, for a line width of 4 characters (arranged vertically):
    ['1', '2,', '3', '4'] =&gt; '1  3
2  4
'

or arranged horizontally:
    ['1', '2,', '3', '4'] =&gt; '1  2
3  4
'

Each column is only as wide as necessary.  By default, columns are
separated by two spaces - one was not legible enough. Set &quot;colsep&quot;
to adjust the string separate columns. Set `displaywidth' to set
the line width.

Normally, consecutive items go down from the top to bottom from
the left-most column to the right-most. If +arrange_vertical+ is
set false, consecutive items will go across, left to right, top to
bottom.
"8http://rubyforge.org/projects/rocky-hacks/columnizeT@[ 