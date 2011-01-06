require 'spec_helper'

describe Order do

  describe "#destroy_object" do
  
    before do
      @params = { "order" => valid_order_attributes }
      @session = {}
      @flash = {}
      @flash.stub( :now ).and_return( @flash )        
    end
  
    it "destroys existing order" do
      @order = Order.new_object( @params, @session )
      @order.save_object( @session, @flash ) 
      @params_for_destroy = { :id => @order.id }
      @order = Order.destroy_object( @params_for_destroy, @session, @flash )
      @order.email.should == valid_order_attributes[ :email ]
      Order.all.should_not include( @order )
      @flash.now[ :notice ].should contain( "удалён" )      
    end
  
  end

end
