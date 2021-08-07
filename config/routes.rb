Rails.application.routes.draw do
  root "prototypes#index"
  devise_for :users
  get 'messages/new'
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :prototypes do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show] 
  resources :messages, only: [:new, :create]
end
