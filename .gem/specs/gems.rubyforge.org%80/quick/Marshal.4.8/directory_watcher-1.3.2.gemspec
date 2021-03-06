u:Gem::Specification�["
1.3.6i"directory_watcherU:Gem::Version["
1.3.2Iu:	Time&��    :@marshal_with_utc_coercionF"`A class for watching files within a directory and generating events when those files changeU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.1.1:@requirement@ :
@type:development:@prereleaseF:
@name"bones-gito;	
;
U;[[[">=U; ["
0.3.2;@*;;;F;"revo;	
;
U;[[[">=U; ["0.12.10;@4;;;F;"eventmachineo;	
;
U;[[[">=U; ["
3.4.1;@>;;;F;"
bones"directory_watcher"tim.pease@gmail.com["Tim Pease"GThe directory watcher operates by scanning a directory at some interval and
generating a list of files based on a user supplied glob pattern. As the file
list changes from one interval to the next, events are generated and
dispatched to registered observers. Three types of events are supported --
added, modified, and removed."0http://gemcutter.org/gems/directory_watcherT@[ 