Given /^товар с названием "Куртка"$/ do
  @leto = Season.create!(:name => "Весна/Лето", :icon => "gadu.png")
  @kurtky = Category.create!(:name => "Куртки", :season => @leto)
  @kurtka = Item.create!(:name => "Куртка", :category => @kurtky, :price => 500 )
  visit catalog_items_path
end

When /^я открываю главную страницу$/ do
  
end
Then /^я должен видеть в общем списке товар с названием "Куртка"$/ do
  response.should contain("Куртка")
  response.should contain("Куртки")
  response.should contain("500")
  response.should have_selector(:form)
end

When /^я кликаю ссылку "Куртка"$/ do
  click_link "Куртка"
end
Then /^я должен видеть детали товара с названием "Куртка"$/ do
  response.should have_selector("#details") do |details|
    details.shouls contain( "Куртка")
  end
end

When /^я кликаю ссылку "Корзина" товара "Куртка"$/ do
  selenium.click "//form[@id='form_item_#{@kurtka.id}']/div[4]/input"
end
Then /^я должен видеть товар с названием "Куртка" в корзине$/ do
  response.should have_selector("#cart") do |cart|
    cart.should contain( "Куртка")
  end
end

