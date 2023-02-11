Rails.application.routes.draw do
  get 'contact', to: 'static_pages#contact', as: 'contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "static_pages#home"
end
