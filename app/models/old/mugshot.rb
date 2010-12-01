class Mugshot < ActiveRecord::Base
  has_attachment :content_type => :image, :storage => :file_system, :resize_to => '768x512>',
                          :thumbnails => { :small => '100x100>' }
  #validates_as_attachment

end
