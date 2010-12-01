require 'spec_helper'

describe "items/_form" do

  before(:each) do
    assigns[:all_seasons] = seasons_proxy
  end
  
  it "renders form for existing item" do
    assigns[:object] = items_proxy.first
    render
    response.should have_selector( "form", :method => "post", :action => item_path(assigns[:object]) ) do |form|
      form.should have_selector( "input#item_name", :type => "text", :name => "item[name]", :value => assigns[:object].name )
      form.should have_selector( "input#item_price", :type => "text", :name => "item[price]", :value => assigns[:object].price.to_s )
      form.should have_selector( "input#item_category_id", :type => "hidden", :name => "item[category_id]",
            :value => assigns[:object].category.id.to_s )
      form.should have_selector( "input#item_season_id_#{assigns[:all_seasons][0].id}", :type => "radio",
            :name => "item[season_id]", :value => assigns[:all_seasons][0].id.to_s )      
      form.should have_selector( "input#item_size_ids_", :type => "checkbox", :name => "item[size_ids][]",
            :value => assigns[:object].sizes[0].id.to_s )
      form.should have_selector( "input#item_colour_ids_", :type => "checkbox", :name => "item[colour_ids][]",
            :value => assigns[:object].colours[0].id.to_s )
      form.should have_selector("span", :style => "background-color: #{assigns[:object].colours[0].html_code}; border: 1px solid black; margin-left: -0px; margin-right: 0;" )            
      form.should have_selector( "img", :src => "/images/" + assigns[:object].photos[0].public_filename(:small) )
      form.should have_selector( "textarea.photo_comment", :content => assigns[:object].photos[0].comment )
      form.should have_selector( "textarea#item_blurb", :name => "item[blurb]", :content => assigns[:object].blurb )
      form.should have_selector( "input", :type => "image" )      
    end
  end

  it "renders form for new item" do
    assigns[:object] = mock_model(Item).as_null_object.as_new_record
    render
    response.should have_selector( "form", :method => "post", :action => items_path ) do |form|
      form.should have_selector( "input#item_name", :content => ""  )
      form.should have_selector( "input#item_price", :content => ""  )
      form.should have_selector( "input#item_category_id", :content => "" )
      form.should have_selector( "input#item_season_id_#{assigns[:all_seasons][0].id}", :value => assigns[:all_seasons][0].id.to_s )
      form.should_not have_selector( "input#item_size_ids_" )
      form.should_not have_selector( "input#item_colour_ids_" )
      form.should_not have_selector( "textarea.photo_comment" )
      form.should have_selector( "textarea#item_blurb", :content => "" )
      form.should have_selector( "input", :type => "image" )            
    end
  end

end
