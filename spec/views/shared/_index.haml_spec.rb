require 'spec_helper'

describe "shared/_index" do

  before do
    @objects = sizes_proxy
    @objects.first.class.stub( :new ).and_return( sizes_proxy.first.as_new_record )
  end

  it "renders index template" do
    template.should_receive( :will_paginate ).with( @objects )
    template.should_receive( :render ).with( :partial => @objects.first.class.name.underscore, :object => @objects.first.class.new )
    template.should_receive( :render ).with( :partial => @objects.first.class.name.underscore, :collection => @objects )
    template.should_receive( :draggable_element ).with( @objects.first.class.index_tag )
    render :locals => { :objects => @objects }
    response.should have_text( /\(&quot;##{@objects.first.class.name.tableize}&quot;\).remove/ )
  end

end
