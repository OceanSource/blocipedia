Rails.application.routes.draw do

  get 'charges/new'
  get 'charges/downgrade'
  
  resources :users, only: [:show, :index]
  
  resources :wikis
  resources :charges, only: [:new, :create]

  devise_for :users
  
  get 'about' => 'welcome#about'
  get 'wikis' => 'wikis#index'
  
  root 'welcome#index'

end
