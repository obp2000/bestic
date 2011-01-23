# encoding: cp1251
class CatalogItem < Item

  class_inheritable_accessor :season_icon, :season_name
  self.season_icon = "amor.png"
  self.season_name = "Все сезоны"
  self.index_partial = "catalog_items/index"
  self.index_text = "Назад в магазин"    
  self.fade_tag = "catalog_items"
  self.appear_tag = "details"    
  self.submit_with_options = [ "image_submit_tag", "search_32.png", { :title => "Поиск #{class_name_rus}а" } ]
  self.index_render_block = lambda { render request.xhr? ? Index_template_hash : { :partial => "index", :layout => "application" } }
  self.paginate_options = { :per_page => 8, :order => "items.id desc" }

#  PER_PAGE = 8
  SEARCH_PER_PAGE = 8  

  belongs_to :category

  set_inheritance_column nil     

  class << self

    def all_objects( params, * ); catalog_items( params ).paginate paginate_hash( params ) end

    define_method( :catalog_items ) { |*| all }

    def search_results( params, flash )
      ( results1 = search( *params.search_args ) ).tap { |results| not_found_notice( params, flash ) if results.size.zero? }              
      results1
    end

    def not_found_notice( params, flash )
      flash.now[ :notice ] = "По Вашему запросу \"#{params[ :q ]}\" #{class_name_rus}ы не найдены"         
    end

    def index_page_title_for( params )
      if params[ :q ]
        "Результаты поиска по запросу \"#{params[ :q ]}\" ( всего найдено #{class_name_rus}ов: #{search( *params.search_args ).size} )"
      else
        "Каталог #{class_name_rus}ов#{': ' + season_name}#{': ' + Category.find( params[ :category_id ] ).name rescue ''}"      
      end
    end
    
    def current_catalog_items; name.tableize.gsub!( "category_", "" ) end        
    
    def link_to_index_local( page ); page.link_to1 [], index_text, plural_path, :method => :get end

    def render_index( page, objects ); super; page.attach_js( "attach_js" ) end      
      
  end

  define_index do
    indexes name
    indexes blurb
    indexes colours.name, :as => :colours_name
    indexes sizes.name, :as => :sizes_name
    indexes category.name, :as => :category_name
    indexes photos.comment, :as => :photos_comment
    has :id
  end
  
end

class Hash
  
  def search_args
    [ self[ :q ], { :page => self[ :page ], :per_page => CatalogItem::SEARCH_PER_PAGE, :order => :id, :sort_mode => :desc } ]
  end
  
end

