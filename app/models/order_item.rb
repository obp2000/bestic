# coding: utf-8
class OrderItem < ActiveRecord1
  belongs_to :order 
  belongs_to :item
  belongs_to :size
  belongs_to :colour
 
  delegate :name, :to => :item 
  
  self.class_name_rus = "товар"
  self.class_name_rus_cap = "Товар"    

  attr_accessor_with_default( :order_item_sum ) { price * amount }
  attr_accessor_with_default( :notice ) { "#{name} #{size.name} #{colour.name} (#{ price.to_i } #{RUB}) - #{amount} #{SHT}" }    

#  def order_item_sum; price * amount; end
    
#  def notice; "#{name} #{size.name} #{colour.name} (#{ price.to_i } #{RUB}) - #{amount} #{SHT}"; end    
  
end
