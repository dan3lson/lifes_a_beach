Rails.application.routes.draw do
  devise_for :users
  root 'beaches#index'

  resources :amenities

  resources :beaches do
    resources :reviews
  end

  resources :reviews do
    resources :upvotes
    resources :downvotes
  end
end
