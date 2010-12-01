require 'spec_helper'

describe "/size1s/show.html.erb" do
  include Size1sHelper
  before(:each) do
    assigns[:size1] = @size1 = stub_model(Size1)
  end

  it "renders attributes in <p>" do
    render
  end
end
