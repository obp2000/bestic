u:Gem::Specification�["
1.3.5i"rspec_outlinesU:Gem::Version["
0.0.1Iu:	Time�i�    :@marshal_with_utc_coercionF"Define specs in tables.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:@version_requirementsU;[[[">=U; ["0:
@name"
rspeco;		;
;;0;U;[[[">=U; ["0;"
mocha0"george.ogata@gmail.com["George Ogata"Cucumber outlines for RSpec!

    describe &quot;Adding two numbers&quot; do
      outline &quot;should return the sum&quot; do
        (a + b).should == c
      end

      fields :a, :b, :c
      values  1,  1,  2
      values  2,  3,  5
      values  1, -1,  0
    end
"*http://github.com/oggy/rspec_outlinesT@[ 