Rails.application.routes.draw do
  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#index'


  get 'profiles/show'

  get 'profiles/edit'


  resources :photos
  
  # resources :categories do 
  #   resources :subcategories 
  # end 

  resources :categories, path: 'rankdarbiai',  as: 'category', only: [:show] do
    resources :subcategories, path: '',  only: [:show] do
      resources :listings, path: '', as: 'listing' , only: [:show]
    end
  end





  resources :listings, only: [:new, :create, :edit, :update, :destroy]

  get 'pages/about'
  get 'pages/homepage'
  get 'pages/contact'

  get 'seller/:id/listings' => "listings#seller"




  #Listings
  # get '/rankdarbiai/:id', to: 'listings#show', as: 'listing'
  # get 'rankdarbiai/naujas', to: 'listings#new', as: 'listing'


  get 'profiles/:id', to: 'profiles#show', as: 'profile', path: 'narys/:id'
  # get 'profiles/:user', to: 'profiles#show', path: 'narys/:user', as: 'profile'

  devise_for :users, :controllers => { :registrations => "registrations", :sessions => 'sessions', omniauth_callbacks: 'omniauth_callbacks'}


  get 'pages/homepage'

  # resources :categories
  # resources :subcategories


  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end


  

  
  #301 REDIRECT


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
