u:Gem::Specification$["
1.3.7i"choctopU:Gem::Version["0.13.1Iu:	TimeΘ�    :@marshal_with_utc_coercionF"{Build and deploy tools for Cocoa apps using Sparkle for distributions and upgrades;  it&#8217;s like Hoe but for Cocoa appsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
2.0.4:
@type:development:@requirement@ :@prereleaseF:
@name"rubyforgeo;	
;
U;[[[">=U; ["
2.6.1;;;@*;F;"hoeo;	
;
U;[[["=U; ["
0.0.4;:runtime;@4;F;"escapeo;	
;
U;[[["=U; ["
0.2.1;;;@>;F;"awesome_printo;	
;
U;[[[">=U; ["0;;;@H;F;"bundlero;	
;
U;[[["=U; ["
4.2.3;;;@R;F;"RedClotho;	
;
U;[[["=U; ["
2.1.2;;;@\;F;"builder"choctop["drnicwilliams@gmail.com"chris@cobaltedge.com"patrick.huesler@gmail.com["Dr Nic Williams"Chris Bailey"Patrick Huesler"�Build and deploy tools for Cocoa apps using Sparkle for distributions and upgrades; 
it&#8217;s like Hoe but for Cocoa apps.

Package up your OS X/Cocoa applications into Custom DMGs, generate Sparkle XML, and
upload. Instead of hours, its only 30 seconds to release each new version of an application.

Build and deploy tools for Cocoa apps using Sparkle for distributions and upgrades; it's
like Hoe but for Cocoa apps.

The main feature is a powerful rake task "rake appcast" which builds a release of your
application, creates a DMG package, generates a Sparkle XML file, and posts the package
and XML file to your remote host via rsync.

All rake tasks:
    rake build               # Build Xcode Release
    rake dmg                 # Create the dmg file for appcasting
    rake feed                # Create/update the appcast file
    rake upload              # Upload the appcast file to the host
    rake version:bump:major  # Bump the gemspec by a major version.
    rake version:bump:minor  # Bump the gemspec by a minor version.
    rake version:bump:patch  # Bump the gemspec by a patch version.
    rake version:current     # Display the current version"$http://drnic.github.com/choctopT@[ 