Rails.application.routes.draw do
  devise_for :users
  get 'toppages/index'
  root to: 'toppages#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
