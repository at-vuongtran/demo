Rails.application.routes.draw do
  resources :users
  root "static_pages#home"
  get  "/help", to: "static_pages#help", as: 'helf'
  get  "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
