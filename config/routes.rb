Rails.application.routes.draw do
  get 'photos/index'
  devise_for :users
  get 'home', to: 'home#index'

  get 'profile', to: 'profiles#index'
  get 'edit_profile' , to: 'profiles#edit'
  put 'update_info', to: 'profiles#update_info'
  put 'update_password', to: 'profiles#update_password'






  resource 'photos'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
