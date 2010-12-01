require 'spec_helper'

describe Photo do
  before(:each) do
    @valid_attributes = valid_photo_attributes
    @photo = Photo.new( @valid_attributes )
  end

  it "is valid with valid attributes" do
    @photo.should be_valid
  end

  it "is not valid without a filename" do
    @photo.filename = nil
    @photo.should_not be_valid
  end

  describe "#new_object" do
  
    before do
      @params = { "photo" => valid_photo_attributes }
      @session = {}
    end
  
    it "builds new photo" do
      @photo = Photo.new_object( @params, @session )
      @photo.filename.should == valid_photo_attributes[ :filename ]
    end
  
  end

  describe "#save_object" do
  
    before do
      @params = { "photo" => valid_photo_attributes }
      @session = {}
    end
  
    it "saves new photo" do
      create_photo
      @photo.reload
      @photo.filename.should == valid_photo_attributes[ :filename ]
    end
  
  end  
  
  describe "#update_object" do
  
    before do
      @params = { "photo" => valid_photo_attributes }
      @updated_params = { "photo" => { :filename => "photo_of_shirt", :comment => "Photo of shirt" } }      
      @session = {}
    end
  
    it "updates existing photo comment" do
      create_photo
      @photo = Photo.update_object( @updated_params.merge( :id => @photo.id ), @session ).first
      @photo.comment.should == @updated_params[ "photo" ][ :comment ]
    end
  
  end
  
  describe "#destroy_object" do
  
    before do
      @params = { "photo" => valid_photo_attributes }
      @session = {}
    end
  
    it "destroys existing photo" do
      create_photo
      @params_for_destroy = { :id => @photo.id }
      @photo = Photo.destroy_object( @params_for_destroy, @session )
      @photo.filename.should == valid_photo_attributes[ :filename ]
      Photo.all.should_not include( @photo )
    end
  
  end  

end
