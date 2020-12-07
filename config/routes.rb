Rails.application.routes.draw do

  get 'events/upcoming', to: 'events#show_upcoming'
  get 'events/past', to: 'events#show_past'

  devise_for :users
  resources :users
  resources :events

  resources :attendances

  resources :attendances do
    match '/join', to: 'attendances#join', via: :post, on: :collection
  end

  root 'users#index'
end

# match 'photos/:user' => 'photos#user', :as => :user_photo