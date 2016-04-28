Rails.application.routes.draw do
  devise_for :users
  resources :apps do
  	resources :reviews
  end
  root 'apps#index'
	
end
