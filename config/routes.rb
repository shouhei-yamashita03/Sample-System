Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    Confirmations: 'users/confirmations'
  }
  
  resources :users do
    resources :dash_boards, only: [:index], controller: 'users/dash_boards'
  end

  resources :articles

  devise_scope :user do
    root 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/edit' => 'devise/registrations#edit'
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
