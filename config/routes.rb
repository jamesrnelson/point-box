Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'

  scope :admin, module: :admin, as: :admin do
    resources :users
    resources :rewards
    resources :points
  end

  resources :users, only: %i[new create show]
  resources :rewards, only: %i[index show create update destroy]
  resources :points, only: %i[index create destroy]

  resources :sessions, only: %i[index]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
