require 'spec_helper'
  
describe OrdersController do
  
  before do
    controller.stub(:current_user).and_return( users_proxy.first )
    @order = orders_proxy.first
  end

  describe "GET index" do
    it "assigns all orders as @objects, new order as nil and renders index template" do
#      Order.should_receive( :paginate ).and_return( [ @order ] )
      Order.should_receive( :all_and_new ).and_return( [ [ @order ], @order ] )
      Order.should_receive( :index_render ).and_return( :template => "shared/index.rjs" )        
      xhr :get, :index
      assigns[ :objects ].should == [ @order ]
      response.should render_template( "shared/index.rjs" )      
    end
  end

  describe "GET show" do
    it "assigns the requested order as @object and renders show template" do
      Order.stub( :find ).with( "37" ).and_return( @order )
      xhr :get, :show, :id => "37"
      assigns[ :object ].should equal( @order )
      response.should render_template( "shared/show.rjs" )        
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested order and renders destroy template" do
      Order.should_receive( :find ).with( "37" ).and_return( @order )
      @order.should_receive( :destroy )
      xhr :delete, :destroy, :id => "37"
      assigns[ :object ].should equal( @order )
      response.should render_template( "shared/destroy.rjs" )
    end
  end

end
