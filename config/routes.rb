Rails.application.routes.draw do

  resources :ratings

  get 'acp/index', as: 'acp'
  get 'acp/trips', as: 'acp_trips'
  get 'acp/users', as: 'acp_users'
  get 'acp/edit_user', as: 'user'
  patch 'acp/edit_user' => 'acp#update_user'
  delete 'acp/edit_user' => 'acp#delete_user' 


  get 'trips/categorie' => 'trips#tagged_index' , as: 'tag_index'
  get 'trips/categorie/:id' => 'trips#tagged', as: 'tagged'

  resources :trips

  devise_for :users


  root to: 'trips#index'

 # get 'trips/:id' => 'trips#show', as: 'rating'

  # nochmal abändern
  #patch 'trips/:id' => 'trips#show'
  
 
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
