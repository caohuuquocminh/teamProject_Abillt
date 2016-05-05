Rails.application.routes.draw do
  devise_for :users
  resources :apps do
  	resources :reviews
  end

  resources :categories
  get 'store' => 'store#index'

  match 'store/:id' => 'store#show', :as => :store_product, :via => :get

  root "demo#hello"
end
