Starttwo::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
 
   get '/login', to: 'sessions#new', as: 'login'
  get '/oauth2callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'



get '/groups', to: 'groups#list'

get '/home', to: 'home#index'

get '/settings', to: 'home#settings'

  get '/groups/:id', to: 'groups#index'
  get '/users/:id', to: 'users#index'

  get '/newgroup', to: 'groups#create'

  match '/newgroup', to: 'groups#create', via: :post

 match '/acceptmessage', to: 'home#acceptmessage', via: :post
  match '/rejectmessage', to: 'home#rejectmessage', via: :post
  match '/createprivatemessage', to: 'users#createprivatemessage', via: :post
  match '/createpost', to: 'groups#createpost', via: :post
  match '/groups/joingroup', to: 'groups#joingroup', via: :post
  match '/groups/watchgroup', to: 'groups#watchgroup', via: :post


  get '/search/:query', to: 'home#search'

 

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
