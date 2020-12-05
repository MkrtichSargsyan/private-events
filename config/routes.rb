Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :events

  resources :attendances

  resources :attendances do
    match '/join', to: 'attendances#join', via: :post, on: :collection
  end

  root 'users#index'
end
