# coding: utf-8
class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item
  belongs_to :catalog_item, :foreign_key => :item_id  
  belongs_to :size
  belongs_to :colour
  
  class << self
  
    def class_name_rus; "товар"; end

    def class_name_rus_cap; "Товар"; end

    def update_object( params, session ); [ update_cart_item( params.conditions_hash( session ) ), true ]; end

    def destroy_object( params, session ); find( params[:id] ).delete_cart_item; end  
      
# for "shared/create_or_update.rjs"
    def create_or_update_partial; "cart_items/cart_item"; end
     
#for "shared/index
    def index_partial; "carts/cart"; end

  end
  
  def create_or_update1( page, session )
    super page, session
    page.after_create_or_update_cart_item tag, amount, session
#    page.delay( DURATION ) do
#      page.action :remove, tag unless amount > 0 rescue nil
#      page.check_cart_links
#      page.check_cart_totals( session )
#    end
  end  
  alias_method :destroy1, :create_or_update1

  def update_amount( i ); update_attribute :amount, amount + i; self; end   
  
  def name; item.name; end

  def price; item.price; end

  def update_notice; "Добавлен товар<br /> <em>#{name}</em>"; end

  def destroy_notice; "Удален товар <em>#{name}</em>"; end

  def populate_order_item_hash
    { :item_id => item_id, :price => price, :amount => amount,  :size_id => size_id, :colour_id => colour_id }
  end

# for "shared/create_or_update.rjs"
  def create_or_update_tag; tag; end

  private
  
    def self.update_cart_item( conditions )
      first( :conditions => conditions ).update_amount( 1 ) rescue create( conditions.merge( :amount => 1 ) )      
    end

    def delete_cart_item
      update_amount( -1 )    
      destroy unless amount > 0
      self
    end    
    
end

class Hash
  
  def conditions_hash( session )
      { :item_id => self[:id].gsub(/catalog_item_/, ""), :size_id => self[:size_id], :colour_id => self[:colour_id],
              :cart_id => session.cart.id }
  end  
  
end
