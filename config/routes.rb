Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'pages/home', to: 'pages#home'
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # alternative version : post 'users', to: 'users#create'

  resources :articles
end
