require 'spec_helper'

describe SizesController do

  def mock_size(stubs={})
    @mock_size ||= mock_model(Size, stubs)
  end

  describe "GET _index" do
    it "assigns all sizes as @sizes" do
      Size.stub(:find).with(:all).and_return([mock_size])
      get :_index
      assigns[:sizes].should == [mock_size]
    end
  end

  describe "GET show" do
    it "assigns the requested size as @size" do
      Size.stub(:find).with("37").and_return(mock_size)
      get :show, :id => "37"
      assigns[:size].should equal(mock_size)
    end
  end

  describe "GET new" do
    it "assigns a new size as @size" do
      Size.stub(:new).and_return(mock_size)
      get :new
      assigns[:size].should equal(mock_size)
    end
  end

  describe "GET edit" do
    it "assigns the requested size as @size" do
      Size1.stub(:find).with("37").and_return(mock_size)
      get :edit, :id => "37"
      assigns[:size].should equal(mock_size)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created size as @size" do
        Size.stub(:new).with({'these' => 'params'}).and_return(mock_size(:save => true))
        post :create, :size => {:these => 'params'}
        assigns[:size].should equal(mock_size)
      end

      it "redirects to the created size" do
        Size1.stub(:new).and_return(mock_size(:save => true))
        post :create, :size => {}
        response.should redirect_to(size_url(mock_size))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved size as @size" do
        Size.stub(:new).with({'these' => 'params'}).and_return(mock_size(:save => false))
        post :create, :size => {:these => 'params'}
        assigns[:size].should equal(mock_size)
      end

      it "re-renders the 'new' template" do
        Size.stub(:new).and_return(mock_size(:save => false))
        post :create, :size => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested size1" do
        Size.should_receive(:find).with("37").and_return(mock_size)
        mock_size.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :size => {:these => 'params'}
      end

      it "assigns the requested size as @size" do
        Size.stub(:find).and_return(mock_size(:update_attributes => true))
        put :update, :id => "1"
        assigns[:size].should equal(mock_size)
      end

      it "redirects to the size" do
        Size.stub(:find).and_return(mock_size(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(size_url(mock_size))
      end
    end

    describe "with invalid params" do
      it "updates the requested size" do
        Size.should_receive(:find).with("37").and_return(mock_size)
        mock_size.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :size => {:these => 'params'}
      end

      it "assigns the size as @size" do
        Size.stub(:find).and_return(mock_size(:update_attributes => false))
        put :update, :id => "1"
        assigns[:size].should equal(mock_size)
      end

      it "re-renders the 'edit' template" do
        Size.stub(:find).and_return(mock_size(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested size" do
      Size.should_receive(:find).with("37").and_return(mock_size)
      mock_size.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sizes list" do
      Size.stub(:find).and_return(mock_size(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(sizes_url)
    end
  end

end
