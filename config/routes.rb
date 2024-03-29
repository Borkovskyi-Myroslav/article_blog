Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "articles#index"

  resources :articles do
    resources :comments
  end

  mount ActionCable.server => '/cable'
end
