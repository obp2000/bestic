require 'spec_helper'

describe "catalog_items/_nav" do

  before do
    assigns[:cart] = carts_proxy.first
    Category.stub(:all).and_return( categories_proxy )
    Season.stub(:all).and_return( seasons_proxy )
  end
  
  it "renders nav with seasons and categories" do
    render
    response.should have_selector("a") do |a|
      a.should contain( seasons_proxy.first.name )
      a.should contain( seasons_proxy.first.items.size.to_s )
    end
    response.should have_selector("a") do |a|
      a.should contain( seasons_proxy.second.name )
      a.should contain( seasons_proxy.second.items.size.to_s )
    end
    response.should have_selector("a") do |a|
      a.should contain( seasons_proxy.third.name )
      a.should contain( seasons_proxy.third.items.size.to_s )
    end
        
    response.should have_selector("a") do |a|
      a.should contain( seasons_proxy.first.items.first.category.name )
      a.should contain( "(#{seasons_proxy.first.categories.size.to_s})" )      
    end
    
    response.should have_selector("a") do |a|
      a.should contain( seasons_proxy.third.name )
      a.should contain( "(#{seasons_proxy.first.categories.size.to_s})" )        
    end

  end

  it "renders cart" do
    template.should_receive(:render).with( :partial => "carts/cart" )
    render
  end

end
