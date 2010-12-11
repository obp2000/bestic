require 'spec_helper'

describe "carts/_link_to_clear_cart" do

  before do
    template.stub( :do_not_show ).and_return( false )
    @cart = carts_proxy.first
    template.stub_chain( :session, :cart ).and_return( @cart )
  end
  
  it "renders link to clear cart" do
    template.should_receive( :link_to_delete ).with( @cart )    
    render
#    response.should have_text( regexp_for_remote_delete( cart_path ) )        
  end

end
