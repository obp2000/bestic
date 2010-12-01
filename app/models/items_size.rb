class ItemsSize < ActiveRecord::Base
  belongs_to :item
  belongs_to :size
end
