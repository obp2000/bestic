u:Gem::Specification5["
0.9.4i"test-dataU:Gem::Version["
1.1.0Iu:	Time��    :@marshal_with_utc_coercionF"HTo enable data testing to mixed in with unit or spec driven testingU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"fastercsv:@version_requirementsU;[[[">=U; ["
1.2.1o;	;
0;"hoe;U;[[[">=U; ["
1.4.0"test-data"mail@michaelbarton.me.uk["Michael Barton"u== FEATURES/PROBLEMS:  Fetch values from CSV files based on matching values in other columns  == SYNOPSIS:  # Using test/spec syntax simple_case_csv = File.dirname(__FILE__) + '/data/simple_case.csv' simple_case.entry(:col4,{:col1 =&gt; 1,:col2 =&gt; 2, :col3 =&gt; 3}).should.equal 'A'  == REQUIREMENTS:  * FasterCSV * Code testing libraries such as test/unit or test/spec"    by Michael BartonT@0