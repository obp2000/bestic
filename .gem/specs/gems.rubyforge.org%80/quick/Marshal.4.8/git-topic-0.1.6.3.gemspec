u:Gem::Specification-["
1.3.7i"git-topicU:Gem::Version["0.1.6.3Iu:	TimeǙ�    :@marshal_with_utc_coercionF"/git command around reviewed topic branchesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["3.0.0.beta4:
@type:runtime:@requirement@ :@prereleaseF:
@name"activesupporto;	
;
U;[[[">=U; ["0;;;@*;F;"trollopo;	
;
U;[[[">=U; ["0;:development;@4;F;"jewelero;	
;
U;[[[">=U; ["0;;;@>;F;"	rakeo;	
;
U;[[[">=U; ["2.0.0.beta.16;;;@H;F;"
rspeco;	
;
U;[[[">=U; ["0;;;@R;F;"ZenTesto;	
;
U;[[[">=U; ["0;;;@\;F;"	yardo;	
;
U;[[[">=U; ["0;;;@f;F;"gemcutter0"git-topic@hjdivad.com["David J. Hamilton"
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
    "(http://github.com/hjdivad/git-topicT@[ 