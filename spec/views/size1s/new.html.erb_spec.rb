require 'spec_helper'

describe "/size1s/new.html.erb" do
  include Size1sHelper

  before(:each) do
    assigns[:size1] = stub_model(Size1,
      :new_record? => true
    )
  end

  it "renders new size1 form" do
    render

    response.should have_tag("form[action=?][method=post]", size1s_path) do
    end
  end
end
