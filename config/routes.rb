FoodBank::Application.routes.draw do

  resources :users
  resources :user_sessions

  resources :food_parcels do
    
  end

  resources :expenditures

  resources :food_donations do

  end

  resources :products

  resources :financial_donations

  resources :donors

  resources :addresses
  resources :referring_agencies
  
  resources :households do
    resources :other_occupants
  end
  
  match 'reporting/weight_total', :to => 'reporting#weight_total', :via => :get
  match 'reporting/update_weight', :to => 'reporting#update_weight', :via => :post
  match 'reporting/parcels_by_time_period', :to => 'reporting#parcels_by_time_period', :via => [:get, :post]
  match 'reporting/parcels_by_time_period_and_postcode', :to => 'reporting#parcels_by_time_period_and_postcode', :via => [:get, :post]  
  match 'reporting/households_with_multiple_parcels_by_time_period', :to => 'reporting#households_with_multiple_parcels_by_time_period', :via => [:get, :post]
  match 'reporting/food_donations_by_time_period', :to => 'reporting#food_donations_by_time_period', :via => [:get, :post]
  match 'reporting/food_donations_by_donor', :to => 'reporting#food_donations_by_donor', :via => [:get, :post]
    match 'reporting/inactive_households', :to => 'reporting#inactive_households', :via => [:get, :post]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'
  # root :to => 'users#index'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'  

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
end
