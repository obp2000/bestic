require 'spec_helper'
  
describe OrdersController do
  
  before do
    @object = orders_proxy.first
  end

  it_should_behave_like "object"
  
#  it_should_behave_like "show index page title"    

end
