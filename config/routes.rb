Rails.application.routes.draw do
  resources :challenges
  post 'questions/result', to: 'questions#result'
  resources :questions
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
