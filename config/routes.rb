Rails.application.routes.draw do
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
  root 'jobs#index'
  resources :jobs
end
