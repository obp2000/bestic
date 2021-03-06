u:Gem::SpecificationR	["
1.3.6i"id3lib-rubyU:Gem::Version["
0.6.0Iu:	Time���    :@marshal_with_utc_coercionF"{id3lib-ruby provides a Ruby interface to the id3lib C++ library for easily editing ID3 tags (v1 and v2) of MP3 audio files.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"x86-mswin32-60[ "id3lib-ruby"robinstocker@rubyforge.org["Robin Stocker"�= id3lib-ruby

id3lib-ruby provides a Ruby interface to the id3lib C++ library for easily
editing ID3 tags (v1 and v2) of MP3 audio files.

The class documentation starts at ID3Lib::Tag.


== Features

* Read and write ID3v1 and ID3v2 tags
* Simple interface for adding, changing and removing frames
* Quick access to common text frames like title and performer
* Custom data frames like attached picture (APIC)
* Pretty complete coverage of id3lib's features
* UTF-16 support (warning: id3lib writes broken UTF-16 frames)
* Windows binary gem available

The CHANGES file contains a list of changes between versions.


== Installation

See INSTALL.


== Online Information

The home of id3lib-ruby is http://id3lib-ruby.rubyforge.org


== Usage

  require 'rubygems'
  require 'id3lib'

  # Load a tag from a file
  tag = ID3Lib::Tag.new('talk.mp3')

  # Get and set text frames with convenience methods
  tag.title  #=&gt; "Talk"
  tag.album = 'X&amp;Y'
  tag.track = '5/13'

  # Tag is a subclass of Array and each frame is a Hash
  tag[0]
  #=&gt; { :id =&gt; :TPE1, :textenc =&gt; 0, :text =&gt; "Coldplay" }

  # Get the number of frames
  tag.length  #=&gt; 7

  # Remove all comment frames
  tag.delete_if{ |frame| frame[:id] == :COMM }

  # Get info about APIC frame to see which fields are allowed
  ID3Lib::Info.frame(:APIC)
  #=&gt; [ 2, :APIC, "Attached picture",
  #=&gt;   [:textenc, :mimetype, :picturetype, :description, :data] ]

  # Add an attached picture frame
  cover = {
    :id          =&gt; :APIC,
    :mimetype    =&gt; 'image/jpeg',
    :picturetype =&gt; 3,
    :description =&gt; 'A pretty picture',
    :textenc     =&gt; 0,
    :data        =&gt; File.read('cover.jpg')
  }
  tag &lt;&lt; cover

  # Last but not least, apply changes
  tag.update!


== Licence

This library has Ruby's licence:

http://www.ruby-lang.org/en/LICENSE.txt


== Author

Robin Stocker &lt;robinstocker at rubyforge.org&gt;
"%http://id3lib-ruby.rubyforge.orgTo:Gem::Platform:	@cpu"x86:@version"60:@os"mswin32[ 