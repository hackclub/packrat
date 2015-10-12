Rails.application.routes.draw do
  devise_for :club_members

  devise_scope :club_member do
    get 'club_members/sign_in', to: 'devise/sessions#new',
      as: :new_club_member_session
    delete 'club_members/sign_out', to: 'devise/sessions#destroy',
      as: :destroy_club_member_session
  end

  devise_for :club_leaders

  # Sessions Routes
  get '/sessions/:user_type/new', to: 'sessions#new'
  get '/sessions/:user_type/initiate', to: 'sessions#initiate'
  %w(leader member).each do |user_type|
    get "/sessions/#{user_type}/new", as: "new_#{user_type}_session"
    get "/sessions/#{user_type}/initiate", as: "initiate_#{user_type}_session"
  end

  # OmniAuth Routes
  get '/auth/:provider/callback', to: 'sessions#create'

  # Application Routes
  get '/dashboard' => 'feedback_responses#index'
  get '/dashboard/:id' => 'feedback_responses#show'
  post '/feedback_responses' => 'feedback_responses#create'
  get '/feedback_received' => 'feedback_responses#received'

  resources :clubs
  resources :meetings, only: [:show]
  resources :feedback_responses, only: [:new, :create]

  authenticated :club_leader do
    root to: 'clubs#index', as: :authenticate_club_leader
  end

  root to: 'feedback_responses#new'
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
