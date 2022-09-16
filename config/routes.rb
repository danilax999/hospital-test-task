Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'home#index'
  resources :appointments, only: %i[index create update destroy]
  resources :doctors, only: %i[index]
  get 'categories', to: 'categories#index'
  post 'categories/:name/doctor', to: 'categories#add_doctor', as: 'categories_add_doctor'
  delete 'categories/:name/doctor', to: 'categories#delete_doctor', as: 'categories_delete_doctor'
end
