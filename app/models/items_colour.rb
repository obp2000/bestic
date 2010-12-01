class ItemsColour < ActiveRecord::Base
  belongs_to :item
  belongs_to :colour
end
