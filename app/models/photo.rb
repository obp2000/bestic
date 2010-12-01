# coding: utf-8
class Photo < ActiveRecord::Base
  belongs_to :item
  has_attachment :content_type => :image, :storage => :file_system, :resize_to => '768x512>',
              :thumbnails => { :small => '100x100>' }
#  validates_as_attachment
#  validates_presence_of :filename

  def validate
   
    errors.add_to_base "Не выбрана #{self.class.class_name_rus} для загрузки" if filename.blank?  

  end

  extend Shared 
  class << self

    def class_name_rus; "фотография"; end  

    def class_name_rus_cap; "Фотография"; end  
 
    def all_and_new( params )
      [ paginate( :conditions => { :parent_id => nil, :item_id => nil }, :order => "id desc",
                :page => params[:page], :per_page => 5), new ]
    end

    def delete_from_item_title; "Удалить фотографию из товара"; end

    def change_image; "insert-image.png"; end

    def change_title; "Изменить #{class_name_rus.pluralize}"; end

    def save_comments_title; "Сохранить комментарии"; end

    def upload_image; "load.png"; end

    def upload_title; "Загрузить фотографию"; end

    def attach_yoxview?; true; end
      
    def delete_from_item_image_with_title; [ delete_image, { :title => delete_from_item_title } ]; end
 
    def delete_from_item_js_string
      "$(this).siblings(':checkbox').attr('checked', '');$(this).siblings(':not(:checkbox)').remove();$(this).remove()"
    end
     
    def responds_to_parent; true; end
      
    def new_partial; "upload_photo"; end      
  
  end 

end
