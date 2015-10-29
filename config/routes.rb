Rails.application.routes.draw do
  # Sessions Routes
  get '/sessions/user/new', to: 'sessions#new', as: "new_user_session"
  get '/sessions/:user_type/initiate', to: 'sessions#initiate'
  delete '/sessions/logout', to: 'sessions#destroy', as: 'destroy_session'
  %w(leader member).each do |user_type|
    get "/sessions/#{user_type}/initiate", as: "initiate_#{user_type}_session"
  end

  # OmniAuth
  get '/auth/:provider/callback', to: 'sessions#create'

  # Application Routes
  resources :leaders, only: [:destroy]
  resources :members, only: [:destroy]
  resources :clubs, only: [:index, :show] do
    post 'leader_join', on: :collection
  end
  resources :meetings, only: [:show]
  resources :feedback_responses, only: [:new, :create] do
    get 'received', on: :collection
  end

  root to: 'pages#root'
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
