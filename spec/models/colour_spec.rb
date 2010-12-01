require 'spec_helper'

describe Colour do
  before(:each) do
    @valid_attributes = valid_colour_attributes
    @colour = Colour.new( @valid_attributes )
  end

  it "is valid with valid attributes" do
    @colour.should be_valid
  end

  it "is not valid without a name" do
    @colour.name = nil
    @colour.should_not be_valid
  end

  it "is not valid without a html_code" do
    @colour.html_code = nil
    @colour.should_not be_valid
  end  
  
  it "should have unique name" do
    @colour = Colour.create(@valid_attributes)
    @colour.html_code = "#00FF00"
    @colour.save
    @colour = Colour.create(@valid_attributes)    
    @colour.errors.size.should == 1
  end

  it "should have unique html_code" do
    @colour = Colour.create(@valid_attributes)
    @colour.name = "Blue"
    @colour.save
    @colour = Colour.create(@valid_attributes)    
    @colour.errors.size.should == 1
  end

  describe "#new_object" do
  
    before do
      @params = { "colour" => valid_colour_attributes }
      @session = {}
    end
  
    it "builds new colour" do
      @colour = Colour.new_object( @params, @session )
      @colour.name.should == valid_colour_attributes[ :name ]
    end
  
  end
 
  describe "#save_object" do
  
    before do
      @params = { "colour" => valid_colour_attributes }
      @session = {}
    end
  
    it "saves new colour" do
      create_colour
      @colour.reload
      @colour.name.should == valid_colour_attributes[ :name ]
    end
  
  end  
  
  describe "#update_object" do
  
    before do
      @params = { "colour" => valid_colour_attributes }
      @updated_params = { "colour" => { :name => "Green", :html_code => "#00ff00" } }
      @session = {}
    end
  
    it "updates existing colour" do
      create_colour
      @colour = Colour.update_object( @updated_params.merge( :id => @colour.id ), @session ).first
      @colour.name.should == @updated_params[ "colour" ][ :name ]
    end
  
  end
  
  describe "#destroy_object" do
  
    before do
      @params = { "colour" => valid_colour_attributes }
      @session = {}
    end
  
    it "destroys existing colour" do
      create_colour
      @params_for_destroy = { :id => @colour.id }
      @colour = Colour.destroy_object( @params_for_destroy, @session )
      @colour.name.should == valid_colour_attributes[ :name ]
      Colour.all.should_not include( @colour )
    end
  
  end

end
