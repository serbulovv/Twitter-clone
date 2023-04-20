Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resource :tweet

  get '/dashboard', to: 'dashboard#index'
  get '/profile', to: 'profile#index'
  post '/profile/update_avatar', to: 'profile#update_avatar'
  post '/profile/update_profile_background', to: 'profile#update_profile_background'
  post '/profile/update_location', to: 'profile#update_location'
  post '/profile/update_bio', to: 'profile#update_bio'
end
