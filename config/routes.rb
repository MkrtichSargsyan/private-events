Rails.application.routes.draw do
  devise_for :users
  root 'session#index'
end
