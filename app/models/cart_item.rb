# coding: utf-8
class CartItem < ActiveRecord1
  belongs_to :cart
  belongs_to :item
  belongs_to :catalog_item, :foreign_key => :item_id  
  belongs_to :size
  belongs_to :colour
  
  delegate :name, :price, :to => :item
  
  self.class_name_rus = "товар"
  self.class_name_rus_cap = "Товар"
  self.index_partial = "carts/cart"  
  
  class_inheritable_accessor :create_or_update_partial
  self.create_or_update_partial = "cart_items/cart_item"
  
  attr_accessor_with_default( :create_or_update_tag ) { tag }     
  
  class << self

    def update_object( params, session, flash )
      [ update_cart_item( params.conditions_hash( session ) ).tap { |cart_item| cart_item.update_notice( flash ) }, true ]
    end

    def destroy_object( params, session, flash )
      find( params[ :id ] ).tap { |cart_item| cart_item.delete_cart_item; cart_item.destroy_notice( flash ) }
    end

  end

  def delete_cart_item; tap { update_amount( -1 ) }; destroy if amount.zero? end   
  
  def render_create_or_update( page, session )
    super
    page.after_create_or_update_cart_item tag, ( amount.zero? or session.cart.cart_items.empty? ), session
  end  
  alias_method :render_destroy, :render_create_or_update

  def update_amount( i ); update_attribute :amount, amount + i end   

  def update_notice( flash ); flash.now[ :notice ] = "Добавлен товар<br /> <em>#{name}</em>" end

  def destroy_notice( flash ); flash.now[ :notice ] = "Удален товар <em>#{name}</em>" end

  def populate_order_item_hash
    { :item_id => item_id, :price => price, :amount => amount,  :size_id => size_id, :colour_id => colour_id }
  end

  private
  
    def self.update_cart_item( conditions )
      first( :conditions => conditions ).tap { |cart_item| cart_item.update_amount( 1 ) } rescue
              create( conditions.merge :amount => 1 )
    end
    
end

class Hash
  
  def conditions_hash( session )
      { :item_id => self[ :id ].gsub(/catalog_item_/, ""), :size_id => self[ :size_id ], :colour_id => self[ :colour_id ],
              :cart_id => session.cart.id }
  end  
  
end
