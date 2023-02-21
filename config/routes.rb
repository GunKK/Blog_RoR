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
  get 'user/edit', to: 'users#edit'
  get 'user', to: 'users#show'
  post 'user/edit', to: 'users#update'
  resource :users, except: [:new, :edit, :update, :show]

  namespace :admin do
    get 'admin', to: 'admin#index'
    resources :articles, except: [:new, :create], concerns: :paginatable
    resources :users
  end
end
