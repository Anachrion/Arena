# frozen_string_literal: true
Rails.application.routes.draw do
  resources :weapons
  resources :fights
  resources :fighters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "fights#index"
end
