require 'spec_helper'

describe "carts/_link_to_clear_cart" do

  before do
    template.stub( :do_not_show ).and_return( false )
  end
  
  it "renders link to clear cart" do
    render
    response.should have_text( regexp_for_remote_delete( cart_path ) )        
  end

end
