Rails.application.routes.draw do
  root 'high_voltage/pages#show', id: 'homepage'

  resource :session, only: [:create]
  resources :todos, only: [:index, :new, :create]
end