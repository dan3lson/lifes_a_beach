Rails.application.routes.draw do
  root 'beaches#index'

  devise_for :users

  resources :beaches
  resources :amenities
end
