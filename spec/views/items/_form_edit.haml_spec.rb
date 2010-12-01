require 'spec_helper'

describe "items/_form" do
  before do
    assigns[:object] = items_proxy.second
  end
  context "when the item is an existing record" do
    it_should_behave_like "a template that renders the items/form partial"
    it "renders the form for edit item" do
      render
      response.should have_selector( "form", :method => "post", :action => item_path(assigns[:object]) )
    end
  end
end