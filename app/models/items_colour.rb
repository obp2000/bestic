# encoding: cp1251
class ItemsColour < ActiveRecord1
  belongs_to :item
  belongs_to :colour
end
