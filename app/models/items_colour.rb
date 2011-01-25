# encoding: utf-8
class ItemsColour < ActiveRecord1
  belongs_to :item
  belongs_to :colour
end
