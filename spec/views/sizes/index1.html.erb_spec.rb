require 'spec_helper'

describe "sizes/_index" do
  include SizesHelper
  
  before(:each) do
    assigns[:sizes] = @sizes = [stub_model(Size, :id => 1, :name => "Testing"), stub_model(Size)]
    assigns[:size] = @size = stub_model(Size, :new_record? => true )
  end
  
  it "renders a list of sizes" do
    render
  end
  
  it "renders new size form" do
    render
    response.should have_tag("form[action=?][method=post]", sizes_path) do
    end
  end
  
  it "renders the edit size form" do
    assigns[:size] = @size = stub_model(Size, :new_record? => false)
    render
    response.should have_tag("form[action=#{size_path(@size)}][method=post]") do
    end
  end
  
  it "renders attributes in <p>" do
    render
  end  
    
  it "should display div with id sizes" do
    render
    response.should have_tag("div#sizes")
  end
  
  it "should display form#edit_size_1" do
    render
    response.should have_tag("form#edit_size_1") do
      with_tag("input#size_name[value=Testing]")
      with_tag("input#size_submit")
    end
  end

end
