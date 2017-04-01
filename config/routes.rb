Rails.application.routes.draw do
  shallow do
  	resources :users do
  		resources :photos
  		resources :feedbacks
  	end
  end

  ActiveAdmin.routes(self)
  # devise_for :views
  devise_for :users
  root  'photos#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
