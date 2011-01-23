# encoding: cp1251
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
  self.index_partial = "carts/cart"
  self.delete_text = "Очистить корзину"
  self.nav_image = "basket.png"
  self.nav_text = "Корзина"
          
  class_inheritable_accessor :cart, :index_tag, :cart_links
  self.index_tag = "cart"
  self.cart_links = [ "link_to_new_order_form", "link_to_clear_cart" ]

  attr_accessor_with_default( :delete_title ) { nil }
  attr_accessor_with_default( :total_items ) { cart_items.sum( :amount ) }
  attr_accessor_with_default( :cart_totals ) { [ [ "cart_total_items", total_items ], [ "cart_total_sum", total ] ] }    

  class << self

    def find_or_create( session ); find( session[ :cart_id ] ) rescue create.tap { |cart| session[ :cart_id ] = cart.id } end

    def destroy_object( params, session, flash ); session.cart.clear_cart( flash ) end      

  end

  def clear_cart( flash = nil ); cart_items.dup.tap { cart_items.clear; destroy_notice( flash ) if flash } end

  def populate_order( order ); cart_items.each { |cart_item| order.populate_order_item( cart_item ) } end

  def destroy_notice( flash ); flash.now[ :notice ] = "Корзина очищена" end  

end
