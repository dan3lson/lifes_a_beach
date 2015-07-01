Rails.application.routes.draw do
  devise_for :users
  root 'beaches#index'

  resources :beaches do
    resources :reviews
  end

  resources :amenities
end
