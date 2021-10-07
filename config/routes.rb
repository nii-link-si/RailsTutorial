Rails.application.routes.draw do
  get 'rents/index'
  resources :books do
    member do
      get 'rental'
    end
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
