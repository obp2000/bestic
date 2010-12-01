require 'spec_helper'

class Size; end

describe "sizes/_index" do

  before(:each) do
    assigns[:sizes] = [mock_model(Size, :name => "Test")]
    assigns[:size] = mock_model(Size).as_null_object.as_new_record
  end
  
  it "renders only one existing size and only one new size" do
    render
    response.should have_selector("form", :count => 2)
  end
  
  it "renders a list of forms to edit existing sizes" do
    render
    response.should have_selector("form.edit_size", :method => "post", :action => size_path(assigns[:sizes][0])) do |form|
      form.should have_selector("input#size_name", :type => "text", :name => "size[name]", :value => "Test" )
      form.should have_selector("input", :type => "image")
      form.should have_selector("a") do |a|
        a.should have_selector("img", :alt => "Delete")
      end
    end
  end

  it "renders a form to create a new size" do
    render
    response.should have_selector("form#new_size", :method => "post", :action => sizes_path) do |form|
      form.should have_selector("input#size_name", :type => "text", :name => "size[name]")
      form.should have_selector("input", :type => "image")
    end
  end

end
