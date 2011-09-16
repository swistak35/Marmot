Marmot::Application.routes.draw do
  
  namespace :blog do
    match "/rss(/:tag)" => "posts#rss", :as => :rss
    match "/tag(/:tag)" => "posts#index", :as => :tag_posts
    match "/comments" => "comments#index", :as => :comments
    resources :posts, :path => "" do
      resources :comments, :only => [:destroy, :create]
    end
  end
  
  namespace :calendar do
    resources :events, :path => "", :except => [:edit, :update]
  end
  
  namespace :files do
    match "/tag(/:tag)" => "parcels#index", :as => :tag_parcels
    match "/type/*type" => "parcels#type", :as => :type
    resources :parcels, :path => ""
  end
  
  namespace :panel do
    resources :tags, :only => [:index, :create, :destroy]
    resources :sessions, :only => [:new, :create, :destroy]
    #match "/", :to => "home#admin"
  end
  
  
  match "projects", :to => "home#projects", :as => :projects
  match "contact", :to => "home#contact", :as => :contact
  match "links", :to => "home#links", :as => :links
  
  root :to => "home#index"
end
