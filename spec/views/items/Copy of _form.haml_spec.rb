require 'spec_helper'

describe "items/_form" do

  before(:each) do
    Season.stub(:all).and_return( @seasons = seasons_proxy )
    assigns[:object] = items_proxy.first
  end
  
  it_should_behave_like "a template that renders the items/form partial"
  
  context "when the item is an existing record" do
    it "renders a form to update an item" do
      template.should_receive(:render).with( :partial => "category", :object => assigns[:object].category )
      template.should_receive(:render).with( :partial => "size", :collection => assigns[:object].sizes )
      template.should_receive(:render).with( :partial => "colour", :collection => assigns[:object].colours )
      template.should_receive(:render).with( :partial => "photo", :collection => assigns[:object].photos )      
      render
      response.should have_selector( "form", :method => "post", :action => item_path(assigns[:object]) ) do |form|
        form.should have_selector( "input#item_name", :type => "text", :name => "item[name]", :value => assigns[:object].name )
        form.should have_selector( "input#item_price", :type => "text", :name => "item[price]", :value => assigns[:object].price.to_s )
        response.should have_selector( "input#item_season_id_#{@seasons.first.id}", :type => "radio",
              :name => "item[season_id]", :value => @seasons.first.to_param )  
        response.should have_selector( "img", :src => "/images/" + @seasons.first.icon )
        response.should have_selector( "input#item_season_id_#{@seasons.second.id}", :type => "radio",
              :name => "item[season_id]", :value => @seasons.second.to_param )  
        response.should have_selector( "img", :src => "/images/" + @seasons.second.icon )      
        form.should have_selector( "textarea#item_blurb", :name => "item[blurb]", :content => assigns[:object].blurb )
        form.should contain( assigns[:object].created_at.strftime("%d.%m.%y") )
        form.should contain( assigns[:object].created_at.strftime("%H:%M:%S") )        
        form.should contain( assigns[:object].updated_at.strftime("%d.%m.%y") )
        form.should contain( assigns[:object].updated_at.strftime("%H:%M:%S") )       
        form.should have_selector( "input", :type => "image" )      
      end
    end
  end

  context "when the item is a new record" do
    it "renders a form to create an item" do
#      assigns[:object] =  items_proxy.first.as_new_record

    end
  end



end

