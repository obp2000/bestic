require 'spec_helper'

describe "/size1s/index.html.erb" do
  include Size1sHelper

  before(:each) do
    assigns[:size1s] = [
      stub_model(Size1),
      stub_model(Size1)
    ]
  end

  it "renders a list of size1s" do
    render
  end
end
