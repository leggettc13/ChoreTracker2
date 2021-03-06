Rails.application.routes.draw do
  
  resources :approval
  
  get 'rewards/store'

  get 'rewards_controller/store'

  resources :rewards do
    member do
      get :purchase
    end
    collection do
      :store
    end
  end

  resources :chores
  
  get 'notifications', to: 'notifications#index', as: 'notifications'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  
  get 'default/index'
  get 'application/index'
  get 'default/child_door'
  get 'default/account_door'
  get 'default/change'

  post '/default/do_child'
  post '/default/do_change'
  post '/default/do_account'
   
  get '/chores/:id/complete', to: 'chores#complete'
  get '/chores/:id/pending', to: 'chores#pending'
  get '/chores/:id/deny', to: 'chores#deny'
  get '/chores/:id/associateChild', to: 'chores#associateChild'
   
  get '/rewards/:id/redeem', to: 'rewards#redeem'
  get '/rewards/:id/pending', to: 'rewards#pending'
  get '/rewards/:id/approve', to: 'rewards#approve'
  get '/rewards/:id/deny', to: 'rewards#deny'
  
  root 'default#index'
  
  
  #builds all routes for parents via Devise
  devise_for :parents
  
  

  #builds all routes for children
  resources :children do
    member do
      get :delete
    end
  end
  
  get '/sublogin/', to: 'sublogin#login'
  get '/sublogin/who', to: 'sublogin#reportLoggedIn'
  get '/sublogin/logout', to: 'sublogin#logout'
  post '/sublogin/', to: 'sublogin#sublogin'
  get '/sublogin/pin/', to: 'sublogin#changePin'
  post '/sublogin/pin', to: 'sublogin#chgPin' #Controller function
  get 'sublogin/resetpin/', to: 'sublogin#resetPin'
  post 'sublogin/resetpin/', to: 'sublogin#rstPin' #Controller function
  
  
  # You can have the root of your site routed with "root"

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
