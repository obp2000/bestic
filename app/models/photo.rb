# coding: utf-8
class Photo < ItemAttribute
  belongs_to :item
  has_attachment :content_type => :image, :storage => :file_system, :resize_to => '768x512>',
              :thumbnails => { :small => '100x100>' }
#  validates_as_attachment
#  validates_presence_of :filename

  def validate
    errors.add_to_base "Не выбрана #{self.class.class_name_rus} для загрузки" if filename.blank?  
  end

#  extend Shared 
  class << self

    def class_name_rus; "фотография"; end  

    def class_name_rus_cap; "Фотография"; end  
 
    def all_objects( params )
      paginate( :conditions => { :parent_id => nil, :item_id => nil }, :order => "id desc",
              :page => params[:page], :per_page => 5)
    end

    def delete_from_item_title; "Удалить фотографию из товара"; end

    def change_image; "insert-image.png"; end

    def change_title; "Изменить #{class_name_rus.pluralize}"; end

    def submit_title; "Сохранить"; end

    def upload_image; "load.png"; end

    def upload_title; "Загрузить фотографию"; end

    def attach_yoxview?; true; end
      
#    def delete_from_item_image_with_title; [ delete_image, { :title => delete_from_item_title } ]; end
 
    def link_to_remove_from_item_block
      lambda { |page| page.link_to_function page.image_tag( delete_image, { :title => delete_from_item_title } ),
              delete_from_item_js_string  }
    end
 
    def delete_from_item_js_string
      "$(this).siblings(':checkbox').attr('checked', '');$(this).siblings(':not(:checkbox)').remove();$(this).remove()"
    end

    def new_partial; "upload_photo"; end

    def create_render_block
      lambda { responds_to_parent { render :template => "shared/create_or_update.rjs" } }
    end
  
  end 

  def insert_attr
    "photo"    
  end

  def after_add_to_item_block
      lambda do |page|
        page.delay( DURATION ) do
          page.call( "attach_yoxview" )
        end
      end    
  end 

  def after_create_or_update_block
    lambda do |page, session|
      page.call( "attach_yoxview" )
    end
  end   

  def link_to_show_photo_block
    lambda do |page, show_comment|
      page.link_to page.image_tag( public_filename( :small ) ) + ( show_comment ? comment || "" : "" ), public_filename
    end
  end

end
