Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    resources :entry_points, only: [:index, :create, :destroy]
    resources :tasks, only: [:index, :create, :update]
    # post '/belongs', to: 'belongs#send'
    resources :belongs, only: [:create]
  end
  get 'message/index'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :organizations, controllers: {
    sessions:      'organizations/sessions',
    passwords:     'organizations/passwords',
    registrations: 'organizations/registrations'
  }
  get 'toppages/index'
  root to: 'rooms#index'

  resources :rooms
  resources :users, only: [:index, :show, :edit, :update, :delete]
  resources :organizations, only: [:index, :show]
  resources :tasks, only: [:index]
  resources :belongs, only: [:index, :create, :destroy]


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  mount ActionCable.server => '/cable'
end
