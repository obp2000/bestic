require 'spec_helper'

class ProcessedOrder; end  
  
describe ProcessedOrdersController do
  
  before do
    @object = processed_orders_proxy.first
  end

  it_should_behave_like "object"  

  describe "GET close" do
    it "closes the requested order and renders close template" do
      @object.class.should_receive( :find ).with( @object.to_param ).and_return( @object )
      @object.should_receive( :close )
      xhr :get, :close, :id => @object.to_param
      assigns[ :object ].should equal( @object )
      response.should render_template( "close.rjs" )
    end
  end
 
end
