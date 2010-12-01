require 'spec_helper'

describe "shared/_index" do

  before do
    @objects = sizes_proxy
    @object = @objects.first
  end

  it "renders index template" do
    template.should_receive( :link_to_close_window ).with( @object )    
    template.should_receive( :will_paginate ).with( @objects )
    template.should_receive( :render ).with( :partial => @object.new_partial, :object => @object )
    template.should_receive( :render ).with( :partial => @object.edit_partial, :collection => @objects )
    template.should_receive( :draggable_element ).with( @object.list_tag )
    render :locals => { :objects => @objects, :object => @object }
  end

  
  it "renders one new size and one existing size" do
    @object = sizes_proxy.first
    @collection = sizes_proxy
    template.should_receive(:render).with( :partial => "size", :object => @object )
    template.should_receive(:render).with( :partial => "size", :collection => @collection )        
    render :locals => { :object => @object, :collection => @collection }
  end

  it "renders one new colour and one existing colour" do
    @object = colours_proxy.first
    @collection = colours_proxy
    template.should_receive(:render).with( :partial => "colour", :object => @object )
    template.should_receive(:render).with( :partial => "colour", :collection => @collection )
    template.should_receive(:will_paginate)          
    render :locals => { :object => @object, :collection => @collection }
  end

  it "renders one new category and one existing category" do
    @object = categories_proxy.first
    @collection = categories_proxy
    template.should_receive(:render).with( :partial => "category", :object => @object )
    template.should_receive(:render).with( :partial => "category", :collection => @collection )
    render :locals => { :object => @object, :collection => @collection }
  end

  it "renders form for uploading a new photo and one existing photo" do
    @object = photos_proxy.first
    @collection = photos_proxy
    template.should_receive(:render).with( :partial => "upload_photo", :object => @object )
    template.should_receive(:render).with( :partial => "photo", :collection => @collection )
    template.should_receive(:will_paginate)       
    render :locals => { :object => @object, :collection => @collection }
  end

  it "renders form for editing contact information" do
    @object = contacts_proxy.first    
    @collection = contacts_proxy
    template.should_receive(:render).with( :partial => "contact", :collection => @collection )
    render :locals => { :object => @object, :collection => @collection }
  end

end
