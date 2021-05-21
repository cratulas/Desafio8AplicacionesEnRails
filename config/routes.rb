Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/index'
  get 'pages', to: 'pages#new', as: 'pages_new'
  post 'pages', to: "pages#create"
  get 'pages/dashboard', as: 'pages_dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
