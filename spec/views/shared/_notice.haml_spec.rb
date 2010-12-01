require 'spec_helper'

describe "shared/_notice" do

  before do
    flash[ :notice ] = "Notice"
  end
  
  it "renders notice" do
    render
    response.should contain( "Notice" )   
  end

end
