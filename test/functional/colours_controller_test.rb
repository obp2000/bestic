require 'test_helper'

class ColoursControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colour" do
    assert_difference('Colour.count') do
      post :create, :colour => { }
    end

    assert_redirected_to colour_path(assigns(:colour))
  end

  test "should show colour" do
    get :show, :id => colours(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => colours(:one).id
    assert_response :success
  end

  test "should update colour" do
    put :update, :id => colours(:one).id, :colour => { }
    assert_redirected_to colour_path(assigns(:colour))
  end

  test "should destroy colour" do
    assert_difference('Colour.count', -1) do
      delete :destroy, :id => colours(:one).id
    end

    assert_redirected_to colours_path
  end
end
