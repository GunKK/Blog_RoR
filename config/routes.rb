Rails.application.routes.draw do
  root to: "static_pages#home"
  get 'contact', to: 'static_pages#contact', as: 'contact'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :articles, concerns: :paginatable

  get 'sign_up', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'users/:id/friend', to: 'users#friend', as: 'friend'
  resources :users, except: [:new ]

  post 'friend/create/:friend_id', to: 'friendships#create', as: 'friendships'
  delete 'friend/destroy/:friend_id', to: 'friendships#destroy', as: 'removefriend'

  namespace :admin do
    get 'admin', to: 'admin#index'
    resources :articles, except: [:new, :create], concerns: :paginatable
    resources :users
    resources :categories, except: [:show], concerns: :paginatable
  end
end
