Rails.application.routes.draw do
  devise_for :users
	root 'events#index'
  resources :events do
  	resources :attendances
  	resources :event_pics, only: [:create]
  end
  resources :users, only: [:show, :edit, :update] do
  	resources :user_pics, only: [:create]
  end
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
