WorldCupPoll::Application.routes.draw do
  resources :polls

  resources :users
  resources :sessions

  get '/login_google', to: 'sessions#new_google', as: 'login_google'
  get '/oauth2callback', to: 'sessions#create_google'
  
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/login', to: 'sessions#new', as:'login'

  root 'polls#index'
  get '/poll_list', to: 'polls#poll_list', as: 'poll_list'

  get '/rules', to: 'polls#pdf', as: 'pdf'

  get '/admin_page', to: 'admins#admin_page', as: 'admin_page'
  post '/add_score', to: 'admins#add_score', as: 'add_score'

  get '/admin_page_subtract', to: 'admins#admin_page_subtract', as: 'admin_page_subtract'
  post '/subtract_score', to: 'admins#subtract_score', as: 'subtract_score'

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
