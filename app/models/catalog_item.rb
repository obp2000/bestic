# coding: utf-8
class CatalogItem < Item

  class_inheritable_accessor :season_icon, :season_name, :search_image, :search_title
  self.season_icon = "amor.png"
  self.season_name = "Все сезоны"
#  self.index_tag = "content"    
  self.index_partial = "catalog_items/index"
  self.index_text = "Назад в магазин"    
  self.fade_tag = "catalog_items"
  self.appear_tag = "details"    
  self.submit_with_options = [ "image_submit_tag", "search_32.png", { :title => "Поиск #{class_name_rus}а" } ]  

  PER_PAGE = 8
  SEARCH_PER_PAGE = 8  

  belongs_to :category

  set_inheritance_column nil     

  class << self

    def all_objects( params )
      catalog_items( params ).paginate( :page => params[:page], :per_page => PER_PAGE, :order => "items.id desc" )
    end

    def catalog_items( params ); all; end

    def search_results( params )
      search_params1 = lambda { [ self[ :q ], { :page => self[ :page ], :per_page => CatalogItem::SEARCH_PER_PAGE,
                :order => :id, :sort_mode => :desc } ] }
      @search_amount = ( results = search( *search_params1.bind( params )[] ) ).size
      @q = params[ :q ]
      results
    end

    def index_page_title; "Каталог #{class_name_rus}ов#{': ' + season_name}#{': ' + @category.name rescue ''}"; end

    def search_page_title
      if @search_amount > 0
        "Результаты поиска по запросу \"#{@q}\" ( всего найдено #{class_name_rus}ов: #{@search_amount} )"
      else
        "По Вашему запросу \"#{@q}\" #{class_name_rus}ы не найдены"
      end
    end

    def category( params ); @category = Category.find params[ :category_id ]; end
    
    def current_catalog_items; name.tableize.gsub!( "category_", "" ); end        

#    def search_render; { :template => "shared/index.rjs" }; end
    def search_render_block; lambda { render :template => "shared/index.rjs" }; end 
  
    def index_render_block
      lambda { render request.xhr? ? { :template => "shared/index.rjs" } : { :partial => "index", :layout => "application" } }
    end
    
    def link_to_index_local( page )
      page.link_to1 nil, index_text, plural_path, :method => :get
    end

    def index1( page, objects )
      super page, objects
      page.attach_js( "attach_js" )         
    end      
      
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
