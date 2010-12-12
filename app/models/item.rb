# coding: utf-8
class Item < ActiveRecord::Base
  has_many :items_sizes, :dependent => :delete_all
  has_many :sizes, :through => :items_sizes
  
  has_many :items_colours, :dependent => :delete_all
  has_many :colours, :through => :items_colours    
    
  belongs_to :category
  
  has_many :photos
  
  has_many :cart_items
  has_many :carts, :through => :cart_items

  set_inheritance_column nil  

  def validate
    errors.add_to_base "#{self.class.name_rus} #{self.class.class_name_rus}а не может быть пустым" if name.blank?  
    unless price_before_type_cast and price_before_type_cast[/^[1-9][\d]*$/]
      errors.add_to_base "#{self.class.price_rus} #{self.class.class_name_rus}а должна быть целым числом"  
    end
    errors.add_to_base "Необходимо выбрать #{Category.class_name_rus}" if category_id.blank?  
    errors.add_to_base "Необходимо выбрать сезон одежды" if type.blank?  
  end

  class << self
    def class_name_rus; "товар"; end

    def class_name_rus_cap; "Товар"; end   

    def item_objects( sort_by )
      if sort_by
        all.sort_by do |item|
          sort_attr = item.send sort_by
          if sort_attr.is_a?( String ) || sort_attr.is_a?( Float )
            sort_attr rescue ""
          elsif sort_attr.is_a?( Array )
            sort_attr.first.name rescue ""
          else
            sort_attr.name rescue ""            
          end
        end
      else
        all
      end
    end

    def all_objects( params ); item_objects( params[:sort_by] ).paginate( :page => params[:page], :per_page => 14 ); end

    def index_page_title; "Список #{class_name_rus}ов"; end

#    def not_xhr_index_render_block
#      lambda { render :partial => "index", :layout => "items" }
#    end      

    def index_render_block
      lambda do
        render request.xhr? ? { :template => "shared/index.rjs" } : { :partial => "index", :layout => "items" }
      end
    end

    def name_rus; "Название"; end     
   
    def price_rus; "Цена"; end  
   
    def submit_image; "document-save.png"; end
   
    def submit_title; "Сохранить изменения"; end
   
    def new_image; "newdoc.png"; end

    def new_title; "Добавить "; end
      
# for "shared/new_or_edit.rjs"
    def new_or_edit_partial; "form"; end
    def replace; :replace_html; end      
  
# for "shared/create_or_update.rjs"
    def create_or_update_partial; edit_partial; end
      
# for "shared/index.rjs"
    def index_partial; "index"; end
#    def index_tag; "items"; end
    include IndexBlock          
      
# for "shared/show.rjs"
    def fade_tag; "item_content";  end
    def appear_tag; "item_content"; end      
  
  end

  after_update :save_photos
  
  def colours_string; colours.map( &:name ).join(', '); end
   
  def new_photo_attributes=(photo_attributes)
    photo_attributes.each do |attributes|
      photos.build(attributes)
    end
  end
  
  def existing_photo_attributes=(photo_attributes)
    photos.reject(&:new_record?).each do |photo|
      attributes = photo_attributes[photo.id.to_s]
      if attributes
        photo.attributes = attributes
      else
        photos.delete(photo)
      end
    end
  end

  def save_photos
    photos.each do |photo|
      photo.save
    end
  end

  def update_object( params, session )
    modify_item = lambda { self[ :existing_photo_attributes ] ||= {}; self }
    update_attributes( modify_item.bind( params[ :item ] )[] )
  end
    
# for "shared/new_or_edit.rjs"
  def new_or_edit_tag; "item_content"; end    

# for "shared/create_or_update.rjs"
  def create_or_update_tag; tag; end

  def deleted_notice; "#{self.class.class_name_rus_cap} удалён из каталога!"; end      
   
end
