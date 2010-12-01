require 'spec_helper'

describe Size1sController do

  def mock_size1(stubs={})
    @mock_size1 ||= mock_model(Size1, stubs)
  end

  describe "GET index" do
    it "assigns all size1s as @size1s" do
      Size1.stub(:find).with(:all).and_return([mock_size1])
      get :index
      assigns[:size1s].should == [mock_size1]
    end
  end

  describe "GET show" do
    it "assigns the requested size1 as @size1" do
      Size1.stub(:find).with("37").and_return(mock_size1)
      get :show, :id => "37"
      assigns[:size1].should equal(mock_size1)
    end
  end

  describe "GET new" do
    it "assigns a new size1 as @size1" do
      Size1.stub(:new).and_return(mock_size1)
      get :new
      assigns[:size1].should equal(mock_size1)
    end
  end

  describe "GET edit" do
    it "assigns the requested size1 as @size1" do
      Size1.stub(:find).with("37").and_return(mock_size1)
      get :edit, :id => "37"
      assigns[:size1].should equal(mock_size1)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created size1 as @size1" do
        Size1.stub(:new).with({'these' => 'params'}).and_return(mock_size1(:save => true))
        post :create, :size1 => {:these => 'params'}
        assigns[:size1].should equal(mock_size1)
      end

      it "redirects to the created size1" do
        Size1.stub(:new).and_return(mock_size1(:save => true))
        post :create, :size1 => {}
        response.should redirect_to(size1_url(mock_size1))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved size1 as @size1" do
        Size1.stub(:new).with({'these' => 'params'}).and_return(mock_size1(:save => false))
        post :create, :size1 => {:these => 'params'}
        assigns[:size1].should equal(mock_size1)
      end

      it "re-renders the 'new' template" do
        Size1.stub(:new).and_return(mock_size1(:save => false))
        post :create, :size1 => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested size1" do
        Size1.should_receive(:find).with("37").and_return(mock_size1)
        mock_size1.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :size1 => {:these => 'params'}
      end

      it "assigns the requested size1 as @size1" do
        Size1.stub(:find).and_return(mock_size1(:update_attributes => true))
        put :update, :id => "1"
        assigns[:size1].should equal(mock_size1)
      end

      it "redirects to the size1" do
        Size1.stub(:find).and_return(mock_size1(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(size1_url(mock_size1))
      end
    end

    describe "with invalid params" do
      it "updates the requested size1" do
        Size1.should_receive(:find).with("37").and_return(mock_size1)
        mock_size1.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :size1 => {:these => 'params'}
      end

      it "assigns the size1 as @size1" do
        Size1.stub(:find).and_return(mock_size1(:update_attributes => false))
        put :update, :id => "1"
        assigns[:size1].should equal(mock_size1)
      end

      it "re-renders the 'edit' template" do
        Size1.stub(:find).and_return(mock_size1(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested size1" do
      Size1.should_receive(:find).with("37").and_return(mock_size1)
      mock_size1.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the size1s list" do
      Size1.stub(:find).and_return(mock_size1(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(size1s_url)
    end
  end

end
