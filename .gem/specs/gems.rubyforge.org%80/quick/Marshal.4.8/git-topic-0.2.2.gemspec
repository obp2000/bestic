u:Gem::Specification�["
1.3.7i"git-topicU:Gem::Version["
0.2.2u:	Time��    "/git command around reviewed topic branchesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["3.0.0.beta4:
@name"activesupport:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["0;
"trollop;@*;F;;o;
;	U;[[[">=U; ["0;
"jeweler;@4;F;:developmento;
;	U;[[[">=U; ["0;
"	rake;@>;F;;o;
;	U;[[[">=U; ["2.0.0.beta.16;
"
rspec;@H;F;;o;
;	U;[[[">=U; ["0;
"ZenTest;@R;F;;o;
;	U;[[[">=U; ["0;
"	yard;@\;F;;o;
;	U;[[[">=U; ["0;
"gemcutter;@f;F;;o;
;	U;[[[">=U; ["0;
"autotest-screen;@p;F;;0"git-topic@hjdivad.com["David J. Hamilton"v
      gem command around reviewed topic branches.  Supports workflow of the form:

      # alexander:
      git work-on &lt;topic&gt;
      git done

      # bismarck:
      git status    # notice a review branch
      git review &lt;topic&gt;
      # happy, merge into master, push and cleanup
      git accept

      git review &lt;topic2&gt;
      # unhappy
      git reject

      # alexander:
      git status    # notice rejected topic
      git work-on &lt;topic&gt;

      see README.rdoc for more (any) details.


      To make use of bash autocompletion, you must do the following:

        1.  Make sure you source share/completion.bash before you source git's completion.
        2.  Optionally, copy git-topic-completion to your gem's bin directory.
            This is to sidestep ruby issue 3465 which makes loading gems far too
            slow for autocompletion.
    "(http://github.com/hjdivad/git-topicT@[ 