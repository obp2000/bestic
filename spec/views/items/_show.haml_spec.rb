require 'spec_helper'

describe "items/_show" do

  before(:each) do
    assigns[:object] = items_proxy.first
    Item.stub( :season_name ).and_return( "Весна/Лето" )
  end
  
  it "shows only one existing item's details" do
    template.should_receive(:render_attrs).with( assigns[:object].sizes )
    template.should_receive(:render_attrs).with( assigns[:object].colours )      
    template.should_receive(:render).with( :partial => "shared/photo", :collection => assigns[:object].photos )
    render
    response.should contain( assigns[:object].name  )
    response.should contain( assigns[:object].category.name )
    response.should contain( Item.season_name )
    response.should contain( assigns[:object].price.to_s )
    response.should contain( assigns[:object].blurb )
  end

end
