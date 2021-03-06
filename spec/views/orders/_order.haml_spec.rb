require 'spec_helper'

#Order::STATUS_RUS = "test"

describe "orders/_order" do

  before do
    @order = orders_proxy.first
    template.stub( :link_to_delete ).with( @order ).and_return( link_to_remote "Test",
            :url => order_path( @order ), :method => :delete )
    template.stub( :link_to_close ).with( @order ).and_return( link_to_remote "Test",
            :url => close_processed_order_path( @order ), :method => :get )            
#    @order.stub( :closed? ).and_return( false )
#    template.stub( :link_to_delete )      
  end
  
  it "renders order" do
    render :locals => { :order => @order }
    response.should have_selector( "tr", :onclick => "$.get('#{order_path(@order)}')" )
    response.should contain(@order.to_param)
    response.should contain(@order.class.status_rus)
    response.should contain(@order.total.to_s)
    response.should contain(@order.items.size.to_s)
    response.should contain(@order.created_at.strftime("%d.%m.%y"))
    response.should contain(@order.created_at.strftime("%H:%M:%S"))
    response.should have_text( regexp_for_remote_delete( order_path( @order ) ) )       
  end
  
  context "if processed order" do

    it "renders link to close order" do
      @order.stub( :closed? ).and_return( false )
      render :locals => { :order => @order }      
      response.should have_text( regexp_for_remote_close( close_processed_order_path( @order ) ) )
    end
    
  end
  
  context "if closed order" do

    it "not renders link to close order" do
      @order.stub( :closed? ).and_return( true )
#      template.should_not_receive( :link_to_close ).with( @order )        
      render :locals => { :order => @order }      
      response.should_not have_text( regexp_for_remote_close( close_processed_order_path( @order ) ) )
    end
    
  end

end
