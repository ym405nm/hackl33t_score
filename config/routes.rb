Rails.application.routes.draw do
  resources :challenges
  resources :questions
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
