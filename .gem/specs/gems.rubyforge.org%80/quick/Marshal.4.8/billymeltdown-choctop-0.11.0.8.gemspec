u:Gem::Specification�["
1.3.6i"billymeltdown-choctopU:Gem::Version["0.11.0.8Iu:	Time��    :@marshal_with_utc_coercionF"{Build and deploy tools for Cocoa apps using Sparkle for distributions and upgrades;  it&#8217;s like Hoe but for Cocoa appsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:@requirement@ :
@type:runtime:@prereleaseF:
@name"activesupporto;	
;
U;[[[">=U; ["
2.1.2;@*;;;F;"buildero;	
;
U;[[[">=U; ["
2.0.3;@4;:development;F;"rubyforgeo;	
;
U;[[[">=U; ["
0.3.0;@>;;;F;"gemcuttero;	
;
U;[[[">=U; ["
1.5.2;@H;;;F;"newgemo;	
;
U;[[[">=U; ["
2.5.0;@R;;;F;"hoe"choctop["drnicwilliams@gmail.com"chris@cobaltedge.com["Dr Nic Williams"Chris Bailey"�Build and deploy tools for Cocoa apps using Sparkle for distributions and upgrades; 
it&#8217;s like Hoe but for Cocoa apps.

Package up your OS X/Cocoa applications into Custom DMGs, generate Sparkle XML, and
upload. Instead of hours, its only 30 seconds to release each new version of an application.

Build and deploy tools for Cocoa apps using Sparkle for distributions and upgrades; it's
like Hoe but for Cocoa apps.

The main feature is a powerful rake task "rake appcast" which builds a release of your
application, creates a DMG package, generates a Sparkle XML file, and posts the package
and XML file to your remote host via rsync.

All rake tasks:

    rake appcast         # Create dmg, update appcast file, and upload to host
    rake build   # Build Xcode Release
    rake dmg     # Create the dmg file for appcasting
    rake feed    # Create/update the appcast file
    rake upload  # Upload the appcast file to the host"$http://drnic.github.com/choctopT@[ 