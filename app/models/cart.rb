# coding: utf-8
class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :delete_all
  has_many :items, :through => :cart_items

  class << self  
    def class_name_rus; "корзина"; end

    def class_name_rus_cap; "Корзина"; end

    def destroy_object( params, session ); session.cart.clear_cart; end
    
    def delete_image; "basket_close.png"; end
  
    def delete_text; "Очистить корзину"; end
  
    def nav_image; "basket.png"; end
  
    def nav_text; "Корзина"; end
    
    def submit_image_with_options
      [ "image_submit_tag", submit_image, { :title => submit_title, :onmouseover => "$(this).attr('src', 'images/#{submit_over_image}')",
          :onmouseout => "$(this).attr('src', 'images/#{submit_image}')", :onclick => "$(this).fadeOut().fadeIn()" } ]
    end
    
    def submit_image; "basket_add.png"; end

    def submit_over_image; "basket_add_over.png"; end

    def submit_title; "Добавить этот #{class_name_rus} в корзину"; end 
      
#for "shared/index
    def index_partial; "carts/cart"; end
    def index_tag; "cart"; end
    
  end

  def clear_cart
    cart_items1 = self.cart_items.dup
    self.cart_items.clear
    cart_items1
   end

  def total_items; cart_items.sum(:amount); end

  def total_sum; cart_items.total; end    

  def populate_order( order ); cart_items.each { |cart_item| order.populate_order_item( cart_item ) }; end

  def destroy_notice; "Корзина очищена"; end

  def delete_title; nil; end   

  def update_notice; "Добавлен товар"; end

end
