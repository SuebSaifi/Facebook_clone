Rails.application.routes.draw do
  devise_for :users,:controllers=>{registrations:"registrations"}
  resources :faceposts do
  # resources :likes
  put "/create", to: "likes#create"
  resources :comments
  end
  root "faceposts#index"
  resources :friendships
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
