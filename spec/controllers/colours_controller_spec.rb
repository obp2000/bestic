require 'spec_helper'

class Colour; end    
  
describe ColoursController do
  
  before do
    @object = colours_proxy.first
  end

  it_should_behave_like "object"

end
