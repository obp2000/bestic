# encoding: utf-8
class Size < ItemAttribute
  has_many :items_sizes, :dependent => :delete_all
  has_many :items, :through => :items_sizes
  
  has_many :cart_items
  has_many :order_items

  self.class_name_rus = "размер одежды"
  self.class_name_rus_cap = "Размер одежды"
  self.change_image = "pencil-ruler.png"
  self.index_text = "Размеры"  

end
