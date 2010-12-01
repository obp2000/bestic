require 'spec_helper'
  
class Size; end      
  
describe SizesController do
  
  before do
    @object = sizes_proxy.first
  end

  it_should_behave_like "object"

end
