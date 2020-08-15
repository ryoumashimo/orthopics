Rails.application.routes.draw do
  root 'top#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update, :show]
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
