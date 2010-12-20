require 'spec_helper'

class Size; end

describe "sizes/_size" do
  
  before do
    @object = sizes_proxy.first
    template.stub( :link_to_delete ).with( @object ).and_return( link_to_remote "Test",
            :url => size_path( @object ), :method => :delete )        
  end
  
  it_should_behave_like "edit and new forms"

end
