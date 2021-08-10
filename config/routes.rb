Rails.application.routes.draw do
  devise_for :users
  get 'home', to: 'home#index'

  get 'profile', to: 'profiles#index'

  get 'photo' , to: 'profiles#photo'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
