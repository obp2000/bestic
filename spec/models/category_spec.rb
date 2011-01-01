require 'spec_helper'

describe Category do
  before(:each) do
    @valid_attributes = valid_category_attributes
    @category = Category.new( @valid_attributes )
  end

  it "is valid with valid attributes" do
    @category.should be_valid
  end

  it "is not valid without a name" do
    @category.name = nil
    @category.should_not be_valid
  end
  
  it "should have unique name" do
    @category = Category.create(@valid_attributes)
    @category = Category.create(@valid_attributes)    
    @category.errors.size.should == 1
  end
  
  describe "#new_object" do
  
    before do
      @params = { "category" => valid_category_attributes }
      @session = {}
    end
  
    it "builds new category" do
      @category = Category.new_object( @params, @session )
      @category.name.should == valid_category_attributes[ :name ]
    end
  
  end
 
  describe "#save_object" do
  
    before do
      @params = { "category" => valid_category_attributes }
      @session = {}
      @flash = {}
      @flash.stub( :now ).and_return( @flash )      
    end
  
    it "saves new category" do
      create_category      
      @category.reload
      @category.name.should == valid_category_attributes[ :name ]
    end
  
  end  
  
  describe "#update_object" do
  
    before do
      @params = { "category" => valid_category_attributes }
      @updated_params = { "category" => { :name => "Shirts" } }      
      @session = {}
      @flash = {}
      @flash.stub( :now ).and_return( @flash )        
    end
  
    it "updates existing category" do
      create_category
      @category = Category.update_object( @updated_params.merge( :id => @category.id ), @session, @flash ).first
      @category.name.should == @updated_params[ "category" ][ :name ]
    end
  
  end
  
  describe "#destroy_object" do
  
    before do
      @params = { "category" => valid_category_attributes }
      @session = {}
      @flash = {}
      @flash.stub( :now ).and_return( @flash )        
    end
  
    it "destroys existing category" do
      create_category
      @params_for_destroy = { :id => @category.id }
      @category = Category.destroy_object( @params_for_destroy, @session, @flash )
      @category.name.should == @params[ "category" ][ :name ]
      Category.all.should_not include( @category )
    end
  
  end  
  
end
