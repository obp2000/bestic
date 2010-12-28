# coding: utf-8
class Item < ActiveRecord1
  has_many :items_sizes, :dependent => :delete_all
  has_many :sizes, :through => :items_sizes
  
  has_many :items_colours, :dependent => :delete_all
  has_many :colours, :through => :items_colours    
    
  belongs_to :category
  
  has_many :photos
  
  has_many :cart_items
  has_many :carts, :through => :cart_items

  set_inheritance_column nil  

  self.class_name_rus = "товар"
  self.class_name_rus_cap = "Товар"
#  self.submit_image = [ "document-save.png", { :title => "Сохранить изменения" } ]
#  self.submit_title = "Сохранить изменения"
  self.submit_with_options = [ "image_submit_tag", "document-save.png", { :title => "Сохранить изменения" } ]     
#  self.index_tag = "content"    
  self.index_partial = "index"
  self.replace = :replace_html
  self.fade_tag = "item_content"
  self.appear_tag = "item_content"
  self.new_image = "newdoc.png"
  self.name_rus = "Название"
  self.index_render_block = lambda { render request.xhr? ? Index_template_hash : { :partial => "index", :layout => "items" } }

  class_inheritable_accessor :price_rus, :new_or_edit_partial
  self.price_rus = "Цена"   
  self.new_title = "Добавить "
  self.new_or_edit_partial = "form"
#  self.index_page_title = "Список #{class_name_rus}ов"

  def validate
    errors.add_to_base "#{self.class.name_rus} #{self.class.class_name_rus}а не может быть пустым" if name.blank?  
    unless price_before_type_cast and price_before_type_cast[/^[1-9][\d]*$/]
      errors.add_to_base "#{self.class.price_rus} #{self.class.class_name_rus}а должна быть целым числом"  
    end
    errors.add_to_base "Необходимо выбрать #{Category.class_name_rus}" if category_id.blank?  
    errors.add_to_base "Необходимо выбрать сезон одежды" if type.blank?  
  end

  class << self

    def item_objects( params ); all.sort_by { |item| item.send( params[:sort_by] ).sort_attr } rescue all; end

    def all_objects( params ); item_objects( params ).paginate( :page => params[:page], :per_page => 14 ); end

    def index_page_title( * ); "Список #{class_name_rus}ов"; end

    def create_or_update_partial; edit_partial; end  

    include Index1          
  
  end

  after_update :save_photos
   
#  def new_photo_attributes=(photo_attributes)
#    photo_attributes.each do |attributes|
#      photos.build(attributes)
#    end
#  end
  
  def existing_photo_attributes=(photo_attributes)
    photos.reject( &:new_record? ).each do |photo|
      attributes = photo_attributes[ photo.id.to_s ]
      if attributes
        photo.attributes = attributes
      else
        photos.delete( photo )
      end
    end
  end

  def size_ids=(ids_array); Size.update_attr( self, ids_array ); end

  def colour_ids=(ids_array); Colour.update_attr( self, ids_array ); end

  def save_photos
    photos.each { |photo| photo.save }
  end

  def update_object( params, session, flash )
    params[ :item ][ :existing_photo_attributes ] ||= {}
#    update_attributes( params[ :item ] )
    super
  end
    
# for "shared/new_or_edit.rjs"
  def new_or_edit_tag; "item_content"; end    

# for "shared/create_or_update.rjs"
  def create_or_update_tag; tag; end

  def deleted_notice; "#{self.class.class_name_rus_cap} удалён из каталога!"; end      
   
end
