u:Gem::Specification�["
1.3.7i"chunky_pngU:Gem::Version["
0.8.0Iu:	Time֗�    :@marshal_with_utc_coercionF"FPure ruby library for read/write, chunk-level access to PNG filesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@requirementU;[[[">=U; ["
1.2.9:@version_requirements@ :@prereleaseF:
@type:development:
@name"
rspec0["willem@railsdoctors.com["Willem van Bergen"     This pure Ruby library can read and write PNG images without depending on an external 
    image library, like RMagick. It tries to be memory efficient and reasonably fast.
    
    It supports reading and writing all PNG variants that are defined in the specification, 
    with one limitation: only 8-bit color depth is supported. It supports all transparency, 
    interlacing and filtering options the PNG specifications allows. It can also read and 
    write textual metadata from PNG files. Low-level read/write access to PNG chunks is
    also possible.
    
    This library supports simple drawing on the image canvas and simple operations like alpha composition
    and cropping. Finally, it can import from and export to RMagick for interoperability. 
"1http://wiki.github.com/wvanbergen/chunky_pngT@[ 