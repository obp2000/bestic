# coding: utf-8
class Colour < ActiveRecord::Base
  has_many :items_colours, :dependent => :delete_all
  has_many :items, :through => :items_colours
  
  has_many :cart_items
  has_many :order_items
  
#  validates_presence_of :name
#  validates_uniqueness_of :name
  
  def validate

    errors.add_to_base "Код #{self.class.class_name_rus}а не может быть пустым" if html_code.blank?  
  
    errors.add_to_base "Название #{self.class.class_name_rus}а не может быть пустым" if name.blank?  
   
    errors.add_to_base "Такое название #{self.class.class_name_rus}а уже есть" if new_record? &&
                  ( self.class.find :all, :conditions => { :name => name } ).first     
          
    errors.add_to_base "#{self.class.class_name_rus_cap} с такими кодами уже есть" if new_record? &&
                  ( self.class.find :all, :conditions => { :html_code => html_code } ).first        
    
  end

  extend Shared 
  class << self
    def class_name_rus; "цвет"; end   

    def class_name_rus_cap; "Цвет"; end    

    def all_and_new( params ); [ paginate( :order => "name", :page => params[:page], :per_page => 10 ), new ]; end

    def add_html_code_to_colour_image; "arrow-180.png"; end
  
    def add_html_code_to_colour_title; "Добавить в #{class_name_rus}"; end

    def change_image; "kcoloredit.png"; end
      
    def add_html_code_to_colour_image_with_title; [ add_html_code_to_colour_image, { :title => add_html_code_to_colour_title } ]; end

    def add_html_code_to_colour_js_string; "$(this).prev('input').val( $(this).prev('input').val() + ' ' + $(this).next('input').val() )"; end
      
    def after_create_or_update_block
      lambda do |page, object, session|
          opts = lambda { [ self.class.new_tag, { :object => self.class.new, :partial => self.class.create_or_update_partial } ] }
          page.replace *opts.bind( object )[]                       
          page.replace object.tag, :partial => "items/" + object.class.new_or_edit_partial, :object => object          
          page.call( "attach_mColorPicker" )
      end
    end      

    def after_new_or_edit_block
      lambda do |page, object|
          page.call( "attach_mColorPicker" )
      end
    end      
      
    def index_text; "Цвета"; end       
      
  end
    
end
