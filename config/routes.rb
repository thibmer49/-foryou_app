Rails.application.routes.draw do
  devise_for :users do
    resources :reviews, only: %i[new create destroy]
  end
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :reviews, only: %i[new create destroy]
  resources :offers, only: %i[index show new create destroy]
  resources :bookings, only: %i[new create update destroy]
end
