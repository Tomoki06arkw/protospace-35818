Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "prototypes#index"
  resources :prototypes do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show] 
  resources :messages, only: [:new, :create]

  
end
