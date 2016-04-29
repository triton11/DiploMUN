Rails.application.routes.draw do
  resources :amendments
  resources :resolutions
  get 'welcome/index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'
  get '/countries/trade/:id' => 'countries#trade'
  get '/countries/:id/invest' => 'countries#invest'
  post '/countries/trade/:id/submit' => 'countries#submit'
  post '/countries/:id/invest/enter' => 'countries#enter'
  get '/home/:id' => 'home#index'
  post '/resolutions/:id/countries' => 'resolutions#add_country'
  delete '/resolutions/:id/countries' => 'resolutions#delete_country'
  get '/resolutions/:id/new' => 'amendments#new'
  post '/home/next_round' => 'home#next_round'
  post '/home/calculate' => 'home#calculate'
  get '/countries/event' => 'countries#event'
  post '/countries/event' => 'countries#launch'
  resources :countries
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
