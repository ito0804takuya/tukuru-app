Rails.application.routes.draw do
  root 'jobs#index'
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }
  devise_for :seekers, controllers: {
    sessions:      'seekers/sessions',
    passwords:     'seekers/passwords',
    registrations: 'seekers/registrations'
  }
  resources :companies, only: [:show]
  resources :seekers, only: [:show]
  resources :users, only: [:new]
  resources :jobs
end
