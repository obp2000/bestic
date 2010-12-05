# coding: utf-8
class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, :through => :cart_items

  class << self  
    def class_name_rus; "корзина"; end

    def class_name_rus_cap; "Корзина"; end

    def destroy_object( params, session ); session.cart.clear_cart; end
    
    def delete_image; "basket_close.png"; end
  
    def delete_text; "Очистить корзину"; end
  
    def nav_image; "basket.png"; end
  
    def nav_text; "Корзина"; end
    
    def add_image; "basket_add.png"; end

    def add_over_image; "basket_add_over.png"; end

    def add_title; "Добавить этот #{Item.class_name_rus} в корзину"; end
      
    def add_image_with_options
      [ add_image, { :title => add_title, :onmouseover => "$(this).attr('src', 'images/#{add_over_image}')",
          :onmouseout => "$(this).attr('src', 'images/#{add_image}')", :onclick => "$(this).fadeOut().fadeIn()" } ]
    end

    def destroy_render; { :template => "shared/destroy.rjs" }; end
      
#for "shared/index
    def partial; "carts/cart"; end
    def content; "cart"; end
      
    def after_destroy_block
      lambda do |page, objects, session|
        p "eeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
        page.check_cart_links
        page.check_cart_totals( session )
      end
    end        
    
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
