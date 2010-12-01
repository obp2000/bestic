require 'spec_helper'

class Item; end

describe "items/_index" do

  before do
    assigns[ :objects ] = items_proxy
    assigns[ :object ] = items_proxy.second.as_new_record
  end
  
  it "renders one existing item" do
    template.should_receive( :page_title )
    template.should_receive( :will_paginate ).with( assigns[:objects] )    
    template.should_receive( :render ).with( :partial => "item", :collection => assigns[ :objects ] )
    template.should_receive(:render).with( :partial => assigns[ :object ].class.new_or_edit_partial )      
    render :locals => { :objects => assigns[ :objects ], :object => assigns[ :object ] }
    response.should have_link_to_remote_get( items_path( :sort_by => "name" ) )
    response.should have_link_to_remote_get( items_path( :sort_by => "sizes" ) )
    response.should have_link_to_remote_get( items_path( :sort_by => "colours" ) )
    response.should have_link_to_remote_get( items_path( :sort_by => "category" ) )
    response.should have_link_to_remote_get( items_path( :sort_by => "price" ) )    
    response.should have_link_to_remote_get( new_item_path )
  end

end
