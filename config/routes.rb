Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'home#index'
  resources :appointments, only: %i[index create update destroy]
  resources :doctors, only: %i[index]
end
