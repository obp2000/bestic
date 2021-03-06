u:Gem::Specification�["
1.3.7i"sm-transcriptU:Gem::Version["
0.0.6Iu:	Timed��    :@marshal_with_utc_coercionF"&Convert word lists to transcriptsU:Gem::Requirement[[[">=U; ["1.8U;[[[">=U; ["0"	ruby[ 0"pwilkins@mit.edu["Peter Wilkins"�$Id: README.txt 196 2010-06-11 18:51:18Z pwilkins $

sm-transcript reads results of SLS processing and produces transcripts for
the SpokenMedia browser.  For each file in the source folder whose extension 
matches the source type, a file of destination type is created in the 
destination folder.  All of these parameters have default values.

Note: Examples of the commands you enter in the terminal are for *nix.  The
command prompt in the examples is:

felix$ &lt;command line&gt;

If you are a Windows user, make the usual adjustments.

Requirements:
   sm-transcript is written in Ruby and packaged as a RubyGem.  Since Ruby is
   not a compiled language, you will need to have Ruby installed on your 
   machine to run sm-transcript.  You can determine if Ruby is installed by 
   typing "ruby -v" at a terminal prompt.  It should return the version of 
   Ruby that is installed.  If Ruby is not installed on your machine, contact
   me (or your local Ruby wizard) for assistance.
   
Installation:
   You can get sm-transcript as either a RubyGem or as source from svn.
   
   The preferred way to install this package is as a Rubygem.  You can 
   download and install the gem with this command:  
   
   felix$ sudo gem install [--verbose] sm-transcript
   
   This command downloads the most recent version of the gem from rubygems.org
   and makes it active.  Previous versions of the gem remain installed, but 
   are deactivated.
   
   You must use "sudo" to properly install the gem.  If you execute "gem 
   install" (omitting the "sudo") the gem is installed in your home gem 
   repository and it isn't in your path without additional configuration.
   
   Note: You need sudo privileges to run the command as written.  If you 
   can't sudo, then you can install it locally and will need some additional
   configuration.  Contact me (or your local Ruby wizard) for assistance. 
    
   The executable is now in your path.
   
   You can cleanly uninstall the gem with this command:
   
   felix$ sudo gem uninstall sm-transcript   
   
   If you have access to our svn repository, you are welcome to check out the 
   code.  Be warned that the trunk tip is not necessarily stable.  It changes 
   frequently as enhancements (and bug fixes) are added. (note that the
   'smb_transcript' in the command line below is not a typo.)

   svn co svn+ssh://svn.mit.edu/oeit-tsa/SMB/smb_transcript/trunk sm_transcript
   
   build the gem by running this command from the directory you installed the 
   source.  This is what it looks like on my machine:
   
   felix$ rake gem
   
   The gem will be built and put in ./pkg   You can now use the gem 
   installation instructions above.
   

Using the App:
   Run with no command line parameters, the app reads *.wrd files out of 
   ./results and writes *t1.html files to ./transcripts.  These directories
   are relative to where sm_transcript is called.
   
   Note: destination files are overwritten without a warning prompt.  If you 
   want to preserve an existing output file, rename it before running the app
   again.
   
   For example, run the app by navigating to the bin folder and enter 

      projects/sm_transcript/bin felix$ sm_transcript
   
   This command run from this folder will read *.wrd files from bin/results
   and write *-t1.html to bin/transcripts.
   
   Usage: sm_transcript [options]  
    --srcdir PATH        Read files from this folder (Default: ./results)
    --destdir PATH       Write files to this folder (Default: ./transcripts)
    --srctype wrd | seg | txt | ttml   Kind of file to process (Default: wrd)
    --desttype html | ttml | datajs | json  Kind of file to output (Default: html)
    -h, --help            Show this message  


Troubleshooting:
   sm-transcript requires additional gems to operate.  The RubyGem 
   installation should install dependencies automatically, but when it 
   doesn't, you get an error that includes 
   
   ... no such file to load -- builder (LoadError)
   
   in the first few lines when you run sm-transcript, the problem is a 
   missing dependent gem.  (the error above indicates that the Builder 
   gem is missing.)  Try installing the missing gem.  For the error above,
   the command looks like this on my computer:
   
   felix$ sudo gem install builder
   
   See "Required Gems" below for more information.
   
   
   A warning message such as:
   
      "WARNING: Nokogiri was built against LibXML version 2.7.6, 
      but has dynamically loaded 2.7.7""
      
   may be safely ignored.
   
      
Upgrading:
   You can easily upgrade by simply executing the same command you used to 
   install the gem.  Running install again will add the newer version and make
   it active.  By default the most recent version is used, but older versions
   are still available, simply inactive.
   
   If are using svn, you should already know what to do.
   
   
Required Gems:
   builder    - create structured data, such as XML
   extensions - added for the 'require_relative' command.  (To get this
                command in Ruby 1.8 you need to install this gem, for Ruby 1.9
                the command is already part of the core.)
   htmlentities - html parsing
   json       - create JSON structured data
   optparse   - option parsing of command line
   ostruct    - open data structures
   ppcommand  - pp is a pretty printer.  It is used only for debugging
   rake       - make for Ruby
   rubygems   - support for gems (shouldn't be needed for Ruby 1.9)
   shoulda    - enhancement for Test::Unit
      
   This command installs gems on OSX and Linux:
   felix$ sudo gem install &lt;gem name&gt;
   
Unit Tests:
   You may run all unit tests by navigating to the test folder and running 
   rake with no parameters (the default rake task runs all tests).  On my
   computer, it looks like this:

   projects/sm_transcript/test felix$ rake 


Release Notes:
   Initial Version - runs under Ruby 1.8.x. 
   version 0.0.4 - fixes bug when processing .WRD files with CRLF line
   endings.
   version 0.0.5 - added srctype of ttml and desttype of json, fixed bug
   where beginning time of word was actually for previous word.

To Do:
   specify individual files for processing rather than folders
   update code to run under Ruby 1.9


   "http://spokenmedia.mit.eduT@[ 