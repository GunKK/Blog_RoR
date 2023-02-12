Rails.application.routes.draw do
  root to: "static_pages#home"
  get 'contact', to: 'static_pages#contact', as: 'contact'

  resources :articles

  get 'sign_up', to: 'users#new'
  
  resource :users, except: [:new]
end
