Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bags do
    resources :rentals, only: [ :new, :create]
  end
  resources :rentals, only: [ :show, :destroy,  :edit, :update, :index ] do
    resources :reviews, only: [ :new, :create ]

    member do
      get :accept
    end
  end
end

