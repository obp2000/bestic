require 'spec_helper'

describe "carts/_link_to_clear_cart" do

  before do
    @cart = carts_proxy.first
    template.stub_chain( :session, :cart ).and_return( @cart )
    template.stub( :link_to_delete ).with( @cart ).and_return( link_to_remote "Test", :url => cart_path, :method => :delete )
  end

  context "when user can clear cart" do
    it "renders clear cart button" do
      template.stub( :do_not_show ).and_return( false )      
      render
      response.should have_text( regexp_for_remote_delete( cart_path ) )       
    end    
  end

  context "when user can not clear cart" do
    it "does not render clear cart button" do
      template.stub( :do_not_show ).and_return( true )      
      render
      response.should_not have_text( regexp_for_remote_delete( cart_path ) )       
    end    
  end

end
