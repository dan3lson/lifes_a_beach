Rails.application.routes.draw do
  devise_for :users
  root 'beaches#index'

  authenticate :user do
    resources :beaches, only: [:new, :create, :edit, :update, :destroy] do
      resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :amenities
  end

  resources :beaches, only: [:index, :show] do
    resources :reviews, only: [:index, :show]
  end

  resources :amenities
end
