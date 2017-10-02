Rails.application.routes.draw do
  
   resources :batches do
    post :reduce_quantity, on: :collection
  end
  
   resources :products do
    post :get_barcode, on: :collection
    
  
  end
  
# rake routes
#               Prefix Verb   URI Pattern                     Controller#Action
# get_barcode_products POST   /products/get_barcode(.:format) products#get_barcode
#             products GET    /products(.:format)             products#index
#                      POST   /products(.:format)             products#create
#          new_product GET    /products/new(.:format)         products#new
#         edit_product GET    /products/:id/edit(.:format)    products#edit
#              product GET    /products/:id(.:format)         products#show
#                      PATCH  /products/:id(.:format)         products#update
#                      PUT    /products/:id(.:format)         products#update
#                      DELETE /products/:id(.:format)         products#destroy
#                 root GET    /                               visitors#index
  
 
  

#               Prefix Verb   URI Pattern                     Controller#Action
#               batches GET   /products(.:format)             batches#index
#                      POST   /products(.:format)             batches#create
#          new_batch GET      /products/new(.:format)         batches#new
#         edit_batch GET      /products/:id/edit(.:format)    batches#edit
#              batch GET      /products/:id(.:format)         batches#show
#                      PATCH  /products/:id(.:format)         batches#update
#                      PUT    /products/:id(.:format)         batches#update
#                      DELETE /products/:id(.:format)         batches#destroy
    
  resources :sales
  
#           sales_new GET       /sales/new(.:format)               sales#new
#           sales_create GET    /sales/create(.:format)         sales#create
#           sales_update GET    /sales/update(.:format)         sales#update
#           sales_edit GET      /sales/edit(.:format)             sales#edit
#           sales_destroy GET   /sales/destroy(.:format)       sales#destroy
#           sales_index GET     /sales/index(.:format)           sales#index
#           sales_show GET      /sales/show(.:format)             sales#show
  
  root 'static_pages#scan'
  
  get 'static_pages/scan'
  
  get '/products', to:'static_pages#products'
  get '/batches', to:'static_pages#batches'
  get '/form', to:'static_pages#form'
  get '/checkout', to:'batches#checkout'

 
  
  

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
