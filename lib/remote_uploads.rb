module ActionView
  module Helpers
    module PrototypeHelper
      alias_method :form_remote_tag_old, :form_remote_tag
      def form_remote_tag(options = {})
        if options[:html] && options[:html][:multipart]      
          uid = "a#{Time.now.to_f.hash}"                                
          <<-STR    
<iframe name="#{uid}" id="#{uid}" src="about:blank" style="position:absolute;left:-100px;width:0px;height:0px;border:0px"></iframe>
<form method="put" action="#{url_for options[:url].update({:iframe_remote => true})}" enctype="multipart/form-data" target="#{uid}" #{%(onsubmit="#{options[:loading]}") if options[:loading]}>
          STR
        else
          form_remote_tag_old(options)
        end
      end                             
    end
  end
end