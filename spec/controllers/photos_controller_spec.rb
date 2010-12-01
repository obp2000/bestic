require 'spec_helper'

class Photo; end      
  
describe PhotosController do
  
  before do
    @object = photos_proxy.first
  end

  it_should_behave_like "object"
  
  it "should be able to upload item's photos" do
      image = fixture_path + "/test.jpg"
      file = ActionController::TestUploadedFile.new image, "image/jpeg"
      xhr :post, :create, :photo => { :uploaded_data => file }
      Photo.find( :last, :conditions => { :filename => "test.jpg" } ).filename.should == "test.jpg"
  end  

end
