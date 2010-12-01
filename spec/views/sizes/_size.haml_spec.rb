require 'spec_helper'

class Size; end

describe "sizes/_size" do
  
  before do
    @object = sizes_proxy.first
  end
  
  it_should_behave_like "edit and new forms"

end
