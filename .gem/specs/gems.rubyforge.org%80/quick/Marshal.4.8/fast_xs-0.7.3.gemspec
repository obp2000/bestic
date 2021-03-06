u:Gem::Specification�["
1.3.5i"fast_xsU:Gem::Version["
0.7.3Iu:	Time�[�    :@marshal_with_utc_coercionF"4fast_xs provides C extensions for escaping textU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:
@name"hoe:@version_requirementsU;[[[">=U; ["
2.3.2:@version_requirement0"fast-xs""fast-xs-general@rubyforge.org["Eric Wong"@fast_xs provides C extensions for escaping text.

The original String#fast_xs method is based on the xchar code by Sam Ruby:

* http://intertwingly.net/stories/2005/09/28/xchar.rb
* http://intertwingly.net/blog/2005/09/28/XML-Cleansing

_why also packages an older version with Hpricot (patches submitted).
The version here should be compatible with the latest version of Hpricot
code.

Ruby on Rails will automatically use String#fast_xs from either Hpricot
or this gem version with the bundled Builder package.

String#fast_xs is an almost exact translation of Sam Ruby's original
implementation (String#to_xs), but it does escape &quot;&amp;quot;&quot; (which is an
optional, but all parsers are able ot handle it.  XML::Builder as
packaged in Rails 2.0 will be automatically use String#fast_xs instead
of String#to_xs available.""http://fast-xs.rubyforge.org/T@[ 