# coding: utf-8
class OrderItem < ActiveRecord::Base
  belongs_to :order 
  belongs_to :item
  belongs_to :size
  belongs_to :colour
 
  def validate 
#    errors.add(:amount, "должно быть один или больше") unless amount.nil? || amount > 0 
#    errors.add(:price, "должна быть положительным числом") unless price.nil? || price > 0 
  end

  class << self

    def deleted_item_notice; "#{class_name_rus_cap} удалён из каталога!"; end  

    def class_name_rus; "товар"; end

    def class_name_rus_cap; "Товар"; end  
    
  end
  
  def name; item.name; end

  def order_item_sum; price * amount; end
    
  def notice; "#{name} #{size.name} #{colour.name} (#{ price.to_i } #{RUB}) - #{amount} #{SHT}"; end    
  
end
