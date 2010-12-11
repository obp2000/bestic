require 'spec_helper'

class Size; end

describe "shared/_index" do

  before do
    @objects = sizes_proxy
    @object = @objects.first
  end

  it "renders index template" do
    template.should_receive( :link_to_close_window ).with( @object.class )    
    template.should_receive( :will_paginate ).with( @objects )
    template.should_receive( :render ).with( :partial => @object.class.new_partial, :object => @object.class.new )
    template.should_receive( :render ).with( :partial => @object.class.edit_partial, :collection => @objects )
    template.should_receive( :draggable_element ).with( @object.class.index_tag )
    render :locals => { :objects => @objects, :object => @object }
  end

end
