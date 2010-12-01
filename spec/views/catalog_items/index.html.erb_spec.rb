require 'spec_helper'

describe "catalog_items/_index" do

  before(:each) do
    assigns[:catalog_items] = items_proxy
    template.stub(:will_paginate)
  end
  
  it "renders only one existing catalog item" do
    render
    response.should have_selector( "img", :src => "/images/" + assigns[:catalog_items][0].photos[0].public_filename(:small) )
    response.should contain( assigns[:catalog_items][0].photos[0].comment )  
    response.should contain( assigns[:catalog_items][0].name )
    response.should contain( assigns[:catalog_items][0].price.to_s )    
    response.should have_selector( "input#size_id_#{assigns[:catalog_items][0].sizes[0].id}", :type => "radio",
          :name => "size_id", :value => assigns[:catalog_items][0].sizes[0].to_param )
    response.should contain( assigns[:catalog_items][0].sizes[0].name )    
    response.should have_selector( "input#colour_id_#{assigns[:catalog_items][0].colours[0].id}", :type => "radio",
          :name => "colour_id", :value => assigns[:catalog_items][0].colours[0].to_param )        
    response.should have_selector("span", :style => "background-color: #{assigns[:catalog_items][0].colours[0].html_code}; border: 1px solid black; margin-left: -0px; margin-right: 0;" )
    response.should have_selector( "input", :type => "image" )
    response.should contain( assigns[:catalog_items][0].blurb )
  end

end
