require 'spec_helper'

describe Size do
  before(:each) do
    @valid_attributes = valid_size_attributes
    @size = Size.new( @valid_attributes )
  end

  it "is valid with valid attributes" do
    @size.should be_valid
  end

  it "is not valid without a name" do
    @size.name = nil
    @size.should_not be_valid
  end
  
  it "should have unique name" do
    @size = Size.create(@valid_attributes)
    @size = Size.create(@valid_attributes)    
    @size.errors.size.should == 1
  end

  describe ".class_name_rus" do
    it "is a string" do
      Size.class_name_rus.class.should == String
    end
  end

  describe ".class_name_rus_cap" do
    it "is a string" do
      Size.class_name_rus_cap.class.should == String
    end
  end

  describe "#new_object" do
  
    before do
      @params = { "size" => valid_size_attributes }
      @session = {}
    end
  
    it "builds new size" do
      @size = Size.new_object( @params, @session )
      @size.name.should == valid_size_attributes[ :name ]
    end
  
  end
 
  describe "#save_object" do
  
    before do
      @params = { "size" => valid_size_attributes }
      @session = {}
    end
  
    it "saves new size" do
      create_size
      @size.reload
      @size.name.should == valid_size_attributes[ :name ]
    end
  
  end  
  
  describe "#update_object" do
  
    before do
      @params = { "size" => valid_size_attributes }
      @updated_params = { "size" => { :name => "S" } }      
      @session = {}
    end
  
    it "updates existing size" do
      create_size
      @size = Size.update_object( @updated_params.merge( :id => @size.id ), @session ).first
      @size.name.should == @updated_params[ "size" ][ :name ]
    end
  
  end
  
  describe "#destroy_object" do
  
    before do
      @params = { "size" => valid_size_attributes }
      @session = {}
    end
  
    it "destroys existing size" do
      create_size
      @params_for_destroy = { :id => @size.id }
      @size = Size.destroy_object( @params_for_destroy, @session )
      @size.name.should == valid_size_attributes[ :name ]
      Size.all.should_not include( @size )
    end
  
  end

end
