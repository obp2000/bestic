u:Gem::Specificationd["
1.3.4i"event_hookU:Gem::Version["
1.0.1Iu:	Time�V�    :@marshal_with_utc_coercionF"�Wraps rb_add_event_hook so you can write fast ruby event hook processors w/o the speed penalty that comes with set_trace_func (sooo sloooow!)U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:
@name"hoe:@version_requirementsU;[[[">=U; ["
2.3.0:@version_requirement0"seattlerb["ryand-ruby@zenspider.com["Ryan Davis"QWraps rb_add_event_hook so you can write fast ruby event hook
processors w/o the speed penalty that comes with set_trace_func (sooo
sloooow!). Calls back into ruby so you don't have to write C.

    % ruby demo.rb 
    # of iterations = 1000000
                              user     system      total        real
    null_time             0.120000   0.000000   0.120000 (  0.125279)
    ruby time             0.560000   0.000000   0.560000 (  0.562834)
    event hook            3.160000   0.010000   3.170000 (  3.175361)
    set_trace_func       34.530000   0.100000  34.630000 ( 34.942785)",http://rubyforge.org/projects/seattlerbT@[ 