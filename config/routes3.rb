Petshop::Application.routes.draw do
  resources :colours
  resources :contacts
  resources :photos
  resources :sizes
  resources :items
  resources :cart_items
  resources :users
  resource :session do
    collection do
  any :forgot_password
  end
  
  
  end

  match '/signup' => 'users#new', :as => :signup
  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout
  resources :categories do
  
  
      resources :catalog_items
    resources :summer_catalog_items
    resources :winter_catalog_items
  end

  resources :catalog_items do
    collection do
  get :search
  end
  
  
  end

  resources :summer_catalog_items do
    collection do
  get :search
  end
  
  
  end

  resources :winter_catalog_items do
    collection do
  get :search
  end
  
  
  end

  resource :cart
  resources :orders
  resources :processed_orders do
  
    member do
  get :close
  end
  
  end

  resources :closed_orders
  resources :forum_posts do
  
    member do
  any :reply
  end
  
  end

  match '/' => 'catalog_items#index'
  match '/:controller(/:action(/:id))'
end
