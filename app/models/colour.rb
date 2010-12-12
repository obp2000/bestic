# coding: utf-8
class Colour < ItemAttribute
  has_many :items_colours, :dependent => :delete_all
  has_many :items, :through => :items_colours
  
  has_many :cart_items
  has_many :order_items
  
#  validates_presence_of :name
#  validates_uniqueness_of :name
  
  def validate
    super
    errors.add_to_base "Код #{self.class.class_name_rus}а не может быть пустым" if html_code.blank?  
#    errors.add_to_base "Название #{self.class.class_name_rus}а не может быть пустым" if name.blank?  
#    errors.add_to_base "Такое название #{self.class.class_name_rus}а уже есть" if new_record? &&
#                  ( self.class.find :all, :conditions => { :name => name } ).first     
    errors.add_to_base "#{self.class.class_name_rus_cap} с такими кодами уже есть" if new_record? &&
                  ( self.class.find :all, :conditions => { :html_code => html_code } ).first        
  end

#  extend Shared 
  class << self
    def class_name_rus; "цвет"; end   

    def class_name_rus_cap; "Цвет"; end    

    def all_objects( params ); paginate( :order => "name", :page => params[:page], :per_page => 10 ); end

    def add_html_code_to_colour_image; "arrow-180.png"; end
  
    def add_html_code_to_colour_title; "Добавить в #{class_name_rus}"; end

    def change_image; "kcoloredit.png"; end
      
#    def add_html_code_to_colour_image_with_title; [ add_html_code_to_colour_image, { :title => add_html_code_to_colour_title } ]; end

    def add_html_code_to_colour_js_string; "$(this).prev('input').val( $(this).prev('input').val() + ' ' + $(this).next('input').val() )"; end
      
    def index_text; "Цвета"; end
      
    def after_index_block
      lambda do |page|
        page.delay( DURATION ) do
          page.call( "attach_mColorPicker" )
        end
      end
    end   
     
    def link_to_add_html_code_block
      lambda { |page| page.link_to_function page.image_tag( add_html_code_to_colour_image,
              :title => add_html_code_to_colour_title ), add_html_code_to_colour_js_string  }
    end
     
     
  end

  def after_new_or_edit_block
    lambda do |page|
      page.call( "attach_mColorPicker" )
    end
  end

  def js_after_create_or_update
    "attach_mColorPicker"
  end
    
end
