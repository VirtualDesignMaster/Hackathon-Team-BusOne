Rails.application.routes.draw do
  resources :matches
  resources :user_skills
  resources :skills
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'users/registrations'
  }
  root 'home#index'
end
