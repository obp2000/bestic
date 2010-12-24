# coding: utf-8
class Colour < ItemAttribute
  has_many :items_colours, :dependent => :delete_all
  has_many :items, :through => :items_colours
  has_many :cart_items
  has_many :order_items

  self.class_name_rus = "цвет"   
  self.class_name_rus_cap = "Цвет"
  self.change_image = "kcoloredit.png"
  self.index_text = "Цвета"  

  class_inheritable_accessor :add_html_code_to_colour_image, :add_html_code_to_colour_title,
    :add_html_code_to_colour_js_string
    
  self.add_html_code_to_colour_image = "arrow-180.png"
  self.add_html_code_to_colour_title = "Добавить в #{class_name_rus}"
  self.add_html_code_to_colour_js_string = "$(this).prev('input').val( $(this).prev('input').val() + ' ' + $(this).next('input').val() )"  
  
  def validate
    super
    errors.add_to_base "Код #{self.class.class_name_rus}а не может быть пустым" if html_code.blank?  
    errors.add_to_base "#{self.class.class_name_rus_cap} с такими кодами уже есть" if new_record? &&
                  ( self.class.find :all, :conditions => { :html_code => html_code } ).first        
  end

  class << self

    def all_objects( params ); paginate( :order => "name", :page => params[:page], :per_page => 10 ); end
      

      
    def index1( page, objects )
      super page, objects
      page.attach_js( "attach_mColorPicker" )          
    end   
     
    def link_to_add_html_code( page )
      page.link_to_function2 add_html_code_to_colour_image, add_html_code_to_colour_title, add_html_code_to_colour_js_string
    end

    def sort_attr; "name"; end     
     
  end

  def new_or_edit1( page )
    super page
    page.attach_js( "attach_mColorPicker" )
  end

  def create_or_update1( page, session )
    super page, session
    page.attach_js( "attach_mColorPicker" )
  end
    
end
