require 'spec_helper'

describe SizesController, "POST create" do
  
  before(:each) do
    controller.stub!(:current_user).and_return mock_model(User)
    @size = mock_model(Size, :save => nil)
    Size.stub(:new).and_return(@size)
  end

  it "creates a new size" do
    Size.should_receive(:new).with("name" => "Test").and_return(@size)
    xhr :post, :create, :size => {"name" => "Test"}
  end

  it "saves the size" do
    @size.should_receive(:save)
    xhr :post, :create
  end
  
  context "when the size saves successfully" do
    before(:each) do
      @size.stub(:save).and_return(true)
    end
    
#    it "sets a flash[:notice] message" do
#      post :create
#      flash.now[:notice].should == "Размер одежды создан удачно."
#    end
   
  end

  context "when the size fails to save" do
    before(:each) do
      @size.stub(:save).and_return(false)
    end
    
    it "assigns @size" do
      xhr :post, :create
      assigns[:size].should == @size
    end
    
    it "renders the new template" do
      xhr :post, :create
      response.should render_template("new")
    end
    
  end

end
