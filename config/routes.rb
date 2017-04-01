Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :views
  devise_for :users, only: [:new, :create, :destroy] 
  root  'photos#index'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
