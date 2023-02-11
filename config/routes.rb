Rails.application.routes.draw do
  root to: "static_pages#home"
  get 'contact', to: 'static_pages#contact', as: 'contact'

  resources :articles, only: [:create, :destroy, :index, :new, :show]
end
