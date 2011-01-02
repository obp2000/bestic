require 'spec_helper'

class Item; end  
  
describe ItemsController do
  
  before do
    @object = items_proxy.first
  end

#  it_should_behave_like "show index page title"  

  it_should_behave_like "object"  

end
