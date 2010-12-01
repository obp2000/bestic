require 'spec_helper'

describe Category do
  before(:each) do
    @valid_category_attributes = { :name => "category name", :season_id => 1 }
    @valid_season_attributes = { :name => "season name" }
    @category = Category.create @valid_category_attributes
    @season = Season.create @valid_season_attributes
  end

  it "should create a new instance given valid attributes" do
    c = Category.new :name => "category name 1", :season_id => 5 
    c.should be_valid
    c.save.should == true
  end

  it "should have name" do
    @category.name.should_not be_blank
  end
 
  it "should have season" do
    @category.should_receive(:season).and_return(@season)
    @category.season.name.should == "season name"
  end
  
  it "should have unique name_with_season" do
    @category1 = Category.create(@valid_category_attributes)
    @category1.errors.size.should == 1
  end
  
end
