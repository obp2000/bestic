# coding: utf-8
class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item
  belongs_to :size
  belongs_to :colour
  
  class << self
  
    def class_name_rus; "товар"; end

    def class_name_rus_cap; "Товар"; end

    def update_object( params, session )
      conditions_hash = lambda { |session1| { :item_id => self[:id].gsub(/catalog_item_/, ""), :size_id => self[:size_id],
                      :colour_id => self[:colour_id], :cart_id => session1.cart.id } }
      [ update_cart_item( conditions_hash.bind( params )[ session ] ), true ]
    end

    def destroy_object( params, session ); find( params[:id] ).delete_cart_item; end  

    def controller; "catalog_items"; end  
      
    def update_render; { :template => "shared/create_or_update.rjs" }; end
    def destroy_render; { :template => "shared/create_or_update.rjs" }; end
      
# for "shared/create_or_update.rjs"
    def create_or_update_partial; "cart_items/cart_item"; end
    
    def after_create_or_update_block
      lambda do |page, object, session|
        page.remove object.tag unless object.amount > 0
        page.check_cart_links
        page.check_cart_totals( session )
      end
    end
    alias_method :after_destroy_block, :after_create_or_update_block
      
#for "shared/index
    def partial; "carts/cart"; end
    def content; "cart"; end      

  end

  def update_amount( i ); update_attribute :amount, amount + i; self; end   
  
  def name; item.name; end

  def price; item.price; end

  def delete_cart_item
    update_amount( -1 )    
    destroy unless amount > 0
    self
  end

  def update_notice; "Добавлен товар<br /> <em>#{name}</em>"; end

  def destroy_notice; "Удален товар <em>#{name}</em>"; end

  def populate_order_item_hash
    { :item_id => item_id, :price => price, :amount => amount,  :size_id => size_id, :colour_id => colour_id }
  end

# for "shared/create_or_update.rjs"
  def content_for_create_or_update; tag; end

  private
  
    def self.update_cart_item( conditions )
      first( :conditions => conditions ).update_amount( 1 ) rescue create( conditions.merge( :amount => 1 ) )      
    end
    
end
