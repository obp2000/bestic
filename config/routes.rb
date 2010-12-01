ActionController::Routing::Routes.draw do |map|

  map.resources :colours, :contacts, :photos, :sizes, :items, :cart_items, :users
  
  map.resource :session, :collection => { :forgot_password => :any }
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

#  map.resources :seasons, :has_many => [ :catalog_items ], :controller => :season_catalog_items
#  map.resources :seasons do |season|
#   season.resources :catalog_items, :controller => :season_catalog_items
# end
 
#  map.resources :categories, :has_many => [ :catalog_items, :summer_catalog_items, :winter_catalog_items ]
  map.resources :categories do |category|
    category.resources :catalog_items, :controller => :category_catalog_items
    category.resources :summer_catalog_items, :controller => :category_summer_catalog_items
    category.resources :winter_catalog_items, :controller => :category_winter_catalog_items    
  end
#  map.resources :categories, :has_many => [ :summer_catalog_items ]
#  map.resources :categories, :has_many => [ :winter_catalog_items ]
  
#  map.resources :categories do |category|
#    category.resources :seasons do |season|
#      season.resources :catalog_items, :controller => :category_season_catalog_items
#    end
#  end
  
  map.resources :catalog_items, :collection => { :search => :get }
  map.resources :summer_catalog_items, :collection => { :search => :get }
  map.resources :winter_catalog_items, :collection => { :search => :get }  
  
  map.resource :cart
  
  map.resources :orders
  map.resources :processed_orders, :member => { :close => :get }
  map.resources :closed_orders  
  
  map.resources :forum_posts, :member => { :reply => :any }
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  
  map.root :controller => "catalog_items"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end


