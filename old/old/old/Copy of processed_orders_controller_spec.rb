require 'spec_helper'
  
describe ProcessedOrdersController do
  
  before do
    controller.stub(:current_user).and_return( users_proxy.first )
    @order = orders_proxy.first
  end

  describe "GET new" do
    it "assigns a new order as @object and renders new template" do
      ProcessedOrder.should_receive( :new ).and_return( @order )
      xhr :get, :new
      assigns[ :object ].should equal( @order )
      response.should render_template( "shared/new_or_edit.rjs" )           
    end
  end

  describe "GET close" do
    it "closes the requested order renders close template" do
      ProcessedOrder.should_receive( :find ).with( "37" ).and_return( @order )
      @order.should_receive( :close )
      xhr :get, :close, :id => "37"
      assigns[ :object ].should equal( @order )
      response.should render_template( "close.rjs" )
    end
  end
 
  describe "POST create" do
    it "creates a new order" do
      ProcessedOrder.should_receive( :new ).and_return( @order )
      @order.should_receive( :save_object )
      xhr :post, :create, :order => { :email => @order.email }
    end

    context "with valid params" do
      it "assigns a newly created order as @object and renders create template" do
        ProcessedOrder.stub( :new_object ).and_return( @order )
        @order.stub( :save_object ).and_return( true )
        xhr :post, :create, :order => { "email" => @order.email }
        assigns[ :object ].should == @order
        response.should render_template( "create.rjs" )
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved order as @object and re-renders new template" do
        ProcessedOrder.stub( :new_object ).and_return( @order )
        @order.stub( :save_object ).and_return( false )
        xhr :post, :create, :order => { :email => @order.email }
        assigns[ :object ].should == @order
        response.should render_template( "shared/new_or_edit.rjs" )               
      end
    end
  end

end
