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
  self.submit_image = "document-save.png"
  self.submit_title = "Сохранить изменения"
#  self.index_tag = "content"    
  self.index_partial = "index"
#  self.new_or_edit_partial = "form"
#  self.create_or_update_partial = edit_partial
  self.replace = :replace_html
  self.fade_tag = "item_content"
  self.appear_tag = "item_content"
  self.new_image = "newdoc.png"
  self.name_rus = "Название"    


  def validate
    errors.add_to_base "#{self.class.name_rus} #{self.class.class_name_rus}а не может быть пустым" if name.blank?  
    unless price_before_type_cast and price_before_type_cast[/^[1-9][\d]*$/]
      errors.add_to_base "#{self.class.price_rus} #{self.class.class_name_rus}а должна быть целым числом"  
    end
    errors.add_to_base "Необходимо выбрать #{Category.class_name_rus}" if category_id.blank?  
    errors.add_to_base "Необходимо выбрать сезон одежды" if type.blank?  
  end

  class << self

    def item_objects( params )
        all.sort_by { |item| item.send( params[:sort_by] ).sort_attr } rescue all
    end

    def all_objects( params ); item_objects( params ).paginate( :page => params[:page], :per_page => 14 ); end

    def index_page_title; "Список #{class_name_rus}ов"; end

    def index_render_block
      lambda { render request.xhr? ? { :template => "shared/index.rjs" } : { :partial => "index", :layout => "items" } }
    end

   
   
    def price_rus; "Цена"; end  
   
    def submit_image; "document-save.png"; end  
      


    def new_title; "Добавить "; end

    include Index1          
      
# for "shared/show.rjs"


      
    def new_or_edit_partial; "form"; end      

    def create_or_update_partial; edit_partial; end  
  
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

  def size_ids=(ids_array)
    Size.update_attr( self, ids_array )    
  end

  def colour_ids=(ids_array)
    Colour.update_attr( self, ids_array )    
  end

#  def update_attr( class_const, ids_array )
#    send( class_const.name.tableize ).clear
#    ids_array.each do |id1|
#      send( class_const.name.tableize ) << class_const.find( id1 ) rescue nil
#    end    
#  end

  def save_photos
    photos.each do |photo|
      photo.save
    end
  end

  def update_object( params, session )
#    modify_item = lambda do
#      self[ :existing_photo_attributes ] ||= {}; self
#    end
    params[ :item ][ :existing_photo_attributes ] ||= {}
    update_attributes( params[ :item ] )
  end
    
# for "shared/new_or_edit.rjs"
  def new_or_edit_tag; "item_content"; end    

# for "shared/create_or_update.rjs"
  def create_or_update_tag; tag; end

  def deleted_notice; "#{self.class.class_name_rus_cap} удалён из каталога!"; end      
   
end
