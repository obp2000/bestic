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
              :page => params[ :page ], :per_page => 5)
    end

    def change_image; "insert-image.png"; end

    def change_title; "Изменить #{class_name_rus.pluralize}"; end

    def submit_title; "Сохранить"; end

    def upload_image; "load.png"; end

    def upload_title; "Загрузить фотографию"; end

#    def attach_yoxview?; true; end
 
    def new_partial; "upload_photo"; end

    def create_render_block
      lambda { responds_to_parent { render :template => "shared/create_or_update.rjs" } }
    end
  
  end 

#  include Action1

  def insert_attr
    "photo"    
  end

  def add_to_item1( page )
    super page
    page.attach_js( "attach_yoxview" )    
  end 

  def create_or_update1( page, session )
    super page, session
    page.attach_js( "attach_yoxview" )    
  end   

  def link_to_show_photo( page, comment = "" )
    page.link_to page.image_tag( public_filename :small ) + comment, public_filename
  end

  def link_to_show_photo_with_comment( page )
    link_to_show_photo( page, comment )    
  end

end
