Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    resources :entry_points, only: [:index, :create, :destroy]
  end
  get 'message/index'
  devise_for :users
  get 'toppages/index'
  root to: 'toppages#index'

  resources :rooms
  resources :entry_points, only: [:create, :destroy]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  mount ActionCable.server => '/cable'
end
