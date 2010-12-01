require 'spec_helper'

describe "catalog_items/_nav" do

  before(:each) do
    assigns[:cart] = carts_proxy.first
    Category.stub(:all).and_return( categories_proxy )
    Season.stub(:all).and_return( seasons_proxy )
  end
  
  it "renders nav with seasons and categories" do
    render
    response.should have_selector("a") do |a|
      a.should contain( seasons_proxy[0].name )
      a.should contain( "(#{seasons_proxy[0].items.size})" )
    end
    response.should have_selector("a") do |a|
      a.should contain( seasons_proxy[1].name )
      a.should contain( "(#{seasons_proxy[1].items.size})" )
    end
        
    response.should have_selector("a") do |a|
      a.should contain( categories_proxy.first.name )
      a.should contain( "(#{categories_proxy.first.items[0].find_all_by_season_id.size})" )      
    end    
    response.should have_selector("a") do |a|
      a.should contain( "Все товары" )
      a.should contain( "(#{categories_proxy.first.items.size})" )
    end
    response.should have_selector("a") do |a|
      a.should contain( "Корзина" )
    end
  end

  it "renders cart item" do
    render
    response.should have_selector("div#cart_item_#{assigns[:cart].cart_items[0].id}") do |cart_item|
      cart_item.should have_selector("a") do |a|
        a.should contain(assigns[:cart].cart_items[0].name)
      end
      cart_item.should contain(assigns[:cart].cart_items[0].item.price.to_s)
    end
  end

end
