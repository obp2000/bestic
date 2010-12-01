require 'spec_helper'

class Category; end  
  
describe CategoriesController do
  
  before do
    @object = categories_proxy.first    
  end

  it_should_behave_like "object"

end
