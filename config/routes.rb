Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'contact', to: 'static_pages#contact'
  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  get 'signup', to: 'users#new'
  get 'signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  
end
