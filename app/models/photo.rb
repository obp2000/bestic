# coding: utf-8
class Photo < ItemAttribute
  belongs_to :item
  has_attachment :content_type => :image, :storage => :file_system, :resize_to => '768x512>',
              :thumbnails => { :small => '100x100>' }
#  validates_as_attachment
#  validates_presence_of :filename

  self.class_name_rus = "фотография"  
  self.class_name_rus_cap = "Фотография"
  self.change_image = "insert-image.png"
  self.delete_from_item_js_string =
    "$(this).siblings(':checkbox').removeAttr('checked');$(this).siblings(':not(:checkbox)').remove();$(this).remove();"  
  self.insert_attr = "photo"
  self.create_render_block = lambda { responds_to_parent { render Create_or_update_template_hash } }
  self.paginate_options = { :conditions => { :parent_id => nil, :item_id => nil }, :order => "id desc", :per_page => 5  }

  class_inheritable_accessor :new_partial
#  self.upload_image = "load.png"
#  self.upload_title = "Загрузить фотографию"
  self.new_partial = "upload_photo"  

  def validate
    errors.add_to_base "Не выбрана #{self.class.class_name_rus} для загрузки" if filename.blank?  
  end
 
  def self.all_objects( params, * ); paginate_objects( params ); end

  def add_to_item1( page ); super page; page.attach_js( "attach_yoxview" ); end 

  def create_or_update1( page, session ); super page, session; page.attach_js( "attach_yoxview" ); end   

  def link_to_show( page, comment = "" ); page.link_to1 [ public_filename :small ], comment, public_filename; end

  def link_to_show_with_comment( page ); link_to_show( page, comment ); end

end
