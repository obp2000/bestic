u:Gem::Specification�	["
0.9.3i"crosstabU:Gem::Version["
0.1.2Iu:	Timeg��    :@marshal_with_utc_coercionF"ACrosstab is a library for generating formatted pivot tables.U:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"text-reform:@version_requirementsU;[[[">U; ["
0.0.0o;	;
0;"hoe;U;[[[">=U; ["
1.3.0"crosstab"mjudge@surveycomplete.com["Ryan Davis"�== FEATURES:  * Input your data as an array of hashes * Input a report layout, built using a Ruby DSL * Outputs ASCII pivot tables suitable for fast reports * Pretty fast: takes less than a second to process 1,000 records of data by a report with 100 rows and 10 columns.  == SYNOPSIS:  require 'rubygems' require 'crosstab'  data = [{:gender =&gt; &quot;M&quot;, :age =&gt; 1}, {:gender =&gt; &quot;F&quot;, :age =&gt; 2}, {:gender =&gt; &quot;M&quot;, :age =&gt; 3}]  my_crosstab = crosstab data do table do title &quot;Q.A Age:&quot;       group &quot;18 - 54&quot; do row &quot;18 - 34&quot;, :age =&gt; 1 row &quot;35 - 54&quot;, :age =&gt; 2       end       row &quot;55 or older&quot;, :age =&gt; 3       end  banner do column &quot;Total&quot; group &quot;Gender&quot; do column &quot;Male&quot;, :gender =&gt; &quot;M&quot; column &quot;Female&quot;, :gender =&gt; &quot;F&quot; end end     end  puts my_crosstab.to_s  # =&gt; ...  Table 1 Q.A Age: Gender        ----------------   Total    Male    Female    (A)      (B)      (C)     -------  -------  -------   (BASE)                               3        2        1    18 - 54                              2        1        1   -----------------------------      67%      50%     100%    18 - 34                            1        1       --   33%      50%             35 - 54                            1       --        1   33%              100%    55 or older                          1        1       --   33%      50%             == JUST THE BEGINNING:  * I hope to add in later releases: *   New export formats: html, pdf, csv, excel. *   More stats than just frequency and percentage: mean, median, std. deviation, std. error, and significance testing *   Optional row and table suppression for low frequencies *   Optional table rows populating from the data *   Optional table ranking -- automatically reorder rows based in descending order based on frequencies observed  == REQUIREMENTS:  * None"5    by Michael Judge <mjudge@surveycomplete.com>T@0