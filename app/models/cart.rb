# coding: utf-8
class Cart < ActiveRecord1
  has_many :cart_items, :dependent => :delete_all
  has_many :items, :through => :cart_items

  delegate :total, :to => :cart_items

  self.class_name_rus = "корзина"
  self.class_name_rus_cap = "Корзина"
  self.delete_image = "basket_close.png"
  self.submit_with_options = [ "image_submit_tag", "basket_add.png",
    { :title => "Добавить этот #{CatalogItem.class_name_rus} в корзину",
     :onmouseover => "$(this).attr('src', 'images/basket_add_over.png')",
     :onmouseout => "$(this).attr('src', 'images/basket_add.png')",
     :onclick => "$(this).fadeOut().fadeIn()" } ]
  self.submit_title = "Добавить этот #{CatalogItem.class_name_rus} в корзину"
  self.index_partial = "carts/cart"
  self.delete_text = "Очистить корзину"
  self.nav_image = "basket.png"
  self.nav_text = "Корзина"
#  self.submit_over_image = "basket_add_over.png"  
          
  class_inheritable_accessor :cart, :index_tag
  self.index_tag = "cart"

  class << self

    def destroy_object( params, session, flash ); session.cart.clear_cart( flash ); end
    
  end

  def clear_cart( flash )
    cart_items1 = self.cart_items.dup
    self.cart_items.clear
    destroy_notice( flash )
    cart_items1
   end

  def total_items; cart_items.sum( :amount ); end

  def populate_order( order ); cart_items.each { |cart_item| order.populate_order_item( cart_item ) }; end

  def destroy_notice( flash ); flash.now[ :notice ] = "Корзина очищена"; end

  def delete_title; nil; end   

#  def update_notice( flash ); flash.now[ :notice ] = "Добавлен товар"; end

end
