Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :todos # TODO: removing this breaks form helper
  root to: 'todos#index'
end
