require 'spec_helper'

describe Category1 do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :season_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Category1.create!(@valid_attributes)
  end
end
