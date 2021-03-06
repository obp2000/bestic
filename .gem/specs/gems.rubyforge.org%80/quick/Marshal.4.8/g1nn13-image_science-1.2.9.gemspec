u:Gem::Specification�["
1.3.6i"g1nn13-image_scienceU:Gem::Version["
1.2.9Iu:	TimeD��    :@marshal_with_utc_coercionF"Zg1nn13 fork changes:  * added buffer() method to get image buffer for writing (to Amazon S3) * added fit_within() method to resize an image to fit within a specified height and width without changing the image's aspect ratio * added resize_with_crop() to resize and crop images where the target aspect ratio differs from the original aspect ratioU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@requirementU;[[[">=U; ["
2.5.0:@version_requirements@ :@prereleaseF:
@type:runtime:
@name"hoeo;	
;
U;[[[">=U; ["
0.3.0;@*;F;;;"gemcuttero;	
;
U;[[[">=U; ["
1.0.0;@4;F;:development;"hoe-doofuso;	
;
U;[[[">=U; ["
1.3.0;@>;F;;;"hoe-gito;	
;
U;[[[">=U; ["
1.0.0;@H;F;;;"hoe-telicoptero;	
;
U;[[[">=U; ["
1.5.0;@R;F;;;"minitesto;	
;
U;[[[">=U; ["
2.6.0;@\;F;;;"hoe"g1nn13-image_science["jim@hotelicopter.com["jim nist"�g1nn13 fork changes:

* added buffer() method to get image buffer for writing (to Amazon S3)
* added fit_within() method to resize an image to fit within a specified
  height and width without changing the image's aspect ratio
* added resize_with_crop() to resize and crop images where the
  target aspect ratio differs from the original aspect ratio. This is
  for converting portrait to landscape and landscape to portrait.



ImageScience is a clean and happy Ruby library that generates
thumbnails -- and kicks the living crap out of RMagick. Oh, and it
doesn't leak memory like a sieve. :)

For more information including build steps, see http://seattlerb.rubyforge.org/"+http://github.com/g1nn13/image_scienceT@[ 