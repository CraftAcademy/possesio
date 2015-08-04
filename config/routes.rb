Rails.application.routes.draw do


  devise_for :users

  resources :invoices

  root to: 'home#index'
end
