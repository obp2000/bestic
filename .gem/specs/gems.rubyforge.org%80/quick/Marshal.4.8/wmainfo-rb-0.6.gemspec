u:Gem::Specification["
1.3.3i"wmainfo-rbU:Gem::Version["0.6Iu:	Time�T�    :@marshal_with_utc_coercionF"=Pure Ruby lib for accessing info/tags from wma/wmv filesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ "wmainfo-rb"bulliver@badcomputer.org["Darren Kirby"�:: wmainfo-rb ::
Author: Darren Kirby
mailto:bulliver@badcomputer.org
License: Ruby

 = Quick API docs =

  == Initializing ==

  require 'wmainfo'
  foo = WmaInfo.new(&quot;someSong.wma&quot;)
     ... or ...
  foo = WmaInfo.new(&quot;someVideo.wmv&quot;, :encoding=&gt;&quot;UTF-16LE&quot;) 
  (default encoding is ASCII)
     ... or ...
   foo = WmaInfo.new(&quot;someVideo.wmv&quot;, :debug=&gt;1)

  == Public attributes ==

  @drm          :: 'true' if DRM present else 'false'
  @tags         :: dict of strings (id3 like data)
  @info         :: dict of variable types (non-id3 like data)
  @ext_info     :: dict of variable types (non-id3 like data) from ASF_Extended_Content_Description_Object
  @headerObject :: dict of arrays (name, GUID, size and offset of ASF objects)
  @stream       :: dict of variable types (stream properties data)

  == Public methods ==

  print_objects   :: pretty-print header objects
  hasdrm?         :: returns True if file has DRM
  hastag?('str')  :: returns True if @tags['str'] exists
  print_tags      :: pretty-print @tags dict
  hasinfo?('str') :: returns True if @info['str'] exists
  print_info      :: pretty-print @info dict
  print_stream    :: pretty-print @stream dict

  For more/different documentation see http://badcomputer.org/unix/code/wmainfo/

  == Thanks/Contributors == 

   Ilmari Heikkinen sent in a fix for uninitialized '@ext_info'.
   Guillaume Pierronnet sent in a patch which improves character encoding handling.
".http://badcomputer.org/unix/code/wmainfo/T@[ 