require 'spec_helper'

class Category; end

describe "categories/_category" do
  
  before do
    @object = categories_proxy.first    
  end
  
  it_should_behave_like "edit and new forms"  

end
