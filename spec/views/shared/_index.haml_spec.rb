require 'spec_helper'

describe "shared/_index" do

  before do
    @objects = sizes_proxy
    @object = @objects.first.as_new_record
  end

  it "renders index template" do
    template.should_receive( :will_paginate ).with( @objects )
    template.should_receive( :render ).with( :partial => @objects.first.class.new_partial, :object => @object )
    template.should_receive( :render ).with( :partial => @objects.first.class.edit_partial, :collection => @objects )
    template.should_receive( :draggable_element ).with( @objects.first.class.index_tag )
    render :locals => { :objects => @objects }
    response.should have_text( /\(&quot;##{@objects.first.class.name.tableize}&quot;\).remove/ )
  end

end
