u:Gem::Specification�["1.3.7.pre.1i"rubygems-updateU:Gem::Version["
1.3.7Iu:	Time���    :@marshal_with_utc_coercionF"8RubyGems is a package management framework for RubyU:Gem::Requirement[[[">U; ["
1.8.3U;[[[">=U; ["0"	ruby[ "rubygems["&rubygems-developers@rubyforge.org["Jim Weirich"Chad Fowler"Eric Hodel";RubyGems is a package management framework for Ruby.

This gem is an update for the RubyGems software. You must have an
installation of RubyGems before this update can be applied.

See Gem for information on RubyGems (or `ri Gem`)

To upgrade to the latest RubyGems, run:

  $ gem update --system  # you might need to be an administrator or root

NOTE:  RubyGems 1.1 and 1.2 have problems upgrading when there is no
rubygems-update installed.  You will need to use the following instructions
if you see "Nothing to update".

If you have an older version of RubyGems installed, then you can still
do it in two steps:

  $ gem install rubygems-update  # again, might need to be admin/root
  $ update_rubygems              # ... here too

If you don't have any RubyGems install, there is still the pre-gem approach to
getting software, doing it manually:

1. Download from: http://rubyforge.org/frs/?group_id=126
2. Unpack into a directory and cd there
3. Install with: ruby setup.rb  # you may need admin/root privilege

For more details and other options, see:

  ruby setup.rb --help"http://rubygems.org/T@[ 