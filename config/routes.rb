Entv::Application.routes.draw do
  root "static#index"
  resources :products
  get "about" => "static#about", as: :about
  get "contact" => "static#contact", as: :contact

  devise_for :users
  devise_scope :user do
    get "sign_in" => "devise/sessions#new", as: :sign_in
    get "sign_out" => "devise/sessions#destroy", as: :sign_out
    get "sign_up" => "devise/registrations#new", as: :sign_up
    get "profile" => "devise/registrations#edit", as: :profile
    get "reset_password" => "devise/passwords#new", as: :reset_password
  end

  namespace :admin do
    root "products#index"
    resources :categories, except: [:show, :destroy]
    resources :products
    resources :imports, except: [:edit, :update, :destroy]
  end
end
