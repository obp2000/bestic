require 'spec_helper'

describe "/size1s/edit.html.erb" do
  include Size1sHelper

  before(:each) do
    assigns[:size1] = @size1 = stub_model(Size1,
      :new_record? => false
    )
  end

  it "renders the edit size1 form" do
    render

    response.should have_tag("form[action=#{size1_path(@size1)}][method=post]") do
    end
  end
end
