u:Gem::Specification["
1.0.1i"
rtracU:Gem::Version["
1.0.2Iu:	Time'	�    :@marshal_with_utc_coercionF"(Trac wrapper with command line toolU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.5.0"
rtrac"josh@elctech.com["Josh Stephenson"�== FEATURES/PROBLEMS:  Ticket access for Trac  == SYNOPSIS:  Rtrac::Base.get_by_milestone(milestone).each do |id| # grab the ticket's data tick = Rtrac::Ticket.new(id) iteration_hash[:total] += tick.severity.to_i iteration_hash[:tickets] &lt;&lt; {:id =&gt; id, :points =&gt; tick.severity.to_i, :status =&gt; tick.status, :updated_at =&gt;Time.parse(tick.updated_at.to_s)} end  == REQUIREMENTS:  active_support hoe"    by Josh StephensonT@0